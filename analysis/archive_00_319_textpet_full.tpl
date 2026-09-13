@archive 078D4C0
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やった!!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あとは・・・"
	waitSkip
		frames = 30
	"たのむぜ!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"これで・・・"
	waitSkip
		frames = 30
	"と"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	flagSet
		flag = 520
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 51
	"""
	」を
	コントロールプログラムに はめこんだ!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ここは・・・さっきと おなじばしょ?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	さいじょうかいの ネットワークに
	アクセス できたわけじゃ なさそうだな
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	でも コントロールプログラムは
	せいじょうか してるから どこかに
	へんかが おきてると おもうんだけど?
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
	"""
	エレベーターかも しんないな
	よし! いったん プラグアウトしてくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
