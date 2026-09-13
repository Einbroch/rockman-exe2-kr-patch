@archive 07658A8
@size 255

script 220 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、エレベーターに のるなら
	スイッチ おさなきゃ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	flagSet
		flag = 550
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	電磁波のえいきょうで
	ロックがかかっている・・・
	はいれそうにない
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 324
		jumpIfTrue = continue
		jumpIfFalse = 230
	jump
		target = 231
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	電磁波のえいきょうで
	ロックがかかっている・・・
	はいれそうにない
	"""
	keyWait
	end
}
script 230 mmbn2 {
	flagSet
		flag = 324
	msgOpen
	"""
	・・・が、
	ドアノブの上に なにか のっかっている
	
	"""
	textSpeed
		delay = 10
	"・・・"
	textSpeed
		delay = 2
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	熱斗は、
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
	playerReset
	keyWait
	end
}
script 231 mmbn2s {
	end
}
