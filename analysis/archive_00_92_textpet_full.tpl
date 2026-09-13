@archive 0769648
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	キアツチョウセイ プログラム ハ、
	コノサキニ アリマス・・・
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、
	きあつちょうせいプログラムを なおすんだ!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 48
		upper = 63
		jumpIfInRange = continue
		jumpIfOutOfRange = 221
	checkFlag
		flag = 631
		jumpIfTrue = 221
		jumpIfFalse = continue
	msgOpen
	"""
	ロックマンは、
	アカじりょく しょうきょそうちを
	さどうさせた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 631
	flagSet
		flag = 633
	"""
	エリアないの
	アカじりょくが、しょうめつした!
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	ひこうきのなかに はっせいした
	じりょくを、とりのぞくそうちだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkChapter
		lower = 48
		upper = 63
		jumpIfInRange = continue
		jumpIfOutOfRange = 223
	checkFlag
		flag = 632
		jumpIfTrue = 223
		jumpIfFalse = continue
	msgOpen
	"""
	ロックマンは、
	アオじりょく しょうきょそうちを
	さどうさせた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 632
	flagSet
		flag = 634
	"""
	エリアないの
	アオじりょくが、しょうめつした!
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ひこうきのなかに はっせいした
	じりょくを、とりのぞくそうちだ
	"""
	keyWait
	end
}
script 224 mmbn2 {
	checkFlag
		flag = 555
		jumpIfTrue = 225
		jumpIfFalse = continue
	checkFlag
		flag = 560
		jumpIfTrue = continue
		jumpIfFalse = 225
	msgOpen
	"""
	ロックマンは、
	きあつちょうせいプログラムの
	バグを とりのぞいた!
	"""
	keyWait
	clearMsg
	"""
	きあつちょうせいプログラムが
	せいじょうに さどう しはじめた!!
	"""
	keyWait
	flagSet
		flag = 555
	wait
		frames = 1
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ひこうきないの きあつを
	ちょうせいするコントロールパネルだ
	"""
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1576
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 126
		code = S
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 126
	" "
	printCode
		buffer = 0
		code = S
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 231 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1578
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 1800
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「1800ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 232 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1579
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 112
		code = L
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 112
	" "
	printCode
		buffer = 0
		code = L
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 233 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1580
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 1000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「1000ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
