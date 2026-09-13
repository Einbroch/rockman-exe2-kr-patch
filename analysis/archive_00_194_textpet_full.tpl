@archive 077D2D8
@size 16

script 0 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	おくデンだに に
	とうちゃくだぜーーーっ!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"さ、キャンプじょう イコ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"OK!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"あら?"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山!?"
	waitSkip
		frames = 30
	"\nなんだー? こないんじゃ なかったのか?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"フン・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ちぇー きたいなら きたいって
	はっきり 言えば いいのにさ!
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
	"""
	べつに きたくて
	きた わけじゃないが・・・
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なんで いっつも そう
	すなお じゃないんだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗!"
	waitSkip
		frames = 30
	"""
	
	せっかく きてくれたんだから
	そんなふうに 言わないの!
	"""
	keyWait
	clearMsg
	"炎山くんも、ほら"
	waitSkip
		frames = 30
	"""
	
	どうせ キャンプに 行くんだったら
	みんなと なかよく しようよ、ね?
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"ん・・・"
	waitSkip
		frames = 30
	"""
	ああ、
	キミが そう言うのなら そうしよう
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	あら、メイルちゃんの 言うコトなら
	すなおに きくじゃない?
	"""
	waitSkip
		frames = 30
	"\nいいの? 光くん?"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"しらねーよ!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"おいおい おめえら! "
	waitSkip
		frames = 30
	"""
	さっきから
	オレさまを わすれてんじゃねえぞ!
	"""
	keyWait
	clearMsg
	"""
	いいか!
	たいちょうは このデカオさまだ!
	それじゃ いくぞっ!
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
