@archive 0783D7C
@size 17

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	キケンなものを もってないかの
	チェックを ここで するみたいだよ
	ちょっと ドキドキ しちゃうね
	"""
	keyWait
	end
}
script 1 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 286
	"ブーーーー!!!"
	wait
		frames = 30
	soundEnableTextSFX
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ん? ボク、わるいけど もういちど
	ゲートを くぐってもらえるかな
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、なにか アブナいもの
	もってたっけ?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"いーや、しらないぜ"
	keyWait
	end
}
script 5 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 286
	"ブーブブブーーー!!!"
	wait
		frames = 30
	soundEnableTextSFX
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ゴメンね、
	ちょっと しんたいけんさを するよ・・・
	"""
	waitSkip
		frames = 30
	"\nあーダメだよ、PETなんて もちこんじゃ"
	keyWait
	clearMsg
	"""
	さいきん ネットマフィアとやらが
	いるらしいからね
	そこらへん キビしいんだ
	"""
	keyWait
	clearMsg
	"""
	PETは あずかるよ
	アメロッパの くうこうで かえすことに
	なるからね
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ダメだよ! オレ
	いつも ロックマンと いっしょで・・・
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ハハハッ だいじょうぶ!
	ふじゆうは ないように ミニPETを
	かしてあげるからね
	"""
	keyWait
	clearMsg
	"じゃ、PETを あずかるよ"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あっ! ダメだって!"
	keyWait
	clearMsg
	soundStop
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗く~~ん! たすけて~~!"
	keyWait
	clearMsg
	flagSet
		flag = 520
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotHide
	msgOpen
	"""
	熱斗は、
	「PET」
	を とりあげられた!!
	"""
	keyWait
	clearMsg
	soundPlay
		track = 133
	"""
	かわりに 熱斗は、
	「ミニPET」
	を ゲットした!!
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"・・・はい、どうも"
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"さ キミ、これを"
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"はい、では おあずかりします"
	keyWait
	clearMsg
	flagSet
		flag = 520
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちょっと まってよ!"
	waitSkip
		frames = 30
	"\n"
	playerAnimate
		animation = 1
	flagClear
		flag = 519
	"こら! かってに もっていくなー!"
	wait
		frames = 60
	clearMsg
	jump
		target = 16
}
