@archive 0769400
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ビヨク プログラム ハ、
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
	びよくせいぎょプログラムを なおすんだ!
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
		flag = 629
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
		flag = 629
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
		flag = 630
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
		flag = 630
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
		flag = 554
		jumpIfTrue = 225
		jumpIfFalse = continue
	checkFlag
		flag = 559
		jumpIfTrue = continue
		jumpIfFalse = 225
	msgOpen
	"""
	ロックマンは、びよくプログラムの
	バグを とりのぞいた!
	"""
	keyWait
	clearMsg
	"""
	びよくプログラムが
	せいじょうに きのう しはじめた
	"""
	keyWait
	flagSet
		flag = 554
	wait
		frames = 1
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ひこうきの しんろを
	せいぎょするコントロールパネルだ
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
		flag = 1524
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 900
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「900ゼニー」
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
		flag = 1525
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 96
	"""
	」
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
		flag = 1526
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 99
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 99
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	"""
	レギュラーメモリの ようりょうが、
	2メガ ふえた!!
	"""
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
		flag = 1527
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 17
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 17
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
