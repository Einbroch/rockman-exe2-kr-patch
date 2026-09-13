@archive 07789F0
@size 255

script 220 mmbn2 {
	checkItem
		item = 62
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
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
script 221 mmbn2 {
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
		flag = 299
	wait
		frames = 102
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
		flag = 300
	wait
		frames = 102
	end
}
script 224 mmbn2 {
	checkItem
		item = 63
		amount = 1
		jumpIfEqual = 225
		jumpIfGreater = 225
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
script 225 mmbn2 {
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
		flag = 301
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
		flag = 302
	wait
		frames = 102
	end
}
script 228 mmbn2 {
	checkItem
		item = 63
		amount = 1
		jumpIfEqual = 229
		jumpIfGreater = 229
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
script 229 mmbn2 {
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
		flag = 303
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
		flag = 1554
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 178
		code = H
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 178
	" "
	printCode
		buffer = 0
		code = H
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
		flag = 1555
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 129
		code = R
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 129
	" "
	printCode
		buffer = 0
		code = R
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
		flag = 1556
	jumpRandom
		untrap = true
		targets = [
			ratio = 64
			jump = 234,
			ratio = 64
			jump = 235,
			ratio = 0
			jump = 0,
			ratio = 0
			jump = 0
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
			chip = 52
			code = P,
			chip = 52
			code = P,
			chip = 52
			code = P,
			chip = 52
			code = P,
			chip = 52
			code = P,
			chip = 52
			code = R,
			chip = 52
			code = R,
			chip = 52
			code = R,
			chip = 52
			code = R,
			chip = 52
			code = R,
			chip = 52
			code = S,
			chip = 52
			code = S,
			chip = 52
			code = S,
			chip = 52
			code = S,
			chip = 52
			code = S,
			chip = 121
			code = B
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
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 2000,
			amount = 2000,
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
		flag = 1557
	jumpRandom
		untrap = true
		targets = [
			ratio = 64
			jump = 239,
			ratio = 64
			jump = 240,
			ratio = 0
			jump = 0,
			ratio = 0
			jump = 0
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
			chip = 52
			code = P,
			chip = 52
			code = P,
			chip = 52
			code = P,
			chip = 52
			code = P,
			chip = 52
			code = P,
			chip = 52
			code = R,
			chip = 52
			code = R,
			chip = 52
			code = R,
			chip = 52
			code = R,
			chip = 52
			code = R,
			chip = 52
			code = S,
			chip = 52
			code = S,
			chip = 52
			code = S,
			chip = 52
			code = S,
			chip = 52
			code = S,
			chip = 121
			code = B
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
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 2000,
			amount = 2000,
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
script 242 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 244
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
		chip = 185
		code = H
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 185
	" "
	printCode
		buffer = 0
		code = H
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1558
	end
}
script 243 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 244
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
		chip = 119
		code = L
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = L
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1559
	end
}
script 244 mmbn2 {
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
