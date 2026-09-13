@archive 076CBE4
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ヒューーー、ヒューーーー"
	keyWait
	clearMsg
	"ヒヤシマスヨーーーー"
	keyWait
	clearMsg
	"ヒューーー、ヒューーーー"
	keyWait
	clearMsg
	"""
	タダイマノ オンド・・・
	セッシ 3ドデス
	"""
	keyWait
	clearMsg
	"""
	ナガク イスギルト
	コオッチャイマスヨーーー
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	チェッ ボクモ レイゾウコヲ
	ヒヤス シゴトガ、シタカッタノニ
	"""
	keyWait
	clearMsg
	"""
	ダッシュウ ダナンテ・・・
	ツマンナイナーー
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
		flag = 1419
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
script 231 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 232
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
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 28
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 28
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1420
	end
}
script 232 mmbn2 {
	msgOpen
	"""
	このミステリーデータには、
	セキュリティがかかっていて
	かいせきすることができない
	"""
	keyWait
	clearMsg
	"""
	かいせきするには、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 117
	"""
	」
	が、ひつようだ
	"""
	keyWait
	end
}
