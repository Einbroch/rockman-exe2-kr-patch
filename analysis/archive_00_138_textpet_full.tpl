@archive 07733A4
@size 255

script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1811
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	なんだよ おめぇ!
	ここには もう ナニもナいよ!!
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ボクハ ワルイ プログラム ダゾー!!
	ナンカ モンク アンノカ!!
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"ウッシッシ・・・"
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	おまえなんかに
	ここが コワせると オモってんのかよ!
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ゴスペル バンザイ!!"
	keyWait
	end
}
script 210 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 37
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 595
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 23
		field = 65
		music = 27
}
script 211 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 37
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 596
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 24
		field = 65
		music = 27
}
script 212 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 37
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 597
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 25
		field = 65
		music = 27
}
