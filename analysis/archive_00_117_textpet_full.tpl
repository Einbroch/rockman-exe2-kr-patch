@archive 076C47C
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココデハ、
	ニチヤ アタラシイ リロンノ
	ケンキュウガ オコナワレテ イマス
	"""
	keyWait
	clearMsg
	"""
	ワタシハ、
	ソノ オテツダイヲ シテイマス
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワタシも、ムコウにいる
	プログラムと イッショに、
	"""
	keyWait
	clearMsg
	"""
	ヒカリさんの
	オテツダいを しています
	"""
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
		flag = 1405
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 99
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 99
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
	2メガ ふえた!!
	"""
	keyWait
	end
}
