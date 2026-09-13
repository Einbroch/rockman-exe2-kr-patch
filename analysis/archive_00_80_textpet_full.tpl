@archive 076780C
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ゴリラ
	キタキツネ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ラクガキ
	リンゴ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コンドノ パスワードノ
	カギハ 「シリトリ」デス
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	パネルニ、カカレタ
	モジヲ ヨムベシ
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	3モジメ
	タテニヨムベシ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ウ~ン ナンダッタッケナ?
	パスワードヲ ワスレテシマイマシタ
	"""
	keyWait
	clearMsg
	"""
	ウ~ン、タシカ・・・
	「イロハニホヘト・・・」
	ア~ソノアト ナノニ!
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	サッキ、シンニュウ シテキタ
	ナビノ セイデ、
	ユカニ クサガ、シゲッテキマシタ
	"""
	keyWait
	clearMsg
	"""
	キ ゾクセイノ ウイルス ヤ ナビガ
	クサムラニ タツト
	"""
	keyWait
	clearMsg
	"HPガ、カイフク シマス"
	keyWait
	clearMsg
	"""
	キ ゾクセイノ テキト、タタカウ トキハ
	キヲツケテ クダサイ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"なにかかいてある・・・"
	keyWait
	clearMsg
	"その1・・・"
	keyWait
	clearMsg
	"""
	ナントシタコトダ
	ニゲオクレテシマウトハ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"なにかかいてある・・・"
	keyWait
	clearMsg
	"その2・・・"
	keyWait
	clearMsg
	"""
	ヤラレテシマウ!
	コノママデハ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"なにかかいてある・・・"
	keyWait
	clearMsg
	"その3・・・"
	keyWait
	clearMsg
	"""
	サガスコトハデキナイ
	ウンヨクイキノビテモ・・・
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
		flag = 1353
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 4
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 4
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
		flag = 1354
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 125
		code = F
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 125
	" "
	printCode
		buffer = 0
		code = F
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
		flag = 1355
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 114
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 114
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
		flag = 1356
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
