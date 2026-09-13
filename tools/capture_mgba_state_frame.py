#!/usr/bin/env python3
"""Launch mGBA with a supplied state and capture its 240x160 client frame."""

from __future__ import annotations

import argparse
import ctypes
import hashlib
import json
import subprocess
import time
from ctypes import wintypes
from pathlib import Path

from PIL import Image, ImageGrab


user32 = ctypes.WinDLL("user32", use_last_error=True)
EnumWindowsProc = ctypes.WINFUNCTYPE(wintypes.BOOL, wintypes.HWND, wintypes.LPARAM)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def mgba_windows() -> list[tuple[int, int]]:
    matches: list[tuple[int, int]] = []

    @EnumWindowsProc
    def callback(window: int, parameter: int) -> bool:
        del parameter
        if not user32.IsWindowVisible(window):
            return True
        length = user32.GetWindowTextLengthW(window)
        title = ctypes.create_unicode_buffer(length + 1)
        user32.GetWindowTextW(window, title, length + 1)
        if "mGBA" not in title.value:
            return True
        owner = wintypes.DWORD()
        user32.GetWindowThreadProcessId(window, ctypes.byref(owner))
        matches.append((window, owner.value))
        return True

    if not user32.EnumWindows(callback, 0):
        raise ctypes.WinError(ctypes.get_last_error())
    return matches


def new_mgba_window(existing: set[int], timeout: float) -> tuple[int, int]:
    deadline = time.monotonic() + timeout
    while time.monotonic() < deadline:
        matches = [item for item in mgba_windows() if item[0] not in existing]
        if matches:
            return matches[0]
        time.sleep(0.05)
    raise TimeoutError("mGBA did not create a visible window")


def client_box(window: int) -> tuple[int, int, int, int]:
    rectangle = wintypes.RECT()
    if not user32.GetClientRect(window, ctypes.byref(rectangle)):
        raise ctypes.WinError(ctypes.get_last_error())
    origin = wintypes.POINT(0, 0)
    if not user32.ClientToScreen(window, ctypes.byref(origin)):
        raise ctypes.WinError(ctypes.get_last_error())
    width = rectangle.right - rectangle.left
    height = rectangle.bottom - rectangle.top
    if width <= 0 or height <= 0:
        raise ValueError("mGBA client area is empty")
    return origin.x, origin.y, origin.x + width, origin.y + height


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--mgba", type=Path, required=True)
    parser.add_argument("--rom", type=Path, required=True)
    parser.add_argument("--state", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--settle-seconds", type=float, default=3.0)
    parser.add_argument("--advance-pages", type=int, default=0)
    parser.add_argument("--advance-key-virtual", type=lambda value: int(value, 0), default=0x58)
    parser.add_argument("--advance-settle-seconds", type=float, default=2.5)
    parser.add_argument("--force", action="store_true")
    args = parser.parse_args()

    for source in (args.mgba, args.rom, args.state):
        if not source.is_file():
            raise FileNotFoundError(source)
    for output in (args.output, args.manifest):
        if output.exists() and not args.force:
            raise FileExistsError(f"output already exists: {output} (pass --force to replace it)")
    if args.advance_pages < 0:
        raise ValueError("advance-pages cannot be negative")
    if args.advance_settle_seconds < 0:
        raise ValueError("advance-settle-seconds cannot be negative")
    if not 0 <= args.advance_key_virtual <= 0xFF:
        raise ValueError("advance-key-virtual must fit in one virtual-key byte")

    args.output.parent.mkdir(parents=True, exist_ok=True)
    existing_pngs = {path.resolve() for path in args.output.parent.glob("*.png")}
    existing_windows = {window for window, _ in mgba_windows()}
    launcher = subprocess.Popen(
        [
            str(args.mgba.resolve()),
            "-1",
            "-C", f"screenshotPath={args.output.parent.resolve()}",
            "-t", str(args.state.resolve()),
            str(args.rom.resolve()),
        ],
        cwd=str(args.rom.resolve().parent),
    )
    window = None
    emulator_process_id = None
    capture_method = None
    try:
        window, emulator_process_id = new_mgba_window(existing_windows, 10.0)
        user32.ShowWindow(window, 9)
        user32.SetWindowPos(window, -1, 100, 100, 0, 0, 0x0001 | 0x0040)
        user32.SetForegroundWindow(window)
        time.sleep(args.settle_seconds)
        for _ in range(args.advance_pages):
            user32.PostMessageW(window, 0x0100, args.advance_key_virtual, 0)
            time.sleep(0.05)
            user32.PostMessageW(window, 0x0101, args.advance_key_virtual, 0)
            time.sleep(args.advance_settle_seconds)
        # mGBA 0.10.5 binds its native screenshot action to F12.  Using the
        # Windows Print Screen key only captures whichever desktop window is
        # visible behind the hardware-rendered client surface.
        user32.PostMessageW(window, 0x0100, 0x7B, 0)
        user32.PostMessageW(window, 0x0101, 0x7B, 0)
        time.sleep(1.0)
        native = [path for path in args.output.parent.glob("*.png") if path.resolve() not in existing_pngs]
        if len(native) == 1:
            frame = Image.open(native[0]).convert("RGB")
            capture_method = "mgba_print_screen_hotkey"
        else:
            box = client_box(window)
            frame = ImageGrab.grab(bbox=box, all_screens=True)
            capture_method = "desktop_client_fallback"
        if frame.size == (240, 181) and capture_method == "desktop_client_fallback":
            # Some Qt configurations include the 21-pixel menu bar in the
            # client rectangle.  The emulated 240x160 surface starts below
            # it; crop only this known wrapper shape.
            frame = frame.crop((0, frame.height - 160, 240, frame.height))
            capture_method = "desktop_client_fallback_cropped_qt_menu"
        if frame.size != (240, 160):
            raise ValueError(f"unexpected mGBA frame size: {frame.size}")
        frame.save(args.output)
        for temporary in native:
            if temporary.resolve() != args.output.resolve():
                temporary.unlink()
    finally:
        if window is not None and user32.IsWindow(window):
            user32.PostMessageW(window, 0x0010, 0, 0)
        if launcher.poll() is None:
            launcher.terminate()
        try:
            launcher.wait(timeout=5)
        except subprocess.TimeoutExpired:
            launcher.kill()
            launcher.wait(timeout=5)

    output_bytes = args.output.read_bytes()
    report = {
        "schema_version": 1,
        "kind": "mgba_state_frame_capture",
        "emulator": {
            "filename": args.mgba.name,
            "version": "0.10.5",
            "runtime_process_id": emulator_process_id,
        },
        "rom": {"filename": args.rom.name, "sha256": sha256(args.rom.read_bytes())},
        "state": {"filename": args.state.name, "sha256": sha256(args.state.read_bytes())},
        "capture": {
            "settle_seconds": args.settle_seconds,
            "advance_pages": args.advance_pages,
            "advance_key_virtual": f"0x{args.advance_key_virtual:02X}",
            "advance_settle_seconds": args.advance_settle_seconds,
            "method": capture_method,
            "client_pixels": [240, 160],
            "filename": args.output.name,
            "sha256": sha256(output_bytes),
        },
        "notice": "The capture inherits the intervention boundary documented by the supplied state.",
    }
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(report["capture"], ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
