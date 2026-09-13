@archive 0767FEC
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	アルイテルト
	オバケガ デルコトガ アルカラ
	キヲ ツケテ!
	"""
	keyWait
	clearMsg
	"""
	ツカマッタラ ダメ ダヨ!
	ハナシカケル ナンテ トンデモ ナイ!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	キュウケツキ ガ デタヨ!
	イマニモ HPヲ スイソウ ダッタヨ!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ゾンビ ニ ツカマッテ
	コンナトコニ ツレテ コラレチャッタ
	ワーーーーン!!!!
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"オバケハ マエシカ ミテナインダ!"
	keyWait
	clearMsg
	"""
	タイミングヲ ネラエバ、マガリカドデ
	スリヌケタリ オイヌイタリ デキルヨ!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココ オフィシャルセンターノ
	セカイホンブ デハ イチハヤク
	ネットワークシステムヲ ツクリマシタ
	"""
	keyWait
	clearMsg
	"""
	ナノデ ココハ ホカニ クラベルト
	チョット フルイ・・・
	"""
	keyWait
	clearMsg
	"""
	ユカニ ヒビガ ハイッテタリ スルノデ
	ウイルスト タタカウ トキニハ
	チョット チュウイガ ヒツヨウデス
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココニ クルマデニ
	カゲノ ヨウナ スガタノ ウイルスト
	デアイマシタカ?
	"""
	keyWait
	clearMsg
	"""
	カゲ ニハ ジッタイガ ナイカラ
	タイテイノ コウゲキハ
	スリヌケテ シマイマス
	"""
	keyWait
	clearMsg
	"""
	デモ
	ヨッポド スルドイ コウゲキ トカナラ
	キリステル コトガ デキルノデス
	"""
	keyWait
	clearMsg
	"ボク イイコト イッタ?"
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 48
		upper = 255
		jumpIfInRange = 228
		jumpIfOutOfRange = continue
	checkFlag
		flag = 555
		jumpIfTrue = 227
		jumpIfFalse = continue
	msgOpen
	"""
	トラップを
	せいぎょしている プログラムだ!
	"""
	keyWait
	clearMsg
	"ロックマンは、\n"
	soundPlay
		track = 166
	"プログラムを ていしさせた!!"
	keyWait
	clearMsg
	flagSet
		flag = 555
	jump
		target = 225
}
script 221 mmbn2 {
	checkItem
		item = 26
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
		jumpIfLess = continue
	msgOpen
	"""
	電脳トビラが 行く手を ふさいでいる!
	ひらくには 
	"""
	printItem
		buffer = 0
		item = 26
	"が ひつようだ!"
	keyWait
	end
}
script 222 mmbn2 {
	checkItem
		item = 26
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
		jumpIfLess = continue
	msgOpen
	"""
	電脳トビラが 行く手を ふさいでいる!
	ひらくには 
	"""
	printItem
		buffer = 0
		item = 26
	"が ひつようだ!"
	keyWait
	end
}
script 223 mmbn2s {
	end
}
script 225 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! これで
	トラップ さどうしなくなった はず!
	"""
	keyWait
	clearMsg
	jump
		target = 226
}
script 226 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	サンキュー!
	じゃあ、プラグアウト しようぜ!
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	トラップを
	せいぎょしている プログラムだ
	すでに とまっている・・・
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	トラップを
	せいぎょしている プログラムだ
	いまは なにも しなくていい・・・
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
		flag = 1441
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 26
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 26
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
		flag = 1442
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 26
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 26
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
		flag = 1443
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
		flag = 1444
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
