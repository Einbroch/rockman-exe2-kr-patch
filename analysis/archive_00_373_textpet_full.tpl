@archive 073D814
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
	checkFlag
		flag = 551
		jumpIfTrue = 245
		jumpIfFalse = continue
	checkChapter
		lower = 67
		upper = 67
		jumpIfInRange = 244
		jumpIfOutOfRange = continue
	end
}
script 244 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ゴスペルの ほんきょち・・・おそらく
	マンションの さいじょうかいに・・・
	"""
	keyWait
	end
}
script 245 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	みんな・・・うれしいね・・・
	さあ マンションの さいじょうかいに
	いそごう!!
	"""
	keyWait
	end
}
script 246 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	マンションの ネットワークの
	いじょうを なおして いこう!
	ボクに まかせて!!
	"""
	keyWait
	end
}
script 247 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	マンションの さいじょうかい
	のりこめるか どうか たしかめてみよう!
	"""
	keyWait
	end
}
script 248 mmbn2 {
	checkSubArea
		lower = 11
		upper = 11
		jumpIfInRange = 249
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	マンションの さいじょうかい、
	できるだけ はやく もどろう!
	"""
	keyWait
	end
}
script 249 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	このかいの どこかに
	ゴスペルの ボスが・・・
	行こう! 熱斗くん!
	"""
	keyWait
	end
}
script 250 mmbn2 {
	checkSubArea
		lower = 11
		upper = 11
		jumpIfInRange = 251
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん
	今は さいじょうかいの サーバーに
	アクセス しなきゃ!
	"""
	keyWait
	end
}
script 251 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん
	今は へやにあった サーバーに
	アクセス しなきゃ!
	"""
	keyWait
	end
}
script 252 mmbn2 {
	checkSubArea
		lower = 11
		upper = 11
		jumpIfInRange = 253
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、さいじょうかいの・・・
	あのへやを しらべなきゃ!
	"""
	keyWait
	end
}
script 253 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、さっきの オク・・・
	あのへやを しらべなきゃ!
	"""
	keyWait
	end
}
