@archive 07612DC
@size 255

script 0 mmbn2 {
	checkFlag
		flag = 546
		jumpIfTrue = 2
		jumpIfFalse = continue
	checkFlag
		flag = 557
		jumpIfTrue = 1
		jumpIfFalse = continue
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	ナイトマンが
	こんなに きずつくなんて・・・
	"""
	waitSkip
		frames = 30
	keyWait
	clearMsg
	"""
	わたくし 「ゴスペル」を あまく
	みていました・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	flagSet
		flag = 546
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"わたくしも すぐに 行きます!"
	keyWait
	clearMsg
	"""
	ただ、きりふだの バトルチップを
	おとしてしまった みたいなのです・・・
	"""
	keyWait
	clearMsg
	"""
	あなたたちに めいわくは かけられません
	さきに 行っていて 下さい!!
	さあ はやく!!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	なにを しているのです!
	さあ はやく!!
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"う、ウイルスも こええけど、"
	keyWait
	clearMsg
	"""
	こっちのが
	ゴーストが 出そうで こええよぉ・・・
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 1
	"""
	カミサマ オマモリ クダサイ
	カミサマ オマモリ クダサイ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	トラップの プログラムに よって
	かたく とじられている!
	"""
	keyWait
	end
}
script 221 mmbn2 {
	checkChapter
		lower = 48
		upper = 255
		jumpIfInRange = 225
		jumpIfOutOfRange = continue
	msgOpen
	"""
	トビラの かいへいスイッチだ!
	プラグイン できるようだ!!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkChapter
		lower = 48
		upper = 255
		jumpIfInRange = 226
		jumpIfOutOfRange = continue
	msgOpen
	"""
	かたく とざされている!
	こちらからは あけられないようだ!!
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	かたく とざされている!
	こちらからは あけられないようだ!!
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	トビラの かいへいスイッチだ
	プラグイン できる
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	かたく とざされている
	こちらからは あけられないようだ・・・
	"""
	keyWait
	end
}
