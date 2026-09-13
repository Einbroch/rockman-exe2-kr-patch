@archive 0769104
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ウヨク セイギョ プログラム ハ、
	コノサキニ アリマス・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシタチ ハ、ヒコウキ ノ
	ナカニ ハッセイシタ
	ジバヲ トリノゾク プログラムデスガ
	"""
	keyWait
	clearMsg
	"""
	ワレワレデモ トリキレナイ ジバガ
	ハッセイ シテイマス・・・
	"""
	keyWait
	clearMsg
	"""
	コウナッタラ、カク エリアニアル
	「ジリョク ショウキョ ソウチ」ヲ
	"""
	keyWait
	clearMsg
	"""
	シュドウデ ソウサ シナイト
	イケマセン・・・
	"""
	keyWait
	clearMsg
	"""
	「ジリョク ショウキョ ソウチ」ハ
	カク エリア 2ダイ ズツアッテ、
	"""
	keyWait
	clearMsg
	"""
	ソレゾレ アカジリョク ト、
	アオジリョクヲ ショウキョ スルコトガ
	デキマス
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
	うよくせいぎょプログラムを なおすんだ!
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
		flag = 627
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
		flag = 627
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
		flag = 628
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
		flag = 628
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
		flag = 553
		jumpIfTrue = 225
		jumpIfFalse = continue
	checkFlag
		flag = 558
		jumpIfTrue = continue
		jumpIfFalse = 225
	msgOpen
	"""
	ロックマンは、
	うよくせいぎょプログラムの
	バグを とりのぞいた!
	"""
	keyWait
	clearMsg
	"""
	うよくせいぎょプログラムが
	せいじょうに さどう しはじめた!
	"""
	keyWait
	flagSet
		flag = 553
	wait
		frames = 1
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ひこうきのツバサのバランスを
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
		flag = 1520
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 3000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「3000ゼニー」
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
	checkGiveItem
		item = 113
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 233
		jumpIfSome = 233
	flagSet
		flag = 1521
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 113
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
		flag = 1522
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 175
		code = N
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 175
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
script 233 mmbn2 {
	"「"
	printItem
		buffer = 0
		item = 113
	"""
	」が
	いっぱいで もうもてない!
	"""
	keyWait
	end
}
