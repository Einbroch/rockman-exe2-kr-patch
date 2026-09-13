@archive 07866A4
@size 10

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ラウルさん! ラウルさん!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"ハァ・・・ハァ・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"まだ イキがある! たすかるよ!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"!!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	光・・・まさかとは おもったが
	「ゴスペル」の ネットバトラー
	やはり おまえだったか・・・
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山 なにいってんだ!?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"フン・・・とぼけるというのか・・・"
	keyWait
	clearMsg
	"""
	だが、この じょうきょうが
	うごかぬ しょうこ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちがうよ! オレも いまきたところ!"
	waitSkip
		frames = 30
	"""
	
	・・・って おまえも 「ゴスペル」じゃ
	ないのかよ?
	"""
	keyWait
	clearMsg
	"""
	じゃあ いったい だれが
	ラウルさんを・・・みんなを
	やったんだ!?
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"わけの わからないことを・・・"
	keyWait
	clearMsg
	"""
	とにかく
	オフィシャル けんげんで
	おまえを タイホする
	"""
	keyWait
	clearMsg
	"""
	じじょうは あとで ゆっくりきこう
	だが そのまえに・・・
	"""
	keyWait
	clearMsg
	"しょあくの こんげん ロックマン.EXE"
	waitSkip
		frames = 30
	"\n・・・いや! "
	waitSkip
		frames = 30
	"""
	「きょうあくウイルス
	ロックマン」を デリートさせてもらう!
	"""
	keyWait
	clearMsg
	"""
	ブルースよ!
	ウイルスバスティングだ!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
