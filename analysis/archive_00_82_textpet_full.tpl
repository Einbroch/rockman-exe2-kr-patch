@archive 0767C40
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"サバクニイル ドウブツ・・・"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"セナカニコブガ フタツ"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	カギョウ ノ ツギ
	タギョウ
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシノ カンリスル
	パスワードハ コレデス
	"""
	keyWait
	clearMsg
	"""
	メスンムシ
	イテイゲソヘ
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシノ カンリスル
	パスワード カイドクノ
	カギ デス
	"""
	keyWait
	clearMsg
	"""
	11、21、13、15、12、
	22、14、26、23、25、24
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシハ、プログラムA
	ワタシノ カンリシテイル
	"""
	keyWait
	clearMsg
	"""
	パスワードヲ
	オシエテアゲマショウ
	"""
	keyWait
	clearMsg
	"「メシムスソ」"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシハ、プログラムB
	ワタシノ カンリシテイル
	"""
	keyWait
	clearMsg
	"""
	パスワードヲ
	オシエテアゲマショウ
	"""
	keyWait
	clearMsg
	"「インステグコ」"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	・・・
	・・・・・・
	"""
	keyWait
	clearMsg
	"""
	ABBABBAABAB
	・・・
	"""
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コレガ サイゴノ
	セキュリティ デス
	"""
	keyWait
	clearMsg
	"""
	パスワード ハ
	コノナカニ カクレテイマス
	"""
	keyWait
	clearMsg
	"""
	カプランロ
	スペグトニ
	ワラリンギム
	"""
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ナカマハズレヲ
	サガシマショウ
	"""
	keyWait
	clearMsg
	"""
	セイカイノ パスワード イガイハ
	3シュルイノ トリノナマエガ
	カクレテイマス
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	クロイトリ トベナイトリ
	オヨゲルトリ
	"""
	keyWait
	clearMsg
	"モウ ワカリマシタカ?"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"チョット、コミミニ ハサンダノデスガ"
	keyWait
	clearMsg
	"""
	シャドーマン トイウ ナビハ
	コライカラ ツタワル ヒギ
	「カゲブンシン」ガ、ツカエルソウデス
	"""
	keyWait
	clearMsg
	"""
	カゲニハ、ジッタイガナイノデ
	コチラノ コウゲキハ アタラナイノデス
	"""
	keyWait
	clearMsg
	"""
	ナニカ、キレアジノ スルドイ ブキデ
	スパッ ト、キレタリ シナインデスカネ?
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ニホンの じゅうような
	きかんをかんりする
	"""
	keyWait
	clearMsg
	"""
	マザーコンピュータの
	メインシステムだ
	"""
	keyWait
	clearMsg
	"""
	これが、ワルモノにのっとられたら
	ニホンはたいへんなコトになる
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
	checkGiveItem
		item = 113
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 232
		jumpIfSome = 233
	flagSet
		flag = 1362
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 113
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
		flag = 1363
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 1400
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「1400ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 232 mmbn2 {
	"「"
	printItem
		buffer = 0
		item = 113
	"""
	」が
	いっぱいで もうもてない!
	"""
	keyWait
	end
}
script 233 mmbn2 {
	"「"
	printItem
		buffer = 0
		item = 113
	"""
	」が
	いっぱいになった!
	"""
	keyWait
	end
}
script 234 mmbn2 {
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
		flag = 1364
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 99
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 99
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
	2メガ ふえた!!
	"""
	keyWait
	end
}
