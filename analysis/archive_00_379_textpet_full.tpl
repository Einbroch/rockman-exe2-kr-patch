@archive 073E8EC
@size 200

script 0 mmbn2 {
	checkChapter
		lower = 55
		upper = 255
		jumpIfInRange = 193
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 180
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
script 180 mmbn2 {
	checkFlag
		flag = 567
		jumpIfTrue = 187
		jumpIfFalse = continue
	checkFlag
		flag = 566
		jumpIfTrue = 199
		jumpIfFalse = continue
	checkFlag
		flag = 565
		jumpIfTrue = 198
		jumpIfFalse = continue
	checkFlag
		flag = 553
		jumpIfTrue = 197
		jumpIfFalse = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、うよくエンジンプログラムを
	さがすんだ!!
	"""
	keyWait
	end
}
script 187 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ちゃくりくが しっぱいしたら
	タイヘンだ!!
	ギアせいぎょプログラムを さがすんだ!
	"""
	keyWait
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	マグネットマンの じけんの えいきょうは
	もう ないみたいだな・・・
	"""
	keyWait
	end
}
script 197 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	つぎは、びよくプログラムか!
	ドコにあるんだ!?
	"""
	keyWait
	end
}
script 198 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	よし、ロックマン、
	きあつちょうせいプログラムを
	さがすぞ!
	"""
	keyWait
	end
}
