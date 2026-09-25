@archive 077F6AF
@size 2

script 0 mmbn2 {
	msgOpen
	flagSet
		flag = 513
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 14
	"""
	」
	を ゲットした!!
	"""
	keyWait
	clearMsg
	playerFinish
	playerAnimate
		animation = 4
	jump
		target = 6
	"   "
}
