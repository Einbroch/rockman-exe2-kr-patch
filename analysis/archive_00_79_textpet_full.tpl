@archive 0767534
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ワタシハ プログラムAデス"
	keyWait
	clearMsg
	"""
	コノサキニアル パスワードヲ
	オシエテアゲマショウ
	"""
	keyWait
	clearMsg
	"「ウラテゴオキ」デス"
	keyWait
	clearMsg
	"""
	ホカノ プログラムガ
	イッテイルコトハ、
	ゼンブ、ウソデス
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ワタシハ プログラムBデス"
	keyWait
	clearMsg
	"""
	コノサキニアル パスワードヲ
	オシエテアゲマショウ
	"""
	keyWait
	clearMsg
	"「ウリスダバン」デス"
	keyWait
	clearMsg
	"""
	ホカノ プログラムガ
	イッテイルコトハ、
	ゼンブ、ウソデス
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ワタシハ プログラムCデス"
	keyWait
	clearMsg
	"""
	コノサキニアル パスワードヲ
	オシエテアゲマショウ
	"""
	keyWait
	clearMsg
	"「ハジガクリン」デス"
	keyWait
	clearMsg
	"""
	ホカノ プログラムガ
	イッテイルコトハ、
	ゼンブ、ウソデス
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ワタシハ プログラムDデス"
	keyWait
	clearMsg
	"""
	コノサキニアル パスワードヲ
	オシエテアゲマショウ
	"""
	keyWait
	clearMsg
	"「ハジガレタキ」デス"
	keyWait
	clearMsg
	"""
	ホカノ プログラムガ
	イッテイルコトハ、
	ゼンブ、ウソデス
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	プログラムAハ、プログラムBヨリ
	ショウジキモノデス
	"""
	keyWait
	clearMsg
	"""
	プログラムBハ、プログラムCヨリ
	ショウジキモノデス
	"""
	keyWait
	clearMsg
	"""
	プログラムDハ、プログラムAヨリ
	ショウジキモノデス
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ウスバカゲロウ トイウムシノ
	ヨウチュウノ
	ナマエハ ナンデショウ?
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"オオキナ アゴ"
	keyWait
	clearMsg
	"""
	ジメンニ アナヲホッテ
	スンデイマス
	"""
	keyWait
	clearMsg
	"アリ タベマス"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コンドノ パスワードハ
	モジノ ナラベカエデス
	"""
	keyWait
	clearMsg
	"「ウンガシロバモウダコス」"
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	2バンメハ、「ウ」
	5バンメハ、「シ」
	10バンメハ、「ロ」
	"""
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	3バンメハ、「ス」
	7バンメハ、「ガ」
	サイゴハ、「ウ」
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	サイショハ、「モ」
	4バンメハ、「コ」
	8バンメハ、「ン」
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	マザーコンピュータの
	メインシステムを まもる
	"""
	keyWait
	clearMsg
	"""
	さいごのトビラをせいぎょする
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
		flag = 1349
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 7
		code = P
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 7
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
		flag = 1350
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 600
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「600ゼニー」
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
		flag = 1351
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
script 233 mmbn2 {
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
		flag = 1352
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 51
		code = Q
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 51
	" "
	printCode
		buffer = 0
		code = Q
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
