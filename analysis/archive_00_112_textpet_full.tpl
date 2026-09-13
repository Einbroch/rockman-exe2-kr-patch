@archive 076B530
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ケイタイゲームハ、コドモタチノ
	トモダチノ ワヲ ヒロゲル
	チカラガアリマス
	"""
	keyWait
	clearMsg
	"PETト、ヨク ニテイマスネ"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシタチノシゴトハ
	サマザマナ、ゲームソフトヲ
	サドウサセルコトデス
	"""
	keyWait
	clearMsg
	"タイヘンナ シゴトデスガ、"
	keyWait
	clearMsg
	"""
	イロンナ、ゲームソフトニハイッテイル
	プログラムト、オハナシ デキルノデ
	タノシイデス
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ゲッ ナンでココがワカったんだ
	グウッ ツカマってなるものか
	コレでもクらえ!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 531
	checkFlag
		flag = 2148
		jumpIfTrue = 33
		jumpIfFalse = continue
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 2
		field = 0
		music = 27
}
script 33 mmbn2 {
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 2
		field = 36
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
		flag = 1395
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 16
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 16
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
