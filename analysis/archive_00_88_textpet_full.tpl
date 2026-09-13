@archive 0768C60
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ウウ、モノスゴイ ジバ ガ
	ハッセイ シテイマス・・・
	"""
	keyWait
	clearMsg
	"""
	コンナ ジリョクノ ナカデハ、
	ワタシタチ プログラムハ
	マトモニ サドウ デキマセン・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	スロットルプログラム ハ
	コノサキニ アリマス
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
	スロットルプログラムをなおすんだ!
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
		flag = 623
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
		flag = 623
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
		flag = 624
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
		flag = 624
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
		flag = 556
		jumpIfTrue = 225
		jumpIfFalse = continue
	checkFlag
		flag = 561
		jumpIfTrue = continue
		jumpIfFalse = 225
	msgOpen
	"""
	ロックマンは、スロットルプログラムの
	バグを とりのぞいた!!
	"""
	keyWait
	clearMsg
	"""
	スロットルプログラムが
	せいじょうに さどう しはじめた!!
	"""
	keyWait
	flagSet
		flag = 556
	wait
		frames = 1
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ひこうきのパワーをせいぎょする
	コントロールパネルだ
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
		flag = 1510
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 144
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 144
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
		flag = 1511
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 2000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「2000ゼニー」
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
		flag = 1512
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 98
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 98
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
	1メガ ふえた!!
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
		flag = 1513
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 69
		code = N
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 69
	" "
	printCode
		buffer = 0
		code = N
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 234 mmbn2 {
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
		flag = 1514
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 800
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「800ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
