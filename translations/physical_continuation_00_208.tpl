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
	넷토는
	「
	"""
	printItem
		buffer = 0
		item = 14
	"""
	」
	을 손에 넣었다!!
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
