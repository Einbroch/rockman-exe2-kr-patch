@archive 076D148
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ビービービー!!"
	keyWait
	clearMsg
	"""
	コラコラ、アンタ!!
	カッテニ プラグイン シチャ
	ダメデショ!
	"""
	keyWait
	clearMsg
	"""
	アンタ、モシカシテ
	オカネ イレズニ ショウヒンダケ
	モラオウッテ ハラジャ ナイデショウネ
	"""
	keyWait
	clearMsg
	"""
	ワタシノ メノ クロイ ウチハ
	ソンナコト サセマセンヨ!!
	"""
	keyWait
	clearMsg
	"エ? チガウ?"
	keyWait
	clearMsg
	"・・・コリャマタ、シツレイシマシタ"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	アッチニ イルノハ、ボウハンベル
	タントウノ プログラム ナノデス
	"""
	keyWait
	clearMsg
	"""
	シカシ、ドウモ ウタグリ ブカイ
	セイカクデシテ・・・
	"""
	keyWait
	clearMsg
	"""
	スグニ ボウハンベルヲ
	ナラスンデスヨ
	"""
	keyWait
	clearMsg
	"""
	ベツニ コショウ シテイルワケジャ
	ナインデスケドネ・・・
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
		flag = 1425
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 100
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 100
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
	3メガ ふえた!!
	"""
	keyWait
	end
}
