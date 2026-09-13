@archive 076B0E0
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	タララ タンタタ タンタタ タラララン
	タラランランランランラン♪
	"""
	keyWait
	clearMsg
	"""
	ワタシハ、デンシピアノノ
	プログラムデス
	"""
	keyWait
	clearMsg
	"""
	イツモ、ホンモノノ ピアノ ノ
	オンシツニ セマルタメ
	レンシュウ シテイマス
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"1234、1234、1234"
	keyWait
	clearMsg
	"""
	ワタシハ、メトロノーム
	タントウノ、プログラムデス
	"""
	keyWait
	clearMsg
	"""
	セイカクナ リズムヲ キザムタメノ、
	レンシュウシテイマス
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
script 190 mmbn2 {
	flagSet
		flag = 310
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	SSSライセンスシケンの
	ジュケンシャですね
	"""
	keyWait
	clearMsg
	"ワタシのキーワードは コレです"
	keyWait
	clearMsg
	"「ワタシの ウみの オヤ」"
	keyWait
	clearMsg
	"もう、ワかっちゃいました?"
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
		flag = 1390
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
		flag = 1391
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
