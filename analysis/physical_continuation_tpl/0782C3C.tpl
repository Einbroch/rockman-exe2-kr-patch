@archive 0782C3C
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"""
	どうした、かかってこぬのか?
	なら、こちらから ゆくぞ
	"""
	keyWait
	clearMsg
	"""
	いざ、じんじょうに
	・
	"""
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"しょうぶ!"
	keyWait
	end
	"   "
}
