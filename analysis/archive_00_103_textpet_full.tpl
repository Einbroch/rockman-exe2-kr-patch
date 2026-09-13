@archive 076A564
@size 255

script 190 mmbn2 {
	checkFlag
		flag = 158
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 157
		jumpIfTrue = 195
		jumpIfFalse = continue
	flagSet
		flag = 157
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"ワタシが イライシャのモノです"
	keyWait
	clearMsg
	"""
	さて、サッソク ケンキュウに
	ハイりましょうか
	"""
	keyWait
	clearMsg
	"""
	イマから、ウイルスを
	5カイレンゾクで ハッセイさせます
	"""
	keyWait
	clearMsg
	"""
	オペレーションチュウの
	アナタと オペレータの シンクロりつ、
	"""
	keyWait
	clearMsg
	"""
	オペレーションの レスポンス などの
	スウチを ハカらせてもらいます
	"""
	keyWait
	clearMsg
	"""
	それでは イきますよ
	ジュンビは ヨロしいですか?
	"""
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 191,
			jump = continue,
			jump = continue
		]
	"""
	それでは、ジュンビが デキたら
	また キてクダさい
	"""
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	バトルが シュウリョウするまで
	タイリョクのカイフクは デキませんからね
	"""
	keyWait
	clearMsg
	"""
	なるべく、デリートされないように
	ガンバってクダさい
	"""
	keyWait
	flagSet
		flag = 215
	waitHold
}
script 192 mmbn2 {
	flagSet
		flag = 158
	flagClear
		flag = 82
	flagSet
		flag = 3211
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	・・・!?
	なんという スウチだ!!
	"""
	keyWait
	clearMsg
	"""
	ワレワレのヨソウのハンチュウを
	ハルかにウワマワる ケッカだ
	"""
	keyWait
	clearMsg
	"""
	しかし、ザンネンながら、
	このデータは、イッパンのナビと
	クラべモノにならない
	"""
	keyWait
	clearMsg
	"""
	ハンヨウテキなデータに
	ナりえないな・・・
	"""
	keyWait
	clearMsg
	"""
	しかし、タイヘンキチョウな
	データであることはタシかだ!
	"""
	keyWait
	clearMsg
	"""
	では、コレは アナタへの
	ホウシュウだ ウけトってクダさい
	"""
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotHide
	msgOpen
	playerAnimate
		animation = 24
	itemGive
		item = 97
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 97
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	アナタタチは、スバラシいチカラを
	モッテいます・・・
	"""
	keyWait
	clearMsg
	"""
	ケっして ツカいカタを
	アヤまらないように・・・
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ウイルスバスティングの
	ジュンビは デキましたか?
	"""
	keyWait
	clearMsg
	"""
	そろそろ、イきますよ!
	5れんぞくウイルスバスティング
	"""
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 191,
			jump = continue,
			jump = continue
		]
	"""
	それでは、ジュンビがデキたら
	またキてクダさい
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
		flag = 1375
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 28
		code = E
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 28
	" "
	printCode
		buffer = 0
		code = E
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
		flag = 1376
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 1000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「1000ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
