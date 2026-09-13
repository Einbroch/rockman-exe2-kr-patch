@archive 07785F4
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ギヌロ・・・"
	keyWait
	clearMsg
	"ギヌロ ギヌロ・・・"
	keyWait
	clearMsg
	"コウゲキ シテコナイ?"
	keyWait
	clearMsg
	"アナタ ヒョットシテ イイナビ?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = continue,
			jump = continue
		]
	"ジャア イマノハ ナシデス"
	keyWait
	clearMsg
	"ギヌロ・・・"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ホ・・・"
	keyWait
	clearMsg
	"コシ ヌケタ・・・"
	keyWait
	clearMsg
	"ハッタリハ ツカレマス・・・"
	keyWait
	end
}
script 190 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	おい、アオいの!
	ハナシは キいてるぜ・・・
	"""
	keyWait
	clearMsg
	"""
	オレたちの ナカマを デリートして
	マワってるんだってな
	"""
	keyWait
	clearMsg
}
script 191 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"と、いうコトは・・・ おまえが・・・"
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	そうさ、オレが 「ブラック・ナビズ」の
	ナンバー2だ!
	"""
	keyWait
	clearMsg
	"""
	オレを ナンバー3や4と、
	オナじだと オモうなよ
	"""
	keyWait
	clearMsg
	"""
	オレと、コトブキエリアにいる
	ナンバー1は、ベッカク・・・
	"""
	keyWait
	clearMsg
	"そう、ベッカクのツヨさだ!"
	keyWait
	clearMsg
	"""
	オレたちは、「ブラック・ナビズ」を
	セカイジュウに カクダイさせ、
	"""
	keyWait
	clearMsg
	"""
	「WWW」や、「ゴスペル」イジョウの
	ネット ハンザイ シュウダンに
	セイチョウさせるのだ
	"""
	keyWait
	clearMsg
	"""
	こんなトコロで、おマエなんぞに
	マけては、おれんのだ!
	"""
	keyWait
	clearMsg
	"カクゴしな!"
	keyWait
	clearMsg
	flagSet
		flag = 297
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 59
		field = 65
		music = 27
}
script 220 mmbn2 {
	checkItem
		item = 61
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
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
script 221 mmbn2 {
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
		flag = 298
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
		flag = 1550
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
		flag = 1551
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
		flag = 1552
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
			chip = 147
			code = G,
			chip = 147
			code = G,
			chip = 147
			code = G,
			chip = 147
			code = G,
			chip = 155
			code = K,
			chip = 155
			code = K,
			chip = 155
			code = K,
			chip = 155
			code = K,
			chip = 144
			code = *,
			chip = 144
			code = *,
			chip = 144
			code = *,
			chip = 144
			code = *,
			chip = 128
			code = W,
			chip = 128
			code = W,
			chip = 128
			code = W,
			chip = 128
			code = W
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
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 4000,
			amount = 4000,
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
		flag = 1553
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
			chip = 147
			code = G,
			chip = 147
			code = G,
			chip = 147
			code = G,
			chip = 147
			code = G,
			chip = 155
			code = K,
			chip = 155
			code = K,
			chip = 155
			code = K,
			chip = 155
			code = K,
			chip = 144
			code = *,
			chip = 144
			code = *,
			chip = 144
			code = *,
			chip = 144
			code = *,
			chip = 128
			code = W,
			chip = 128
			code = W,
			chip = 128
			code = W,
			chip = 128
			code = W
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
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 4000,
			amount = 4000,
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
	playerFinish
	playerUnlock
	keyWait
	end
}
