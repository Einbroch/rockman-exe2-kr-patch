@archive 076B6D0
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	サイキンノ ヒトタチハ
	ミンナ PETヲ ツカウノデ
	"""
	keyWait
	clearMsg
	"""
	ワタシタチノ デバンガ
	スクナク ナッテキテイマス・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	イマ、デンワガイシャノヒトガ キテ
	シュウリヲ シテモラッテイマス
	"""
	keyWait
	clearMsg
	"""
	アンマリ ツカッテモラエナイ モンダカラ
	チョット、タイチョウヲ、
	クズシテシマイマシタ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	アナタ、ちょっと ウンドウしたほうが
	イイですよ
	"""
	keyWait
	clearMsg
	"""
	とイっても、シゴトがナいんじゃ
	シカタないですけどね
	"""
	keyWait
	clearMsg
	"""
	ニンゲンはアタラしいモノが、テにハイると
	フルいモノには メがいかなく
	なりますもんね
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	くそっ! ミつかっちまったか!
	こうナったら しかたない
	イけ!! ウイルスども!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 532
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 3
		field = 0
		music = 27
}
script 190 mmbn2 {
	checkFlag
		flag = 3206
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 147
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 146
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 146
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ああ~! チョウド ヨいトコロに
	キてクダさいました!!
	"""
	keyWait
	clearMsg
	"""
	ワタシがイライシャです!
	モンダイのあくとうナビはこいつです!
	"""
	keyWait
	clearMsg
	"""
	ナンとかしてクダさい!!
	ひいいっ!
	"""
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"ハ、ハヤくやっつけてクダさ~い"
	keyWait
	end
}
script 192 mmbn2 {
	flagSet
		flag = 3206
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	いやあ、おみごと おみごと!
	タスかりましたよ!!
	"""
	keyWait
	clearMsg
	"""
	なんだかサイキンこのエリアに
	ガラのワルい ナビがフえて
	ホントにコマっていたんですよ
	"""
	keyWait
	clearMsg
	"""
	これは、サッキ あなたが
	タイジした ナビがオトしたモノですが、
	コレを、おレイにさしあげます・・・
	"""
	keyWait
	clearMsg
	"セコイですか?"
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 87
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 87
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシもいつか、アナタのように
	ツヨくなりたいです
	"""
	keyWait
	end
}
script 195 mmbn2 {
	checkFlag
		flag = 146
		jumpIfTrue = 196
		jumpIfFalse = continue
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	オラァ! おマエ サッキオレと
	メがアっただろ!!
	"""
	keyWait
	clearMsg
	"""
	ヤるのか!? ゴワアア!!
	オイ、ムラサキっちいの!
	おマエだよ!!
	"""
	keyWait
	end
}
script 196 mmbn2 {
	flagSet
		flag = 147
	flagClear
		flag = 82
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ナンだ? アオいの!
	しみんネットバトラーかなんか
	シんねえけどよお!
	"""
	keyWait
	clearMsg
	"""
	ケンカジョウトウじゃい!!
	カカってコいや ワレァ!
	"""
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
		battle = 48
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
		flag = 1397
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
		flag = 1398
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
