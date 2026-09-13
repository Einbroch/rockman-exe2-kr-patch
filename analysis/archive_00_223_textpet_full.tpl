@archive 0780DE8
@size 3

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ニホンに ききが
	せまってるコトはやく・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	わかってる
	パパのところに いこう!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
