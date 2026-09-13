@archive 0761C90
@size 255

script 30 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	オロオロ、オロオロ・・・
	え~っと、こんなときは
	どうしたら いいのかしら・・・
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"クモにやられ・・・た・・・"
	keyWait
	end
}
script 40 mmbn2 {
	checkItem
		item = 33
		amount = 1
		jumpIfEqual = 42
		jumpIfGreater = 42
		jumpIfLess = continue
	msgOpen
	mugshotShow
		mugshot = FlightAttendant
	"""
	え? ヒモみたいなモノないかって?
	う~ん、そんなモノあったかなぁ~
	あ、ちょっとまってね
	"""
	keyWait
	clearMsg
	"たしか、ポケットのなかに・・・"
	keyWait
	clearMsg
	"あ、あった!"
	keyWait
	clearMsg
	"""
	おさいほうようの いとなんだけど
	これでだいじょうぶかな?
	"""
	keyWait
	clearMsg
	jump
		target = 41
}
script 41 mmbn2 {
	msgOpen
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 33
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 33
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
script 42 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = FlightAttendant
	"""
	クモをつかまえるの?
	がんばってね!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = continue
		jumpIfOutOfRange = 225
	checkFlag
		flag = 530
		jumpIfTrue = 224
		jumpIfFalse = 225
}
script 221 mmbn2 {
	msgOpen
	"""
	じょうむいん の へやだ
	かんけいしゃ いがい
	はいってはいけないようだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	ものおきだ・・・
	かってにあけては、いけないようだ
	"""
	keyWait
	end
}
script 223 mmbn2 {
	checkChapter
		lower = 55
		upper = 255
		jumpIfInRange = 226
		jumpIfOutOfRange = continue
	msgOpen
	"""
	わたあめのような、
	まっしろなクモが うかんでいる
	"""
	keyWait
	end
}
script 224 mmbn2 {
	flagSet
		flag = 532
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	トイレだ
	いまは、もよおしていないので
	はいるひつようはない・・・
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	くうこうのようすが みえる
	たくさんのひこうきが ならんでいる
	"""
	keyWait
	end
}
