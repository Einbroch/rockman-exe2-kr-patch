@archive 078521D
@size 2

script 0 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	soundPlay
		track = 133
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 0
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
	" "
}
