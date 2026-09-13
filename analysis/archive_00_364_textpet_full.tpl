@archive 0738134
@size 16

script 0 mmbn2 {
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 9
		jumpIfOutOfRange = continue
	checkChapter
		lower = 30
		upper = 30
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	jump
		target = 3
}
script 1 mmbn2 {
	checkChapter
		lower = 5
		upper = 5
		jumpIfInRange = continue
		jumpIfOutOfRange = 0
	checkFlag
		flag = 547
		jumpIfTrue = 0
		jumpIfFalse = continue
	checkFlag
		flag = 546
		jumpIfTrue = 0
		jumpIfFalse = continue
	flagSet
		flag = 546
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	OK! じゃ、ボク
	ガスゆわかしきのプログラムを
	しらべてくる!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	"たのむ!"
	keyWait
	clearMsg
	jump
		target = 0
}
script 2 mmbn2 {
	checkChapter
		lower = 38
		upper = 38
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	msgOpen
	"""
	ロックマンは すでに
	でんのうせかいの 中にいる!
	"""
	keyWait
	flagSet
		flag = 2140
	end
}
script 3 mmbn2 {
	checkFlag
		flag = 5
		jumpIfTrue = 2
		jumpIfFalse = continue
	controlLock
	textSpeed
		delay = 1
	mugshotShow
		mugshot = Lan
	msgOpen
	"プラグイン!!"
	wait
		frames = 10
	"\nロックマン.EXE、"
	wait
		frames = 10
	"トランスミッション!"
	wait
		frames = 30
	controlUnlock
	end
}
script 5 mmbn2 {
	checkSubArea
		lower = 3
		upper = 3
		jumpIfInRange = 7
		jumpIfOutOfRange = continue
	checkFlag
		flag = 653
		jumpIfTrue = continue
		jumpIfFalse = 6
	checkFlag
		flag = 655
		jumpIfTrue = 0
		jumpIfFalse = continue
	checkFlag
		flag = 658
		jumpIfTrue = 11
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こんなところに
	PETが おちてるなんて あやしいね!
	"""
	keyWait
	clearMsg
	"プラグインして 中を しらべてこようか?\n"
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
		clear = true
		targets = [
			jump = continue,
			jump = 8,
			jump = continue
		]
	flagSet
		flag = 655
	jump
		target = 3
}
script 6 mmbn2 {
	checkFlag
		flag = 656
		jumpIfTrue = 0
		jumpIfFalse = continue
	checkFlag
		flag = 659
		jumpIfTrue = 12
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	これ 水とうの かたちをした
	きばくそうち みたいだね!
	"""
	keyWait
	clearMsg
	"プラグインして 中を しらべてこようか?\n"
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
		clear = true
		targets = [
			jump = continue,
			jump = 8,
			jump = continue
		]
	flagSet
		flag = 656
	jump
		target = 3
}
script 7 mmbn2 {
	checkFlag
		flag = 657
		jumpIfTrue = 0
		jumpIfFalse = continue
	checkFlag
		flag = 660
		jumpIfTrue = 13
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こんなところに PETが おちてる!
	さっきまでは なかったのに・・・
	"""
	keyWait
	clearMsg
	"プラグインして 中を しらべてこようか?\n"
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
		clear = true
		targets = [
			jump = continue,
			jump = 8,
			jump = continue
		]
	flagSet
		flag = 657
	jump
		target = 3
}
script 8 mmbn2 {
	flagSet
		flag = 2140
	end
}
script 9 mmbn2 {
	checkFlag
		flag = 647
		jumpIfTrue = continue
		jumpIfFalse = 3
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、
	いまは しけんちゅうじゃないから
	プラグインできないよ
	"""
	keyWait
	flagSet
		flag = 2140
	end
}
script 10 mmbn2 {
	checkFlag
		flag = 647
		jumpIfTrue = continue
		jumpIfFalse = 3
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	はやく、メインシステムを
	しらべてこい!
	"""
	keyWait
	flagSet
		flag = 2140
	end
}
script 11 mmbn2 {
	flagSet
		flag = 655
	jump
		target = 0
}
script 12 mmbn2 {
	flagSet
		flag = 656
	jump
		target = 0
}
script 13 mmbn2 {
	flagSet
		flag = 657
	jump
		target = 0
}
