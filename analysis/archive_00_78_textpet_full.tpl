@archive 07671BC
@size 255

script 0 mmbn2 {
	checkFlag
		flag = 630
		jumpIfTrue = 10
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	マザーコンピュータ ハ
	ガイブ カラノ
	シンニュウヲ フセグタメニ
	"""
	keyWait
	clearMsg
	"""
	ナンジュウ ニモ
	セキュリティヲ モッテイマス
	"""
	keyWait
	clearMsg
	"""
	ワタシタチノ モンダイガ
	パスワード ニナリマス
	"""
	keyWait
	clearMsg
	"""
	アヤマッタ パスワードヲ
	ニュウリョク スルト
	サキニ ススムコトハ デキマセン
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkFlag
		flag = 630
		jumpIfTrue = 11
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ツギノ ♥ニ アテハマル
	コトバハ ナンデショウ?
	"""
	keyWait
	clearMsg
	"""
	「ハナヨリ ♥♥♥」
	カンタン デスヨネ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkFlag
		flag = 630
		jumpIfTrue = 12
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	メガ ミッツ
	アシ ガ イッポン
	コレナ~ンダ
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オレの アツめた ジョウホウによると
	アカ、キイロ、アオ 3つのイロが
	カンケイあるようだ
	"""
	keyWait
	end
}
script 4 mmbn2 {
	checkFlag
		flag = 630
		jumpIfTrue = 13
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	・・・ツギノ パスワードハ
	♥ ノナカニ ハイル
	モジ デス
	"""
	keyWait
	clearMsg
	"""
	オオット、カンジンノ
	モンダイヲ ワスレテシマイマシタ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ここの モンダイは、
	「♥フィシャル♥ンター」らしいわ!
	"""
	keyWait
	clearMsg
	"ナンか、ドコかでキいたコトあるわね・・・"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	サスガ、マザーコンピュータを
	マモるだけあって
	"""
	keyWait
	clearMsg
	"パスワードも ムズカしいぜ!!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	マザーコンピュータ ヲ
	マモルコトガ ワレワレノ
	シメイデ アリマス
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	マザーコンピュータヲ
	マモルコト
	"""
	keyWait
	clearMsg
	"""
	ニホンノアスヲ
	マモルコト
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	セキュリティニハ
	ワレワレ プログラム ダケデナク
	ネットナビモ ツカウベキデス
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	マサカ コノセキュリティガ、
	ヤブラレル ヒガ クルトハ・・・
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 32
		upper = 255
		jumpIfInRange = 221
		jumpIfOutOfRange = continue
	checkFlag
		flag = 630
		jumpIfTrue = 221
		jumpIfFalse = continue
	flagSet
		flag = 629
	wait
		frames = 1
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	マザーコンピュータへの、しんにゅうしゃを
	ふせぐ でんきのカベをせいぎょする
	コントロールパネルだ
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
		flag = 1345
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 800
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「800ゼニー」
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
		flag = 1346
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 96
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 232 mmbn2 {
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
		flag = 1347
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 123
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 123
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
