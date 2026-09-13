@archive 0766DF0
@size 255

script 220 mmbn2 {
	checkFlag
		flag = 0
		jumpIfTrue = 224
		jumpIfFalse = continue
	checkFlag
		flag = 645
		jumpIfTrue = 223
		jumpIfFalse = continue
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 165
	flagSet
		flag = 645
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
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 134
	"ピピッピ!"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 225
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
script 225 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"光!"
	keyWait
	clearMsg
	jump
		target = 226
}
script 226 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山! そっちは どうだ!?"
	keyWait
	clearMsg
	jump
		target = 227
}
script 227 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	しんぱいには およばん
	それより きくんだ
	"""
	keyWait
	clearMsg
	"""
	バクダンを かいせき してみたんだが
	かぎられたエリアからの きばくプログラム
	しか じゅしん できないようだ
	"""
	keyWait
	clearMsg
	"""
	つまり きばくそうちは
	すべて このきんぺんに あるにちがいない
	"""
	keyWait
	clearMsg
	"""
	こんなことをする はんにんは
	ほぼ 100% ゆかいはん だ
	と いうことは・・・
	"""
	keyWait
	clearMsg
	"""
	はんにんは おそらく
	さいごの スイッチを
	じぶんで にぎっている!!
	"""
	keyWait
	clearMsg
	"光! はんにんを さがし出せ!"
	keyWait
	clearMsg
	jump
		target = 228
}
script 228 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"わかった!"
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
		flag = 1336
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 130
		code = L
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 130
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
		flag = 1337
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 1500
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「1500ゼニー」
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
		flag = 1338
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
