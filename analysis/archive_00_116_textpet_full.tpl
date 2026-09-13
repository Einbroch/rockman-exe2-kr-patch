@archive 076C1E4
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 13
		upper = 255
		jumpIfInRange = 1
		jumpIfOutOfRange = continue
	flagSet
		flag = 628
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コノ クマハ テーマパークノ
	マスコットキャラクター トシテ
	ツクラレマシタ
	"""
	keyWait
	clearMsg
	"""
	イマデコソ コンナ スガタ デスガ
	トウジハ トテモ アイクルシイ スガタデ
	コドモタチノ ニンキモノ デシタ
	"""
	keyWait
	clearMsg
	"""
	ナカデ ハタラク ボクタチモ
	ハナタカダカデ、ホカノ プログラムカラ
	ウラヤマシガラレテ イタモノデス
	"""
	keyWait
	clearMsg
	"""
	シカシ・・・アルヒ
	アクムガ ボクタチヲ オソイマシタ!
	"""
	keyWait
	clearMsg
	"""
	ソウデス、クマガ
	ウイルスニ オカサレテ シマッタノデス
	"""
	keyWait
	clearMsg
	"""
	ソレ イライ クマハ、バグッテ アバレテ
	オキャクサンニ ケガヲ サセルヨウニ
	ナリマシタ・・・
	"""
	keyWait
	clearMsg
	"""
	ソレカラノ マイニチハ
	オモイダスノモ ツライデス・・・
	"""
	keyWait
	clearMsg
	"""
	・・・ソシテ トウトウ、ボクタチハ
	コンナ ヤマオクニ ステラレテ
	シマッタノデス・・・
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 10
	"・・・・・・"
	textSpeed
		delay = 2
	"""
	ソシテ
	クマハ イマモ バグッテイマス!
	"""
	waitSkip
		frames = 30
	"\nホラ! "
	waitSkip
		frames = 30
	"ウイルスガ デタ!"
	keyWait
	clearMsg
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 1
		field = 0
		music = 27
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	アリガトウ
	コレデ モウ クマガ アバレルコトモ
	ナイデショウ・・・
	"""
	keyWait
	clearMsg
	"""
	ソシテ ボクタチノ ヤクメモ
	モウ オワリ ナノデス・・・
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
		flag = 1403
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
