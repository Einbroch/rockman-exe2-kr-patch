@archive 076C91C
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コンナトコロニ プラグイン
	デキルトハ オモッテモ
	ミナカッタデショ?
	"""
	keyWait
	clearMsg
	"ソレガネ デキルンデスヨ"
	keyWait
	clearMsg
	"""
	ココハ、メンゼイテンデ ウラレル
	ショウヒンノ ヒンシツヤ、ザイコヲ
	カンリスル トコロナンデスヨ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ウーン、ウイスキーノ
	ザイコガ キレソウダナ・・・
	"""
	keyWait
	clearMsg
	"""
	チュウモン シテオカナイト
	アー、イソガシイ!!
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
		flag = 1411
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 116
		code = P
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 116
	" "
	printCode
		buffer = 0
		code = P
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
