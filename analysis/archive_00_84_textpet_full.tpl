@archive 07683C0
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ゾンビハ アタマガ ワルクテ
	ワキミチニハ ハイッテ コナインダヨ
	"""
	keyWait
	clearMsg
	"""
	ギャクニ
	キュウケツキハ カシコクテ
	ケッコウ オイカケテ クルンダ
	"""
	keyWait
	clearMsg
	"""
	ソレト モヒトツ
	オバケタチハ トビラヲ コエテ
	オイカケテ クルコトハ ナイヨ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	トウゾクガ デタヨ!
	オカネヲ トラレチャッタ・・・
	フクロヲ モッタ ヤツダッタヨ!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	トウゾクハ
	ヒダリニ マガルノガ
	ダイスキ ナンダッテ!
	"""
	keyWait
	clearMsg
	"""
	・・・ヒダリハ
	オチャワンヲ モツホウ ダヨ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 48
		upper = 255
		jumpIfInRange = 228
		jumpIfOutOfRange = continue
	checkFlag
		flag = 557
		jumpIfTrue = 227
		jumpIfFalse = continue
	msgOpen
	"""
	トラップを
	せいぎょしている プログラムだ!
	"""
	keyWait
	clearMsg
	"ロックマンは、\n"
	soundPlay
		track = 166
	"プログラムを ていしさせた!!"
	keyWait
	clearMsg
	flagSet
		flag = 557
	jump
		target = 225
}
script 221 mmbn2 {
	checkItem
		item = 26
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
		jumpIfLess = continue
	msgOpen
	"""
	電脳トビラが 行く手を ふさいでいる!
	ひらくには 
	"""
	printItem
		buffer = 0
		item = 26
	"が ひつようだ!"
	keyWait
	end
}
script 222 mmbn2 {
	checkItem
		item = 26
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
		jumpIfLess = continue
	msgOpen
	"""
	電脳トビラが 行く手を ふさいでいる!
	ひらくには 
	"""
	printItem
		buffer = 0
		item = 26
	"が ひつようだ!"
	keyWait
	end
}
script 223 mmbn2s {
	end
}
script 225 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! てんじょうが おちてくる前に
	はやく だっしゅつ しよう!!
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	トラップを
	せいぎょしている プログラムだ
	すでに とまっている・・・
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	トラップを
	せいぎょしている プログラムだ
	いまは なにも しなくていい・・・
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
		flag = 1445
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 26
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 26
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
		flag = 1446
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 26
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 26
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
	"""
	なんと!
	中には とうぞくプログラムに とられた
	ゼニーが はいっていた!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 1447
	playerLock
	playerAnimate
		animation = 24
	startClearBanditZenny
		comp = 1
	"""
	ロックマンは、
	「
	"""
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	ゼニー」
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
		flag = 1448
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 140
		code = C
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 140
	" "
	printCode
		buffer = 0
		code = C
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
	checkGiveItem
		item = 113
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 236
		jumpIfSome = 236
	flagSet
		flag = 1465
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
script 235 mmbn2 {
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
		flag = 1466
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 23
		code = S
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 23
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
script 236 mmbn2 {
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
