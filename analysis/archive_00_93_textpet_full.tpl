@archive 0769874
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココハ マンション ゼンタイヲ
	ツナイデイル ネットワーク デス
	"""
	keyWait
	clearMsg
	"""
	フツウナラ 1カイ カラ 30カイ マデ
	ネットワークノ ドコニデモ
	イケルノデスガ、
	"""
	keyWait
	clearMsg
	"""
	デンジハイジョウノ セイデ
	ヘンナ トコロニ トバサレチャウ
	トコロガ アリマス!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ソッチカラ キタッテ コトハ
	デンジハノ ミダレ ナオッタンダ!
	"""
	keyWait
	clearMsg
	"コレデ ココカラ ニゲレルヨー!"
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
		flag = 1482
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 51
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 51
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
		flag = 1483
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 127
		code = T
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 127
	" "
	printCode
		buffer = 0
		code = T
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
		flag = 1484
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 1200
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「1200ゼニー」
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
		flag = 1485
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
