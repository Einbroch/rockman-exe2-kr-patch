@archive 07782A8
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"なにモノだ・・・"
	keyWait
	clearMsg
	"""
	ここよりサキは ゴスペルの モノどもも
	テダしデキない エリア・・・
	"""
	keyWait
	clearMsg
	"""
	サキに ススむと いうのなら
	イノチの ホショウは デキんな・・・
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 9
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = NumberMan
	msgOpen
	"""
	ワタシは ギョウショウチュウの
	ナンバーマンです
	"""
	keyWait
	clearMsg
	"イいモノ ありますよ?\n"
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
		shop = 9
}
script 181 mmbn2 {
	clearMsg
	"マタ キてクダさいね"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = NumberMan
	msgOpen
	"ザンネンですが、シナギレチュウです"
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
		item = 117
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 231
		jumpIfSome = 231
	flagSet
		flag = 1544
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 117
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
	"「"
	printItem
		buffer = 0
		item = 117
	"""
	」が
	いっぱいで もうもてない!
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
	flagSet
		flag = 1545
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
script 233 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 234
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
		chip = 47
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 47
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1546
	end
}
script 234 mmbn2 {
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
script 235 mmbn2 {
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
		jumpIfFalse = 236
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
		target = 236
}
script 236 mmbn2 {
	flagSet
		flag = 1547
	jumpRandom
		untrap = true
		targets = [
			ratio = 64
			jump = 237,
			ratio = 0
			jump = 0,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 239
		]
	flagClear
		flag = 2144
}
script 237 mmbn2 {
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
script 238 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 52
			code = Q,
			chip = 52
			code = Q,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G
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
script 239 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 50000,
			amount = 50000,
			amount = 50000,
			amount = 50000
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
script 240 mmbn2 {
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
		jumpIfFalse = 241
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
		target = 241
}
script 241 mmbn2 {
	flagSet
		flag = 1548
	jumpRandom
		untrap = true
		targets = [
			ratio = 64
			jump = 242,
			ratio = 0
			jump = 0,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 244
		]
	flagClear
		flag = 2144
}
script 242 mmbn2 {
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
script 243 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 52
			code = Q,
			chip = 52
			code = Q,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G
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
script 244 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 50000,
			amount = 50000,
			amount = 50000,
			amount = 50000
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
script 245 mmbn2 {
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
		jumpIfFalse = 246
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
		target = 246
}
script 246 mmbn2 {
	flagSet
		flag = 1549
	jumpRandom
		untrap = true
		targets = [
			ratio = 64
			jump = 247,
			ratio = 0
			jump = 0,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 249
		]
	flagClear
		flag = 2144
}
script 247 mmbn2 {
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
script 248 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 52
			code = Q,
			chip = 52
			code = Q,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G
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
script 249 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 50000,
			amount = 50000,
			amount = 50000,
			amount = 50000
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
