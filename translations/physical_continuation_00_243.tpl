@archive 0782C3C
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"""
	어찌 된 일이냐、 오지 않느냐?
	그렇다면 내가 가겠다
	"""
	keyWait
	clearMsg
	"""
	자、 정정당당히
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
	"승부!"
	keyWait
	end
	"   "
}
