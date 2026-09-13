@archive 07616E8
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 45
		upper = 45
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	flagSet
		flag = 563
	wait
		frames = 1
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"オレたちは・・・"
	waitSkip
		frames = 30
	"\nだれかに おどらされていたのか・・・"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	ラウルさん 気がつかないの?
	"""
	keyWait
	end
}
script 6 mmbn2 {
	checkFlag
		flag = 565
		jumpIfTrue = 7
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	ラウルさん 気がつかないの?
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、こっちには
	上にのぼっていく みちは なさそうだよ
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"カレのことは オレに まかせろ・・・"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	かたく とざされている!
	こちらからは あけられないようだ!!
	"""
	keyWait
	end
}
