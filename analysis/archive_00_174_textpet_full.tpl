@archive 077B6E0
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン!?"
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
	うん、とくに かわったようすは
	なさそうだけど・・・
	"""
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
	でも、プログラムが おかしいってことは
	きっと なにかあるぜ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"わかってる、ゆだんは しないよ!"
	keyWait
	clearMsg
	jump
		target = 4
}
