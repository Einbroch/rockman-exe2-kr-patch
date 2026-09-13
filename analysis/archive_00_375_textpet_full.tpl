@archive 073E060
@size 41

script 0 mmbn2 {
	checkChapter
		lower = 7
		upper = 72
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 5
		upper = 6
		jumpIfInRange = 30
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
script 30 mmbn2 {
	checkFlag
		flag = 562
		jumpIfTrue = 37
		jumpIfFalse = continue
	checkItem
		item = 3
		amount = 1
		jumpIfEqual = 36
		jumpIfGreater = 36
		jumpIfLess = continue
	checkFlag
		flag = 556
		jumpIfTrue = 35
		jumpIfFalse = continue
	checkFlag
		flag = 554
		jumpIfTrue = 34
		jumpIfFalse = continue
	checkFlag
		flag = 545
		jumpIfTrue = 33
		jumpIfFalse = continue
	checkFlag
		flag = 544
		jumpIfTrue = 32
		jumpIfFalse = continue
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そこが
	ガスゆわかしきの プログラムか・・・
	"""
	keyWait
	clearMsg
	"""
	ガスでも かんきせんでも
	どっちでもいいから なんとかしてくれ!
	"""
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ほかの かんきせんの プログラムを
	しらべるんだ!
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"でんのうせかいには せんすは ないか?"
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	でんのうせかいじゃ、
	せんすは つかえないぞ
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"はやく アイツのところに!"
	keyWait
	end
}
