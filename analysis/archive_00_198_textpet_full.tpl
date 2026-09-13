@archive 077DA38
@size 5

script 0 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 166
	"シューーーン・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やった!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"まだだ!"
	waitSkip
		frames = 30
	"\n・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"""
	フー どうやらホントに
	おとなしくなった みたいだな
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	ね? ほかの人が おどろかないように
	みちのわきに どけておきましょ
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
