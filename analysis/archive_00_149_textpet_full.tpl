@archive 0777360
@size 255

script 180 mmbn2 {
	checkShopStock
		shop = 12
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = EvilNavi
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
			jump = 181,
			jump = continue
		]
	startShop
		shop = 12
}
script 181 mmbn2 {
	clearMsg
	"マタ おコしクダさい!"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ワタシは ネットショウニンですが、
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 210 mmbn2 {
	checkItem
		item = 37
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
		item = 37
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
		flag = 612
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
		battle = 41
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
		item = 37
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
		item = 37
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
		flag = 613
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
		battle = 42
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
script 214 mmbn2 {
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
	ひきかえしたほうが、
	みの タメだぜ・・・
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	オモテのヤツらは、これいじょうすすむと、
	イノチのほしょうは ないぜ・・・
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"かりです"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"かりです"
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
		flag = 1528
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
		flag = 1529
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 99
		amount = 1
	"""
	ロックマンは、
	きょうかプラグラム「
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
		flag = 1530
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 234,
			ratio = 64
			jump = 235,
			ratio = 0
			jump = 0,
			ratio = 32
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
			chip = 23
			code = A,
			chip = 23
			code = A,
			chip = 23
			code = A,
			chip = 23
			code = A,
			chip = 24
			code = A,
			chip = 24
			code = A,
			chip = 24
			code = A,
			chip = 24
			code = A,
			chip = 25
			code = A,
			chip = 25
			code = A,
			chip = 25
			code = A,
			chip = 25
			code = A,
			chip = 32
			code = Q,
			chip = 32
			code = Q,
			chip = 32
			code = Q,
			chip = 32
			code = Q
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
			amount = 900,
			amount = 900,
			amount = 900,
			amount = 900,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 2000,
			amount = 2000,
			amount = 1500,
			amount = 2000,
			amount = 2000,
			amount = 3000,
			amount = 3000
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
		jumpIfFalse = 238
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
		target = 238
}
script 238 mmbn2 {
	flagSet
		flag = 1531
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 239,
			ratio = 64
			jump = 240,
			ratio = 0
			jump = 0,
			ratio = 32
			jump = 241
		]
	flagClear
		flag = 2144
}
script 239 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	clearMsg
	startRandomBattle
	end
}
script 240 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 23
			code = A,
			chip = 23
			code = A,
			chip = 23
			code = A,
			chip = 23
			code = A,
			chip = 24
			code = A,
			chip = 24
			code = A,
			chip = 24
			code = A,
			chip = 24
			code = A,
			chip = 25
			code = A,
			chip = 25
			code = A,
			chip = 25
			code = A,
			chip = 25
			code = A,
			chip = 32
			code = Q,
			chip = 32
			code = Q,
			chip = 32
			code = Q,
			chip = 32
			code = Q
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
script 241 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 900,
			amount = 900,
			amount = 900,
			amount = 900,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 2000,
			amount = 2000,
			amount = 1500,
			amount = 2000,
			amount = 2000,
			amount = 3000,
			amount = 3000
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
