@archive 073E1EC
@size 81

script 0 mmbn2 {
	checkChapter
		lower = 16
		upper = 72
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 14
		upper = 15
		jumpIfInRange = 70
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
script 70 mmbn2 {
	checkFlag
		flag = 645
		jumpIfTrue = 74
		jumpIfFalse = continue
	checkFlag
		flag = 644
		jumpIfTrue = 73
		jumpIfFalse = continue
	checkFlag
		flag = 643
		jumpIfTrue = 72
		jumpIfFalse = continue
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
}
script 71 mmbn2 {
	checkFlag
		flag = 1928
		jumpIfTrue = 77
		jumpIfFalse = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	モニターを さがし出して
	きばくプログラムを ムコウに するんだ!
	"""
	keyWait
	end
}
script 72 mmbn2 {
	checkSubArea
		lower = 0
		upper = 0
		jumpIfInRange = 75
		jumpIfOutOfRange = 71
}
script 73 mmbn2 {
	checkSubArea
		lower = 0
		upper = 1
		jumpIfInRange = 75
		jumpIfOutOfRange = 71
}
script 74 mmbn2 {
	checkSubArea
		lower = 0
		upper = 2
		jumpIfInRange = 75
		jumpIfOutOfRange = 76
}
script 75 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	この中の きばくプログラムは
	もう ムコウに したぞ!
	つぎを さがそう
	"""
	keyWait
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	クイックマンを さがし出すんだ!!
	"""
	keyWait
	end
}
script 77 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	きばくプログラムを ムコウに するんだ!
	その中のどこかで せいぎょ してるはず!
	"""
	keyWait
	end
}
