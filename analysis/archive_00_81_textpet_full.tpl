@archive 0767A80
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"アカ、クロ"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ミズタマ"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"アシガ ロッポン"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"コンチュウ"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"コノ ハシ ワタルナ"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	セカイノ マンナカニイル
	ムシ ハ、ナ~ンダ?
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシハ、プログラム1デス
	ワタシノ カンリスル
	パスワードハ コレデス
	"""
	keyWait
	clearMsg
	"「ケトヲノマ」"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシハ、プログラム2デス
	ワタシノ カンリスル
	パスワードハ コレデス
	"""
	keyWait
	clearMsg
	"「ンウイリス」"
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	イマカラ イウコトノ
	イミヲ、ヨクカンガエテ
	クダサイ
	"""
	keyWait
	clearMsg
	"""
	ソレガ、パスワードノ
	カギデス
	"""
	keyWait
	clearMsg
	"""
	プログラム1
	プログラム2
	"""
	keyWait
	clearMsg
	"""
	プログラム1
	プログラム2
	"""
	keyWait
	clearMsg
	"""
	プログラム1
	プログラム2
	"""
	keyWait
	clearMsg
	"""
	プログラム1
	プログラム2
	・・・・・・
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
		flag = 1358
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
		flag = 1359
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 84
		code = T
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 84
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
		flag = 1360
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 24
		code = L
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 24
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
