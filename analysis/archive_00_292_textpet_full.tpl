@archive 0789338
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ふう、いきがつまるとおもったぜ・・・"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"いかん! スロットルがきかん!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"こうどが、さがっていきます!"
	keyWait
	clearMsg
	"""
	こうど、42000フィート!
	41000フィート、40000フィート
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"むぅっ、ニホンはもうスグだというのに!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"こんどは、ナニがおきたんですか!?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	ひこうきの、こうどがすごいいきおいで
	さがってるんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"それって、おちてるってことじゃん!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン!"
	keyWait
	clearMsg
	"""
	ひこうきが、おちはじめてる!
	いそいで、スロットルプログラムを
	しゅうふくしてくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
