@archive 076A328
@size 255

script 230 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	checkGiveItem
		item = 112
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 231
		jumpIfSome = 232
	flagSet
		flag = 1368
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 112
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 231 mmbn2 {
	"「"
	printItem
		buffer = 0
		item = 112
	"""
	」が
	いっぱいで もうもてない!
	"""
	keyWait
	end
}
script 232 mmbn2 {
	"「"
	printItem
		buffer = 0
		item = 112
	"""
	」が
	いっぱいになった!
	"""
	keyWait
	end
}
