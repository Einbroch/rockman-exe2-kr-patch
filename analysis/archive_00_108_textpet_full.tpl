@archive 076AD90
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	モウ、ゴゾンジカモ シレマセンガ
	ワタシハ、イヌゴヤガタ
	ボウハンソウチ ノ プログラムデス
	"""
	keyWait
	clearMsg
	"""
	キョウモ、アクノ テ カラ
	ヒカリケ ヲ、マモッテオリマス!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ウ~、ガウガウガウガウガウガウガウガウ
	ガウガウガウガウガウガウガウガウガウガウ
	ガウガウガウガウガウガウガウガウガウガウ
	"""
	keyWait
	clearMsg
	"""
	ヒジョウジニハ、コノヨウナ サイレンデ
	オシラセシマス
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
		item = 113
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 231
		jumpIfSome = 232
	flagSet
		flag = 1385
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
script 231 mmbn2 {
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
script 232 mmbn2 {
	"「"
	printItem
		buffer = 0
		item = 113
	"""
	」が
	いっぱいになった!
	"""
	keyWait
	end
}
