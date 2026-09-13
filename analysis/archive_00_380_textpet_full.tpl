@archive 073EBBC
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 240
		jumpIfOutOfRange = continue
	msgOpen
	"""
	Lボタンを おせば、
	熱斗と ロックマンが かいわできるぞ!
	(ここは まだ入ってません)
	"""
	keyWait
	end
}
script 240 mmbn2 {
	checkChapter
		lower = 72
		upper = 72
		jumpIfInRange = 254
		jumpIfOutOfRange = continue
	checkFlag
		flag = 566
		jumpIfTrue = 252
		jumpIfFalse = continue
	checkChapter
		lower = 71
		upper = 71
		jumpIfInRange = 250
		jumpIfOutOfRange = continue
	checkFlag
		flag = 559
		jumpIfTrue = 248
		jumpIfFalse = continue
	checkFlag
		flag = 556
		jumpIfTrue = 247
		jumpIfFalse = continue
	checkChapter
		lower = 69
		upper = 69
		jumpIfInRange = 246
		jumpIfOutOfRange = continue
	end
}
script 246 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	ネットワークの いじょうを
	なおして いくんだ!!
	"""
	keyWait
	end
}
script 247 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	今は ここより
	さいじょうかいを めざすのが 先か・・・
	"""
	keyWait
	end
}
script 248 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	今は ここより
	さいじょうかいを しらべなきゃ・・・
	"""
	keyWait
	end
}
script 250 mmbn2 {
	checkSubArea
		lower = 4
		upper = 4
		jumpIfInRange = 251
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ここは もういい・・・
	さいじょうかいの へやに もどらなきゃ!
	"""
	keyWait
	end
}
script 251 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン! 電磁波を
	コントロールしている プログラムを
	見つけて デリートするんだ!
	"""
	keyWait
	end
}
script 252 mmbn2 {
	checkSubArea
		lower = 4
		upper = 4
		jumpIfInRange = 253
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン! そろそろ
	さいじょうかいの オクのへや 行くぜ!
	"""
	keyWait
	end
}
script 253 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	そろそろ さっきのへや 行くぜ!
	"""
	keyWait
	end
}
