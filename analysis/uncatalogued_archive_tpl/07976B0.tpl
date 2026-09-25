@archive 07976B0
@size 102

script 0 mmbn2 {
	msgOpen
	"電磁波が ひどく みだれている!"
	keyWait
	clearMsg
	"""
	ロックマンは
	ふせいな アドレスに とばされた!!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	msgOpen
	"""
	「082ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	エラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
script 11 mmbn2 {
	msgOpen
	"""
	「082ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"「"
	printItem
		buffer = 0
		item = 44
	"」を つかいますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 12,
			jump = continue,
			jump = continue
		]
	end
}
script 12 mmbn2 {
	msgOpen
	flagSet
		flag = 514
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 44
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	jump
		target = 13
}
script 13 mmbn2 {
	flagSet
		flag = 521
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"どうだ?"
	keyWait
	flagSet
		flag = 522
	flagSet
		flag = 524
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うわーーーー!!"
	waitHold
}
script 15 mmbn2 {
	msgOpen
	"""
	「082ごうしつ」の
	電磁波 コントロールプログラムだ
	ここは もう せいじょうに なっている
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ここは・・・"
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	さっきの ところと
	つながってた ばしょ
	"""
	waitSkip
		frames = 30
	"・・・じゃないか?"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"電磁波の みだれ おさまったのかな?"
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"わからねぇ・・・"
	waitSkip
		frames = 30
	"""
	でも
	ワープしてみて へんな アドレスに
	とばされなかったら OKじゃないか?
	"""
	keyWait
	end
}
script 30 mmbn2 {
	msgOpen
	"""
	「253ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	エラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
script 31 mmbn2 {
	msgOpen
	"""
	「253ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"「"
	printItem
		buffer = 0
		item = 49
	"」を つかいますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 32,
			jump = continue,
			jump = continue
		]
	end
}
script 32 mmbn2 {
	msgOpen
	flagSet
		flag = 518
	flagSet
		flag = 521
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 49
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	flagSet
		flag = 522
	waitHold
}
script 33 mmbn2 {
	msgOpen
	"""
	「253ごうしつ」の
	電磁波 コントロールプログラムだ
	ここは もう せいじょうに なっている
	"""
	keyWait
	end
}
script 40 mmbn2 {
	msgOpen
	"""
	「271ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	エラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
script 41 mmbn2 {
	msgOpen
	"""
	「271ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"「"
	printItem
		buffer = 0
		item = 50
	"」を つかいますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 42,
			jump = continue,
			jump = continue
		]
	end
}
script 42 mmbn2 {
	msgOpen
	flagSet
		flag = 519
	flagSet
		flag = 521
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 50
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	flagSet
		flag = 522
	waitHold
}
script 43 mmbn2 {
	msgOpen
	"""
	「271ごうしつ」の
	電磁波 コントロールプログラムだ
	ここは もう せいじょうに なっている
	"""
	keyWait
	end
}
script 50 mmbn2 {
	msgOpen
	"""
	「042ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	エラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
script 51 mmbn2 {
	msgOpen
	"""
	「042ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"「"
	printItem
		buffer = 0
		item = 43
	"」を つかいますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 52,
			jump = continue,
			jump = continue
		]
	end
}
script 52 mmbn2 {
	msgOpen
	flagSet
		flag = 512
	flagSet
		flag = 521
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 43
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	flagSet
		flag = 522
	waitHold
}
script 53 mmbn2 {
	msgOpen
	"""
	「042ごうしつ」の
	電磁波 コントロールプログラムだ
	ここは もう せいじょうに なっている
	"""
	keyWait
	end
}
script 60 mmbn2 {
	msgOpen
	"""
	「093ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	エラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
script 61 mmbn2 {
	msgOpen
	"""
	「093ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"「"
	printItem
		buffer = 0
		item = 45
	"」を つかいますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 62,
			jump = continue,
			jump = continue
		]
	end
}
script 62 mmbn2 {
	msgOpen
	flagSet
		flag = 513
	flagSet
		flag = 521
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 45
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	flagSet
		flag = 522
	waitHold
}
script 63 mmbn2 {
	msgOpen
	"""
	「093ごうしつ」の
	電磁波 コントロールプログラムだ
	ここは もう せいじょうに なっている
	"""
	keyWait
	end
}
script 70 mmbn2 {
	msgOpen
	"""
	「201ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	エラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
script 71 mmbn2 {
	msgOpen
	"""
	「201ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"「"
	printItem
		buffer = 0
		item = 46
	"」を つかいますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 72,
			jump = continue,
			jump = continue
		]
	end
}
script 72 mmbn2 {
	msgOpen
	flagSet
		flag = 516
	flagSet
		flag = 521
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 46
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	flagSet
		flag = 522
	waitHold
}
script 73 mmbn2 {
	msgOpen
	"""
	「201ごうしつ」の
	電磁波 コントロールプログラムだ
	ここは もう せいじょうに なっている
	"""
	keyWait
	end
}
script 80 mmbn2 {
	msgOpen
	"""
	「232ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	エラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
script 81 mmbn2 {
	msgOpen
	"""
	「232ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"「"
	printItem
		buffer = 0
		item = 47
	"」を つかいますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 82,
			jump = continue,
			jump = continue
		]
	end
}
script 82 mmbn2 {
	msgOpen
	flagSet
		flag = 515
	flagSet
		flag = 521
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 47
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	flagSet
		flag = 522
	waitHold
}
script 83 mmbn2 {
	msgOpen
	"""
	「232ごうしつ」の
	電磁波 コントロールプログラムだ
	ここは もう せいじょうに なっている
	"""
	keyWait
	end
}
script 90 mmbn2 {
	msgOpen
	"""
	「243ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	エラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
script 91 mmbn2 {
	msgOpen
	"""
	「243ごうしつ」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギ・・・"
	soundPlay
		track = 187
	"ガギ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	"「"
	printItem
		buffer = 0
		item = 48
	"」を つかいますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 92,
			jump = continue,
			jump = continue
		]
	end
}
script 92 mmbn2 {
	msgOpen
	flagSet
		flag = 517
	flagSet
		flag = 521
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 48
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	flagSet
		flag = 522
	waitHold
}
script 93 mmbn2 {
	msgOpen
	"""
	「243ごうしつ」の
	電磁波 コントロールプログラムだ
	ここは もう せいじょうに なっている
	"""
	keyWait
	end
}
script 100 mmbn2 {
	msgOpen
	"""
	「エレベーター」の
	電磁波 コントロールプログラム・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 187
	"ガギゴ・・・"
	soundPlay
		track = 187
	"ガギグ・・・!"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	はげしくエラーが 出ているようだ
	電磁波の バランスが くずれ
	つよい 電磁波が はっせいしている
	"""
	keyWait
	end
}
