@archive 079611C
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"응!"
	keyWait
	end
	"  1 "
	mugshotHide
	msgOpen
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 248
		code = F
		amount = 1
	"""
	록맨은
	「
	"""
	printChip
		buffer = 0
		chip = 248
	" "
	printCode
		buffer = 0
		code = F
	"""
	」
	을 사용했다!!
	"""
	playerFinish
	playerAnimate
		animation = 4
	keyWait
	end
	" "
}
