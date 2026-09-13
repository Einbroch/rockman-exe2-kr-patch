@archive 0777F74
@size 255

script 0 mmbn2 {
	msgOpen
	"""
	このオクに ススむコトが
	デキるのは、
	"""
	keyWait
	clearMsg
	"ホシのアカシを もち・・・"
	keyWait
	clearMsg
	"""
	130いじょうの しゅを しるもの
	のみ・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ボウズ、ワルいコトは イわねえ
	スグに、ヒきカエしたホウが いいぜ
	"""
	keyWait
	clearMsg
	"このサキは、インターネットの さいしんぶ"
	keyWait
	clearMsg
	"""
	プラグアウトもデキない
	キョウフのエリアだ
	"""
	keyWait
	clearMsg
	"ジゴクのオニも ハダシで ニげダすぜ"
	keyWait
	end
}
script 220 mmbn2 {
	checkItem
		item = 87
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
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
script 221 mmbn2 {
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
		flag = 214
	wait
		frames = 102
	end
}
script 222 mmbn2 {
	jump
		target = 0
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
		flag = 1540
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
	checkFlag
		flag = 2144
		jumpIfTrue = continue
		jumpIfFalse = 232
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
		target = 232
}
script 232 mmbn2 {
	flagSet
		flag = 1541
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 233,
			ratio = 32
			jump = 234,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 235
		]
	flagClear
		flag = 2144
}
script 233 mmbn2 {
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
script 234 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 148
			code = G,
			chip = 148
			code = G,
			chip = 148
			code = G,
			chip = 148
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
script 235 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
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
script 236 mmbn2 {
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
		jumpIfFalse = 237
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
		target = 237
}
script 237 mmbn2 {
	flagSet
		flag = 1542
	jumpRandom
		untrap = true
		targets = [
			ratio = 16
			jump = 238,
			ratio = 48
			jump = 239,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 240
		]
	flagClear
		flag = 2144
}
script 238 mmbn2 {
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
script 239 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 148
			code = G,
			chip = 148
			code = G,
			chip = 148
			code = G,
			chip = 148
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
script 240 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
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
script 241 mmbn2 {
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
		jumpIfFalse = 242
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
		target = 242
}
script 242 mmbn2 {
	flagSet
		flag = 1543
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 243,
			ratio = 64
			jump = 244,
			ratio = 0
			jump = 0,
			ratio = 32
			jump = 245
		]
	flagClear
		flag = 2144
}
script 243 mmbn2 {
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
script 244 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 41
			code = V,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 53
			code = A,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 137
			code = I,
			chip = 148
			code = G,
			chip = 148
			code = G,
			chip = 148
			code = G,
			chip = 148
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
script 245 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
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
script 246 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ホシのアカシ・・・
	・・・130・・・
	"""
	keyWait
	end
}
script 247 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ホシのアカシ・・・
	・・・130・・・
	"""
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"さあ トオるがよい"
	keyWait
	end
}
