@archive 076C750
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"エ、エート・・・"
	keyWait
	clearMsg
	"""
	ツ、ツギハ アメロッパ イキガ
	10ジ 30プン・・・
	"""
	keyWait
	clearMsg
	"アジーナイキ ガ・・・11ジ・・・"
	keyWait
	clearMsg
	"チョット ハナシカケナイデ クダサイ!!"
	keyWait
	clearMsg
	"""
	フライトボードニ ヒョウジ スル
	ジコクヒョウ ヲ
	オボエテ イルンデスカラ!!
	"""
	keyWait
	clearMsg
	"マチガエタラ アナタノ セイデスヨ!!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ムコウデ ジコクヒョウ ヲ
	アンキ シテイルヤツガ
	イルデショウ
	"""
	keyWait
	clearMsg
	"""
	アイツハ コノアイダ
	ハイッタバカリ ナンデスヨ
	"""
	keyWait
	clearMsg
	"""
	フライトボード プログラム ノ
	ココロエ!!
	"""
	keyWait
	clearMsg
	"""
	ジコクヒョウ ハ スベテ
	アンキ スルコト!!
	"""
	keyWait
	clearMsg
	"""
	ナンテ ジョウダンデ イッタラ
	ホンキニ シチャッテ
	"""
	keyWait
	clearMsg
	"""
	オモシロイカラ ソノママ
	ホウッテ オイテルンデスケドネ
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
		flag = 1409
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
