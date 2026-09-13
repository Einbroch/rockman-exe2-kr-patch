@archive 079544C
@size 3

script 0 mmbn2 {
	mugshotShow
		mugshot = PharaohMan
	msgOpen
	"""
	わがなは、ファラオマン・・・
	このちを しゅごするモノなり・・・
	"""
	keyWait
	clearMsg
	"""
	われは、しせども われのタマシイは
	えいえんに このちを
	まもりつづけるであろう
	"""
	keyWait
	clearMsg
	"グオオオオオオオオ!!"
	waitHold
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"てごわい あいてだったね・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
