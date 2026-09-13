@archive 0781664
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	なんとか、プログラム、ゲットできたね
	でも、なんか わるいことしちゃった
	みたいだね
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
