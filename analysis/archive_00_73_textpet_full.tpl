@archive 0766708
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = Glide
	msgOpen
	"ロックマンさん! きてくれたんですね!"
	keyWait
	clearMsg
	"""
	このサキ でんのうガスの
	ふきだしが はげしくて
	ワタシでは ちかづけないのです!
	"""
	keyWait
	clearMsg
	"やいとサマを すくってください!"
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 7
		upper = 255
		jumpIfInRange = 226
		jumpIfOutOfRange = continue
	checkFlag
		flag = 562
		jumpIfTrue = 224
		jumpIfFalse = continue
	msgOpen
	"""
	かんきせんの プログラムだ
	しかし エラーが出て とまっている・・・
	"""
	keyWait
	clearMsg
	"""
	ロックマンは、
	かんきせんの プログラムの
	エラーを とりのぞいた!
	"""
	keyWait
	clearMsg
	soundPlay
		track = 167
	soundDisableTextSFX
	"""
	かんきせんの プログラムが
	うごきだした!
	"""
	keyWait
	soundEnableTextSFX
	flagSet
		flag = 557
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	でんのうもとせん
	を ひねった!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"でんのうガスが とまった!"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"でんのうガスが ふきだす!"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	かんきせんの プログラムだ
	ちゃんと うごいている
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	でんのうガスの ふきだまりだ!!
	ゆくてが さえぎられている!
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	かんきせんの プログラムだ
	今は とくに なにもしなくていい
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
		flag = 1323
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
		flag = 1324
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 98
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 98
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
	1メガ ふえた!!
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
	checkGiveItem
		item = 112
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 233
		jumpIfSome = 233
	flagSet
		flag = 1325
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 112
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
	"「"
	printItem
		buffer = 0
		item = 112
	"""
	」が
	いっぱいで もうもてない!
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
	flagSet
		flag = 1326
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
