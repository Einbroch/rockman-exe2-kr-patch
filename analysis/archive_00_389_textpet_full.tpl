@archive 07E6688
@size 22

script 0 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = PurpleNavi
	textSpeed
		delay = 0
	"""
	いらっしゃいませ!
	(Rボタン:せつめいを見る)
	(Bボタン:かいものをやめる)
	"""
	waitHold
}
script 1 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = PurpleNavi
	textSpeed
		delay = 0
	"""
	どれに いたしましょう?
	(Rボタン:せつめいを見る)
	(Bボタン:かいものをやめる)
	"""
	waitHold
}
script 2 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 17
		jumpIfFalse = continue
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"もう おみせをでるの?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = true
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 3 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = PurpleNavi
	textSpeed
		delay = 0
	"また きてくださいね!"
	waitHold
}
script 4 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = PurpleNavi
	textSpeed
		delay = 0
	"「"
	printItem
		buffer = 1
		item = 0
	"」ですね?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 5 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = PurpleNavi
	textSpeed
		delay = 0
	"「"
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"」ですね?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 6 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 18
		jumpIfFalse = continue
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"「"
	printItem
		buffer = 1
		item = 0
	"」を かったよ!"
	keyWait
	waitHold
}
script 7 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 19
		jumpIfFalse = continue
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"「"
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"」を かったよ!"
	keyWait
	waitHold
}
script 8 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 20
		jumpIfFalse = continue
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"あれ・・・ゼニーがたりないよ"
	keyWait
	waitHold
}
script 9 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 21
		jumpIfFalse = continue
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"あれ・・・これいじょう もてないよ"
	keyWait
	waitHold
}
script 10 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = PurpleNavi
	textSpeed
		delay = 0
	"""
	しょうひんが なくなりました
	おかいあげ ありがとうございました!
	"""
	keyWait
	waitHold
}
script 15 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 6
		padZeros = false
		padLeft = true
	"z"
	end
}
script 16 mmbn2s {
	end
}
script 17 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"オミセヲ デマスカ?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = true
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 18 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"「"
	printItem
		buffer = 1
		item = 0
	"」ヲ カイマシタ"
	keyWait
	waitHold
}
script 19 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"「"
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"」ヲ カイマシタ"
	keyWait
	waitHold
}
script 20 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"ゼニーガ タリマセン"
	keyWait
	waitHold
}
