@archive 0787F0C
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、そろそろ12じだ
	おひるゴハンのじかんだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
