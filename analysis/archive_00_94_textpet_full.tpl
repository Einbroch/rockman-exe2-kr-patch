@archive 0769A4C
@size 255

script 0 mmbn2 {
	checkItem
		item = 44
		amount = 1
		jumpIfEqual = 1
		jumpIfGreater = 1
		jumpIfLess = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	キノウカラ
	デンジハガ ツヨク ナリスギテ、
	"""
	keyWait
	clearMsg
	"""
	デンジハヲ コントロール シテイタ
	プログラムノ カケラガ
	ドコカニ イッチャイマシタ!!
	"""
	keyWait
	clearMsg
	"""
	ソレガ ナイト
	ココノ デンジハイジョウ ハ
	ナオリマセン!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	デンジハイジョウヲ ナオストキニ
	フクサヨウ トシテ エネルギーガ
	ハッセイ シマス
	"""
	keyWait
	clearMsg
	"""
	ソノ エネルギーデ
	アナタハ モトノ バショニ
	トバサレテ シマウデショウ
	"""
	keyWait
	clearMsg
	"""
	ソウシタラ フタタビ ココニ クルニハ
	タイオウスル フロアカラ プラグイン
	シテコナケレバ ナリマセン
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkItem
		item = 44
		amount = 1
		jumpIfEqual = 3
		jumpIfGreater = 3
		jumpIfLess = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ナクナッタ プログラムノ カケラハ
	「デンジビット」ト イイマス
	"""
	keyWait
	clearMsg
	"""
	アドレスニ タイオウ シタ
	バンゴウガ ツイテイル カラ
	ミツケタラ ワカルト オモイマス
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	「デンジビット」ヲ ゲットシテ
	キマシタネ!
	"""
	keyWait
	clearMsg
	"""
	ソレヲ ムコウノ スイッチノ トコロデ
	ツカエバ、デンジハノ イジョウヲ
	ナオセマス!!
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
		flag = 1486
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 44
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 44
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
		flag = 1487
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 50
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 50
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
		flag = 1488
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 45
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 45
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
		flag = 1489
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 2
		code = *
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
		flag = 1490
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
		flag = 1491
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
