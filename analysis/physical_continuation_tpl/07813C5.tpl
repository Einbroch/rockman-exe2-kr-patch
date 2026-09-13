@archive 07813C5
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おう!"
	keyWait
	end
	" 1 "
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 19
	"""
	」
	を つかった!!
	"""
	keyWait
	flagSet
		flag = 32
	end
}
