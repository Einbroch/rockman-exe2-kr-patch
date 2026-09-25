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
	넷토는
	「
	"""
	printItem
		buffer = 0
		item = 0
	"""
	」
	을 손에 넣었다!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
	" "
}
