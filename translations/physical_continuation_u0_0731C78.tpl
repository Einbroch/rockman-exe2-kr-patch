@archive 07327A3
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	flagSet
		flag = 58
	"그럼 "
	printItem
		buffer = 2
		item = 0
	"""
	의
	데이터에 덮어쓰겠다
	괜찮겠니?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"""
	좋아
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"역시 그만둘래!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 66,
			jump = 65,
			jump = continue
		]
	end
}
