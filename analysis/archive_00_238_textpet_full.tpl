@archive 0781D54
@size 3

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	でけー!
	これが、マザーコンピュータか!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	かんしんしてる ばあいじゃないでしょ!
	"""
	keyWait
	clearMsg
	"""
	マザーコンピュータが、のっとられたら
	このクニを のっとられたもどうぜんだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
