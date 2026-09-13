@archive 073E64C
@size 181

script 0 mmbn2 {
	checkChapter
		lower = 48
		upper = 72
		jumpIfInRange = 180
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 45
		jumpIfInRange = 165
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
script 165 mmbn2 {
	checkSubArea
		lower = 3
		upper = 4
		jumpIfInRange = 168
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 2
		upper = 2
		jumpIfInRange = 170
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 1
		upper = 1
		jumpIfInRange = 169
		jumpIfOutOfRange = continue
	checkFlag
		flag = 555
		jumpIfTrue = 167
		jumpIfFalse = 166
	end
}
script 166 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン! おしろの トラップを
	せいぎょしている プログラムを
	さがし出して ていし させるんだ!!
	"""
	keyWait
	end
}
script 167 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ここの トラッププログラムは
	もう ていし させたな・・・
	先を いそごう!!
	"""
	keyWait
	end
}
script 168 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ナイトマンを さがし出すんだ!
	これいじょう プリンセスの すきに
	させるわけには いかない!!
	"""
	keyWait
	end
}
script 169 mmbn2 {
	checkFlag
		flag = 557
		jumpIfTrue = 167
		jumpIfFalse = 166
	end
}
script 170 mmbn2 {
	checkFlag
		flag = 562
		jumpIfTrue = 167
		jumpIfFalse = 166
	end
}
