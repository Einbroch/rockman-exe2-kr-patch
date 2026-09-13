@archive 07E70E8
@size 22

script 0 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = NormalNavi
	textSpeed
		delay = 0
	mugshotPalette
		palette = 1
	"""
	いらっしゃいませ!
	(Rボタン:せつめいを見る)
	(Bボタン:こうかんをやめる)
	"""
	waitHold
}
script 1 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = NormalNavi
	textSpeed
		delay = 0
	mugshotPalette
		palette = 1
	"""
	どれに いたしましょう?
	(Rボタン:せつめいを見る)
	(Bボタン:こうかんをやめる)
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
		mugshot = NormalNavi
	textSpeed
		delay = 0
	mugshotPalette
		palette = 1
	"また きてくださいね!"
	waitHold
}
script 4 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = NormalNavi
	textSpeed
		delay = 0
	mugshotPalette
		palette = 1
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
		mugshot = NormalNavi
	textSpeed
		delay = 0
	mugshotPalette
		palette = 1
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
	"""
	」
	を こうかんしてもらったよ!
	"""
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
	"""
	」
	を こうかんしてもらったよ!
	"""
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
	"""
	あれ・・・
	「
	"""
	printItem
		buffer = 0
		item = 69
	"」が たりないよ"
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
		mugshot = NormalNavi
	textSpeed
		delay = 0
	mugshotPalette
		palette = 1
	"""
	しょうひんが なくなりました
	ごきょうりょく ありがとうございました!
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
	"コ"
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
	"「"
	printItem
		buffer = 0
		item = 69
	"」ガ タリマセン"
	keyWait
	waitHold
}
