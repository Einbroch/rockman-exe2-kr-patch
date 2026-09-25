@archive 0734AE7
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	flagSet
		flag = 58
	"それじゃ、"
	printItem
		buffer = 2
		item = 0
	"""
	の
	データにうわがきするぞ
	いいか?
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
	"いいよ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"やっぱやめ!"
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
