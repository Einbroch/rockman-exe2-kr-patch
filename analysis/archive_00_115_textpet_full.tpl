@archive 076BEDC
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 57
		upper = 58
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	モヤスゼ!! ファイア!
	アツイゼ!! ファイア!
	"""
	keyWait
	clearMsg
	"ゴーゴゴー! ゴーゴゴー!!"
	keyWait
	clearMsg
	"モーエーロー!!"
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 61
		upper = 255
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	オレタチハ、ホノオ ノ
	コンロ プログラム!!
	"""
	keyWait
	clearMsg
	"""
	ドンナ ブアツイ ニク ニダッテ
	ヒヲ トオシテミセルゼ!!
	"""
	keyWait
	clearMsg
	"ファイア~~!!"
	keyWait
	end
}
script 10 mmbn2 {
	checkFlag
		flag = 637
		jumpIfTrue = 11
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ッタク、アイツハドコデ
	アブラヲ ウッテルンダ!?
	"""
	keyWait
	clearMsg
	"""
	アジーナエリアニ オツカイニ
	イッタママ カエッテ コナイジャナイカ
	"""
	keyWait
	clearMsg
	"プンプン!!"
	keyWait
	end
}
script 11 mmbn2 {
	checkItem
		item = 37
		amount = 1
		jumpIfEqual = 14
		jumpIfGreater = 14
		jumpIfLess = continue
	checkItem
		item = 36
		amount = 1
		jumpIfEqual = 14
		jumpIfGreater = 14
		jumpIfLess = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	アナタハ ロックマンサンデスネ
	ワタシノ ドウリョウヲ
	タスケテ クダサッタソウデスネ
	"""
	keyWait
	clearMsg
	"""
	アイツハ サボリヤナンデスガ
	ダイジナ トモダチナンデス
	"""
	keyWait
	clearMsg
	"""
	ワタシカラ オレイヲ サセテクダサイ
	トイッテモ、コンナモノシカ
	アリマセンガ・・・
	"""
	keyWait
	clearMsg
	"ドウゾ ウケトッテクダサイ"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 36
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 36
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ドウモ アリガトウゴザイマシタ"
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"サァ、ヒヲオコスゾ!!"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"マジメニ ハタライテイマス!"
	keyWait
	clearMsg
	"モエロー、モエロー!!"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"かりです"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"かりです"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	くそっ! ミつかっちまったか!
	こうナったら しかたない
	イけ!! ウイルスども!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 532
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 3
		field = 0
		music = 27
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
		flag = 1401
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 8
		code = R
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 8
	" "
	printCode
		buffer = 0
		code = R
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
	checkGiveItem
		item = 112
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 232
		jumpIfSome = 233
	flagSet
		flag = 1402
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 112
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
	"「"
	printItem
		buffer = 0
		item = 112
	"""
	」が
	いっぱいで もうもてない!
	"""
	keyWait
	end
}
script 233 mmbn2 {
	"「"
	printItem
		buffer = 0
		item = 112
	"""
	」が
	いっぱいになった!
	"""
	keyWait
	end
}
