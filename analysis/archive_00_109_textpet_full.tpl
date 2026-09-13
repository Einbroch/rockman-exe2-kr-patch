@archive 076AF30
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシタチハ コノイエノ
	デンカセイヒンヲ カンリシテイマス
	"""
	keyWait
	clearMsg
	"""
	エアコンカラ、オフロマデ
	セイカツヲ、テッテイ サポート!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	キョウモ、ガンバッテマス!!
	アシタモ、ガンバリマス!!
	"""
	keyWait
	clearMsg
	"""
	マイニチ、マイニチ、
	ガンバリマス!!
	"""
	keyWait
	clearMsg
	"""
	ワタシタチノ、ガンバリガ、
	コノイエニ スムヒトノ
	ヤスラギニ、カワリマス
	"""
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
	checkGiveItem
		item = 117
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 231
		jumpIfSome = 231
	flagSet
		flag = 1387
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 117
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
	"「"
	printItem
		buffer = 0
		item = 117
	"""
	」が
	いっぱいで もうもてない!
	"""
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
		flag = 1388
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
