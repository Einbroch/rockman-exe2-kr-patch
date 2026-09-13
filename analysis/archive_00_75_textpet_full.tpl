@archive 0766BB8
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココデハ バトルフィールドニ
	トキドキ フハツダンガ コロガッテイマス
	"""
	keyWait
	clearMsg
	"""
	フハツダンニ ホノオ ゾクセイノ
	コウゲキガ アタルト エリア ゼンタイニ
	ヒロガル ダイバクハツガ オキマス!!
	"""
	keyWait
	clearMsg
	"""
	アイテノ エリアニ アルトキハ イイケド
	ジブンノ エリアニ アルトキハ
	キヲ ツケナイト イタイメヲ ミマス
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkFlag
		flag = 0
		jumpIfTrue = 224
		jumpIfFalse = continue
	checkFlag
		flag = 644
		jumpIfTrue = 223
		jumpIfFalse = continue
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 165
	flagSet
		flag = 644
	"カチ!"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	ロックマンは、きばくプログラムを
	バクダンに そうしん できなくした!
	"""
	keyWait
	clearMsg
	jump
		target = 221
}
script 221 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やったよ!"
	keyWait
	clearMsg
	jump
		target = 222
}
script 222 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うん! じゃ プラグアウトして
	つぎの きばくそうちを さがそう!
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	きばくプログラムは
	すでに ムコウに なった・・・
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	きばくプログラムは
	すでに ムコウに なった・・・
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
	flagSet
		flag = 1332
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 24
		code = L
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 24
	" "
	printCode
		buffer = 0
		code = L
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
		flag = 1333
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 96
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
		flag = 1334
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 600
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「600ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
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
	flagSet
		flag = 1335
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 24
		code = L
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 24
	" "
	printCode
		buffer = 0
		code = L
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
