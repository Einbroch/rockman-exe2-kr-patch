@archive 077C640
@size 16

script 0 mmbn2 {
	msgOpen
	"そのころ・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	flagSet
		flag = 568
	mugshotShow
		mugshot = Arashi
	msgOpen
	"もしもし、"
	waitSkip
		frames = 30
	"アラシですが"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ざんねんな けっかに
	おわったようだな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"ちょっと ミスっちまってさ"
	waitSkip
		frames = 30
	"\nま、つぎのチャンスでは とりかえすぜ!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	キミは わかっていないようだな、
	われわれ「ゴスペル」の きびしさを・・・
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"おい、ちょっと 大げさだぜ"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	われわれは 世界中で
	ネットマフィアとよばれ おそれられている
	このニホンでも すぐにそうなるのだ
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"だから なんだってんだよ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	いや、もういい、
	もうキミに チャンスはない
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"""
	ハ! なら
	こっちも おことわりさ!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"では・・・"
	waitSkip
		frames = 30
	"さようなら・・・"
	waitSkip
		frames = 30
	"\nバクハツまで あと3びょうだ・・・"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"なんだとっ!"
	soundStop
	keyWait
	end
}
script 12 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 257
	"カッチ "
	wait
		frames = 45
	soundPlay
		track = 257
	"カッチ "
	wait
		frames = 45
	soundPlay
		track = 257
	"カッチ"
	wait
		frames = 45
	soundEnableTextSFX
	jump
		target = 13
}
script 13 mmbn2 {
	controlUnlock
	mugshotShow
		mugshot = Arashi
	msgOpen
	"あれか!"
	flagClear
		flag = 568
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"フン、われわれを・・・"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	"""
	「ゴスペル」を あまく見てもらっては
	こまるんだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
