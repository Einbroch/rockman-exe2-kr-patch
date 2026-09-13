@archive 0766958
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1800
	"""
	熱斗くん、メール!
	また 炎山くんから だよ!!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココデハ、データノ アドレスガ
	ポイント ポイントニ カイテアリマス
	"""
	keyWait
	clearMsg
	"アドレスガ 「00」ノ トコロニ・・・"
	keyWait
	clearMsg
	"""
	オット! コレ イジョウハ
	イエマセン デス・・・
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ドガーーーーーーーーーン!!!!!"
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"ビックリ シマシタ?"
	keyWait
	end
}
script 220 mmbn2 {
	checkFlag
		flag = 0
		jumpIfTrue = 224
		jumpIfFalse = continue
	checkFlag
		flag = 643
		jumpIfTrue = 223
		jumpIfFalse = continue
	msgOpen
	"""
	まるがたの モニターが ある
	ここから きばくプログラムを バクダンに
	おくる メイレイが じっこうされる・・・
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 165
	flagSet
		flag = 643
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
		flag = 1328
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 1
		code = C
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 1
	" "
	printCode
		buffer = 0
		code = C
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
		flag = 1329
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 500
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「500ゼニー」
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
		flag = 1330
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 1
		code = C
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 1
	" "
	printCode
		buffer = 0
		code = C
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
		flag = 1331
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 500
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「500ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
