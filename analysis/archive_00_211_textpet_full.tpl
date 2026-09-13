@archive 077FA20
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	サクっとじけんを かいけつして
	しけんを うけるぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
