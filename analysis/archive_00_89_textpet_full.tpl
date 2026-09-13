@archive 0768F08
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ギア セイギョ プログラム ハ
	コノサキニ アリマス・・・
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
		flag = 625
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
		flag = 625
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
		flag = 626
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
		flag = 626
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
		flag = 557
		jumpIfTrue = 225
		jumpIfFalse = continue
	checkFlag
		flag = 562
		jumpIfTrue = continue
		jumpIfFalse = 225
	flagSet
		flag = 557
	wait
		frames = 1
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ひこうきのタイヤをせいぎょする
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
		flag = 1515
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 2
		code = E
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 2
	" "
	printCode
		buffer = 0
		code = E
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
		flag = 1516
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 500
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「500ゼニー」
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
		flag = 1517
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 69
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 69
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
		flag = 1518
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
		flag = 1519
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 1500
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「1500ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
