@archive 077CE88
@size 13

script 0 mmbn2 {
	msgOpen
	"そして・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"""
	
	熱斗と ロックマンが
	ねむりに ついたころ・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"ん?"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"・・・"
	waitSkip
		frames = 30
	"この かきこみは?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"どうした? "
	waitSkip
		frames = 30
	"ブルース!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	炎山さま ごらん下さい
	このような かきこみが・・・
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"PETに ディスプレイ してくれ"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"ハッ!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotHide
	msgOpen
	"「ニホンの みなさまに\n あす、世界の 「ゴスペル」の\n いだいさを ごらんに いれます"
	keyWait
	clearMsg
	" ・・・"
	waitSkip
		frames = 30
	"で おおくの人が ぎせいに\n なるでしょう ・・・"
	waitSkip
		frames = 30
	"おたのしみに」"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"はんこうよこく、"
	waitSkip
		frames = 30
	"か・・・"
	waitSkip
		frames = 30
	"\nフン、クズめが!"
	waitSkip
		frames = 30
	"\n・・・くだらん かきこみを するっ"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"ブルース!"
	waitSkip
		frames = 30
	"""
	
	「オフィシャルネットバトラーけんげん」で
	そのかきこみを さくじょ しておけ!
	"""
	keyWait
	clearMsg
	"""
	ガセネタとは おもうが、
	ほおっておくと かならず
	まにうけて さわぎ出す ヤツがいる
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"ハッ!"
	keyWait
	clearMsg
	jump
		target = 12
}
