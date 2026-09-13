@archive 076CA74
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ホホウ ココニ キヅキマシタカ!"
	keyWait
	clearMsg
	"""
	ジツハ コノ ドウゾウ、
	カンシ カメラ ナンデスヨ
	"""
	keyWait
	clearMsg
	"""
	コレホド オオキナ オヤシキダト
	ドロボウニ ネラワレヤスイノデ
	"""
	keyWait
	clearMsg
	"""
	ワタシタチガ 24ジカン
	2コウタイセイ デ
	カンシ シテイルノデス
	"""
	keyWait
	clearMsg
	"アッ ソロソロ コウタイノジカンダ"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ムニャムニャ・・・グーーー
	シゴト・・・シタクナイデス・・・
	"""
	keyWait
	clearMsg
	"""
	プログラムニダッテ ヤスミハ
	ヒツヨウ デス
	"""
	keyWait
	end
	"ムニャムニャ・・・"
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
		flag = 1413
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
