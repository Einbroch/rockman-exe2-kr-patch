@archive 07813C5
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"좋아!"
	keyWait
	end
	" 1 "
	mugshotHide
	msgOpen
	"""
	록맨은
	「
	"""
	printItem
		buffer = 0
		item = 19
	"""
	」
	을 사용했다!!
	"""
	keyWait
	flagSet
		flag = 32
	end
}
