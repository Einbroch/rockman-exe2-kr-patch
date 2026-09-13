@archive 076B2F0
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ツメタ~~イ アイスコーヒーヲ
	ツクルノガ、ワタシノシゴト
	"""
	keyWait
	clearMsg
	"""
	アツイ キセツハ、ワタシノデバン!!
	アナタモ イッパイドウデスカ?
	"""
	keyWait
	clearMsg
	"""
	ア、ナビハ コーヒーノメマセンネ
	スミマセン
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシハ、ホットコーヒーヲ
	ツクル、プログラムデス
	"""
	keyWait
	clearMsg
	"""
	シカシ、アツイキセツハ
	ミンナ、アイスコーヒーバカリ ノムノデ、
	ワタシハ、トテモ タイクツデス
	"""
	keyWait
	clearMsg
	"""
	アイスコーヒープログラム ノヤツ、
	チョット ニンキガ アルカラッテ、
	ノボセアガッテマス
	"""
	keyWait
	clearMsg
	"アイスコーヒー タントウノクセニ!"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	プログラムどろぼうだな!!
	ぬすんだプログラムをかえすんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 33
}
script 33 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ナヌ? もうこんなトコロまで!?
	ワカったよ カエせばイイんだろ?
	カエせば!!
	"""
	keyWait
	clearMsg
	"ホラよ!!"
	keyWait
	clearMsg
	jump
		target = 34
}
script 34 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 15
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 15
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 35
}
script 35 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	スキをミせたな!!
	このアクトウめ!!
	"""
	keyWait
	clearMsg
	"これでもクらいな!!"
	keyWait
	clearMsg
	flagSet
		flag = 529
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 5
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
		flag = 1393
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
