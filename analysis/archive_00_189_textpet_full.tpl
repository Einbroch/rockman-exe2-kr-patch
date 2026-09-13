@archive 077CDE4
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ま、マイった! これを かえすから
	カンベン してくれや・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 5
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 1
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	らくしょー? だな!
	さ 「
	"""
	printItem
		buffer = 0
		item = 5
	"""
	」、
	さっきのナビに かえしに 行こうぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
