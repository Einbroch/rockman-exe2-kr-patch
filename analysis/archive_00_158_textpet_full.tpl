@archive 07792EC
@size 255

script 220 mmbn2 {
	msgOpen
	"""
	あまたあるモノ・・・
	なんじの、タテとなりホコとなるモノ・・・
	"""
	keyWait
	clearMsg
	"""
	そのほとんどを てにいれしもののまえに
	このトビラひらかれん・・・
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
		item = 63
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
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
script 223 mmbn2 {
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
		flag = 135
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
		flag = 134
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
		flag = 136
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
		flag = 1568
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
		flag = 1569
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 49
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 49
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
		flag = 1570
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 101
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 101
	"""
	」
	を ゲットした!!
	"""
	keyWait
	clearMsg
	playerFinish
	playerReset
	playerUnlock
	"""
	サブチップを もてるかずが
	1つ ふえた!
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
	checkFlag
		flag = 2144
		jumpIfTrue = continue
		jumpIfFalse = 234
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
		target = 234
}
script 234 mmbn2 {
	flagSet
		flag = 1571
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 235,
			ratio = 64
			jump = 236,
			ratio = 0
			jump = 0,
			ratio = 32
			jump = 237
		]
	flagClear
		flag = 2144
}
script 235 mmbn2 {
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
script 236 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 116
			code = Y,
			chip = 116
			code = Y,
			chip = 116
			code = Y,
			chip = 116
			code = Y
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
script 237 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 8000,
			amount = 8000,
			amount = 8000,
			amount = 8000
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
script 238 mmbn2 {
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
		jumpIfFalse = 239
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
		target = 239
}
script 239 mmbn2 {
	flagSet
		flag = 1572
	jumpRandom
		untrap = true
		targets = [
			ratio = 16
			jump = 240,
			ratio = 48
			jump = 241,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 242
		]
	flagClear
		flag = 2144
}
script 240 mmbn2 {
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
script 241 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 116
			code = Y,
			chip = 116
			code = Y,
			chip = 116
			code = Y,
			chip = 116
			code = Y
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
script 242 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 8000,
			amount = 8000,
			amount = 8000,
			amount = 8000
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
script 243 mmbn2 {
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
		jumpIfFalse = 244
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
		target = 244
}
script 244 mmbn2 {
	flagSet
		flag = 1573
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 245,
			ratio = 64
			jump = 246,
			ratio = 0
			jump = 0,
			ratio = 32
			jump = 247
		]
	flagClear
		flag = 2144
}
script 245 mmbn2 {
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
script 246 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 152
			code = *,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 165
			code = M,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 112
			code = *,
			chip = 116
			code = Y,
			chip = 116
			code = Y,
			chip = 116
			code = Y,
			chip = 116
			code = Y
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
script 247 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 8000,
			amount = 8000,
			amount = 8000,
			amount = 8000
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
script 248 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 250
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
	keyWait
	msgClose
	flagSet
		flag = 1574
	end
}
script 249 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 250
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
		chip = 186
		code = X
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 186
	" "
	printCode
		buffer = 0
		code = X
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1575
	end
}
script 250 mmbn2 {
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
