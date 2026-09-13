@archive 079611C
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
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
	ロックマンは、
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
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 4
	keyWait
	end
	" "
}
