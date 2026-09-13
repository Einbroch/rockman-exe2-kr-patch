@archive 0778CDC
@size 255

script 180 mmbn2 {
	checkShopStock
		shop = 21
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
		shop = 21
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
script 220 mmbn2 {
	msgOpen
	"""
	チカラのくらい ひくきものに、
	このトビラひらくこと
	まかりならん・・・
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"かいじょメッセージ"
	keyWait
	end
}
script 222 mmbn2 {
	checkItem
		item = 62
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
		jumpIfLess = continue
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 62
	"""
	」 ほじしゃ いがい
	このキューブをかいじょすることは
	できません
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"ロックマンは、「"
	printItem
		buffer = 0
		item = 62
	"""
	」
	を ていじ した!
	"""
	keyWait
	clearMsg
	"キューブが かいじょされた!!"
	keyWait
	msgClose
	flagSet
		flag = 129
	wait
		frames = 102
	end
}
script 224 mmbn2 {
	checkItem
		item = 61
		amount = 1
		jumpIfEqual = 225
		jumpIfGreater = 225
		jumpIfLess = continue
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 61
	"""
	」 ほじしゃ いがい
	このキューブをかいじょすることは
	できません
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"ロックマンは、「"
	printItem
		buffer = 0
		item = 61
	"""
	」
	を ていじ した!
	"""
	keyWait
	clearMsg
	"キューブが かいじょされた!!"
	keyWait
	msgClose
	flagSet
		flag = 130
	wait
		frames = 102
	end
}
script 226 mmbn2 {
	checkItem
		item = 63
		amount = 1
		jumpIfEqual = 227
		jumpIfGreater = 227
		jumpIfLess = continue
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 63
	"""
	」 ほじしゃ いがい
	このキューブをかいじょすることは
	できません
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"ロックマンは、「"
	printItem
		buffer = 0
		item = 63
	"""
	」
	を ていじ した!
	"""
	keyWait
	clearMsg
	"キューブが かいじょされた!!"
	keyWait
	msgClose
	flagSet
		flag = 131
	wait
		frames = 102
	end
}
script 228 mmbn2 {
	checkItem
		item = 61
		amount = 1
		jumpIfEqual = 229
		jumpIfGreater = 229
		jumpIfLess = continue
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 61
	"""
	」 ほじしゃ いがい
	このキューブをかいじょすることは
	できません
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"ロックマンは、「"
	printItem
		buffer = 0
		item = 61
	"""
	」
	を ていじ した!
	"""
	keyWait
	clearMsg
	"キューブが かいじょされた!!"
	keyWait
	msgClose
	flagSet
		flag = 132
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
		flag = 1560
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
		flag = 1561
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 176
		code = V
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 176
	" "
	printCode
		buffer = 0
		code = V
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
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
		flag = 1562
	jumpRandom
		untrap = true
		targets = [
			ratio = 50
			jump = 234,
			ratio = 64
			jump = 235,
			ratio = 0
			jump = 0,
			ratio = 50
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
	clearMsg
	startRandomBattle
	end
}
script 235 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 29
			code = *,
			chip = 29
			code = *,
			chip = 29
			code = *,
			chip = 29
			code = *,
			chip = 30
			code = *,
			chip = 30
			code = *,
			chip = 30
			code = *,
			chip = 30
			code = *,
			chip = 31
			code = *,
			chip = 31
			code = *,
			chip = 31
			code = *,
			chip = 31
			code = *,
			chip = 19
			code = O,
			chip = 19
			code = O,
			chip = 19
			code = O,
			chip = 19
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
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 236 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 4000,
			amount = 4000
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
	keyWait
	playerFinish
	playerReset
	playerUnlock
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
		flag = 1563
	jumpRandom
		untrap = true
		targets = [
			ratio = 50
			jump = 239,
			ratio = 64
			jump = 240,
			ratio = 0
			jump = 0,
			ratio = 50
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
			chip = 29
			code = *,
			chip = 29
			code = *,
			chip = 29
			code = *,
			chip = 29
			code = *,
			chip = 30
			code = *,
			chip = 30
			code = *,
			chip = 30
			code = *,
			chip = 30
			code = *,
			chip = 31
			code = *,
			chip = 31
			code = *,
			chip = 31
			code = *,
			chip = 31
			code = *,
			chip = 19
			code = O,
			chip = 19
			code = O,
			chip = 19
			code = O,
			chip = 19
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
script 241 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 4000,
			amount = 4000
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
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 242 mmbn2 {
	msgOpen
	"""
	ロックマンは、おちている データを
	手にとって しらべた
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	flagSet
		flag = 1581
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 248
		code = F
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 248
	" "
	printCode
		buffer = 0
		code = F
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
