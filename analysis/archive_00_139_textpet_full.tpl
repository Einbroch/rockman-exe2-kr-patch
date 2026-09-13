@archive 0773524
@size 255

script 0 mmbn2 {
	checkShopStock
		shop = 8
		jumpIfStocked = continue
		jumpIfSoldOut = 2
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワタシは ネットショウニン・・・
	イいモノ ありますよ?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"みる "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"みない"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = 1,
			jump = continue
		]
	startShop
		shop = 8
}
script 1 mmbn2 {
	clearMsg
	"マタ おコしクダさい"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワタシは ネットショウニンですが、
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 22
		upper = 31
		jumpIfInRange = 16
		jumpIfOutOfRange = continue
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	あれ~? キョウは、ズイブンと
	ヒトがスクないなぁ・・・
	"""
	keyWait
	clearMsg
	"""
	わざわざ デンサンエリアから
	やってキたってのによ
	"""
	keyWait
	clearMsg
	"ナニか あったのか?"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ここ 「アジーナエリア」は
	セカイサイダイの ナビジンコウを ホコる
	エリアの ハズなんですが・・・
	"""
	keyWait
	clearMsg
	"""
	キミが ワルいので
	ワタシは ヒきカエしましょう・・・
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	アジーナスクエアには、
	ダレも いなかった!?
	"""
	keyWait
	clearMsg
	"""
	もしかして それって
	タイヘンな コトかもしれないぞ!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	そ、そんなオソロシい ジケンが
	あっただなんて・・・
	"""
	keyWait
	clearMsg
	"""
	しばらく アジーナスクエアには、
	チカよらない ホウが いいかもな
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	サッキ、アジーナエリア2ノ ホウニ
	ナビノ オンナノコガ、アルイテイクノヲ
	ミマシタヨ
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 150
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 150
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	しみんネットバトラーさんは
	マダかなぁ~
	"""
	keyWait
	clearMsg
	"""
	ん? あなた、もしかして・・・
	しみんネットバトラーの
	カタですか?
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
	"そうです! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちがいます!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 191,
			jump = continue,
			jump = continue
		]
	"なら、ヨウはない"
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	わざわざ キてクダさって
	アリガトうゴザいます
	"""
	keyWait
	clearMsg
	"""
	まずは、コレをうけとってクダさい
	コンカイのホウシュウです
	いいんですよ、サキバラいです
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 66
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 66
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	flagSet
		flag = 3208
	flagClear
		flag = 82
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	しみんネットバトラーのカタには
	いつも おセワになっているんですよ
	"""
	keyWait
	clearMsg
	"""
	いらいすると、スグやってキてくれるし
	サキに ホウシュウを ワタすと
	カンタンに ユダンしてくれるし
	"""
	keyWait
	clearMsg
	"""
	ホント、シゴトしヤスいですよ
	ククク・・・
	"""
	keyWait
	clearMsg
	"それでは、ワタシのいらいなんですけどね"
	keyWait
	clearMsg
	"""
	おマエのモっているバトルチップ
	ゼンブ オいてイけや! オラ!
	"""
	keyWait
	clearMsg
	"よくヒっかかるんだよ このテによ!"
	keyWait
	clearMsg
	"""
	いらいしゃを ヨソおって
	しみんネットバトラーをおびきだし、
	"""
	keyWait
	clearMsg
	"""
	そいつらの モってるチップを
	まるまるイタダいて
	ウラのショウニンにウりつけるんだよ
	"""
	keyWait
	clearMsg
	"ケッコウ モウかるんだぜ~"
	keyWait
	clearMsg
	"""
	ん~? どうしても ダさないんだな!?
	ならば、チカラづくでイタダくまでよ
	"""
	keyWait
	clearMsg
	"ホレ!!"
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
		battle = 49
		field = 0
		music = 27
}
script 194 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	あなた、やっぱり しみんネットバトラーの
	カタですか?
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
	"そうです! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちがいます!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 191,
			jump = continue,
			jump = continue
		]
	"なら、ヨウはない"
	keyWait
	end
}
script 210 mmbn2 {
	checkItem
		item = 35
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 211
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 35
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 598
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 26
		field = 65
		music = 27
}
script 211 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 212 mmbn2 {
	checkItem
		item = 35
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 213
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 35
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 599
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 27
		field = 65
		music = 27
}
script 213 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ミギ ネットショウニン
	ヨッテラッシャイ!
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"コノサキ アジーナエリア2"
	keyWait
	end
}
script 222 mmbn2 {
	checkItem
		item = 87
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
		jumpIfLess = continue
	msgOpen
	"なぞの セキュリティキューブだ"
	keyWait
	clearMsg
	"""
	パスコードがないので
	キューブを かいじょ
	することができない
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 87
	"""
	」
	を つかった!!
	"""
	keyWait
	clearMsg
	"""
	セキュリティキューブが
	かいじょされた!!
	"""
	keyWait
	msgClose
	flagSet
		flag = 211
	wait
		frames = 102
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
		flag = 1309
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
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 238
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
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 118
		code = S
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 118
	" "
	printCode
		buffer = 0
		code = S
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1310
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
	checkFlag
		flag = 2144
		jumpIfTrue = continue
		jumpIfFalse = 233
	"サブチップ「"
	printItem
		buffer = 0
		item = 115
	"""
	」
	が こうりょくを はっきした!!
	"""
	keyWait
	clearMsg
	"""
	ミステリーデータに ひそむ
	ウイルスデータが デリートされた!
	"""
	keyWait
	jump
		target = 233
}
script 233 mmbn2 {
	flagSet
		flag = 1311
	jumpRandom
		untrap = true
		targets = [
			ratio = 16
			jump = 234,
			ratio = 48
			jump = 235,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 236
		]
	flagClear
		flag = 2144
}
script 234 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	startRandomBattle
	end
}
script 235 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 7
			code = P,
			chip = 7
			code = P,
			chip = 7
			code = P,
			chip = 7
			code = P,
			chip = 7
			code = P,
			chip = 13
			code = N,
			chip = 13
			code = N,
			chip = 13
			code = N,
			chip = 13
			code = N,
			chip = 13
			code = N,
			chip = 144
			code = B,
			chip = 144
			code = B,
			chip = 144
			code = B,
			chip = 144
			code = B,
			chip = 51
			code = O,
			chip = 51
			code = O
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 236 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1500,
			amount = 1500,
			amount = 1500,
			amount = 2000,
			amount = 2000
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 237 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 238
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
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 60
		code = R
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 60
	" "
	printCode
		buffer = 0
		code = R
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1312
	end
}
script 238 mmbn2 {
	msgOpen
	"""
	このミステリーデータには、
	セキュリティがかかっていて
	かいせきすることができない
	"""
	keyWait
	clearMsg
	"""
	かいせきするには、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 117
	"""
	」
	が、ひつようだ
	"""
	keyWait
	end
}
script 239 mmbn2 {
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
		flag = 1313
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
