@archive 073E3E0
@size 141

script 0 mmbn2 {
	checkChapter
		lower = 32
		upper = 72
		jumpIfInRange = 140
		jumpIfOutOfRange = continue
	checkChapter
		lower = 29
		upper = 30
		jumpIfInRange = 130
		jumpIfOutOfRange = continue
	checkChapter
		lower = 26
		upper = 28
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	checkChapter
		lower = 25
		upper = 25
		jumpIfInRange = 115
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 24
		jumpIfInRange = 110
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 23
		jumpIfInRange = 105
		jumpIfOutOfRange = continue
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 18
		jumpIfInRange = 80
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
script 130 mmbn2 {
	checkFlag
		flag = 645
		jumpIfTrue = 134
		jumpIfFalse = continue
	checkFlag
		flag = 638
		jumpIfTrue = 133
		jumpIfFalse = continue
	checkFlag
		flag = 635
		jumpIfTrue = 132
		jumpIfFalse = continue
	checkFlag
		flag = 630
		jumpIfTrue = 131
		jumpIfFalse = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、セキュリティトビラを
	かいじょするんだ!
	"""
	keyWait
	end
}
script 131 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、さきにすすむぞ"
	keyWait
	end
}
script 132 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、いくぞ!
	ブルースに さきをこされるな!
	"""
	keyWait
	end
}
script 133 mmbn2 {
	checkSubArea
		lower = 0
		upper = 0
		jumpIfInRange = 135
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、さきにすすむぞ!"
	keyWait
	end
}
script 134 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ここでは、じけんは
	おきていないみたいだな
	"""
	keyWait
	end
}
script 135 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"メインシステムにいそぐぞ!!"
	keyWait
	end
}
