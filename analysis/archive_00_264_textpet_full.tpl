@archive 07862CC
@size 13

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なんだ コレ!
	アチッッッ!!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	だいじょぶ!
	ちょっと 火のコが とんだだけ
	"""
	keyWait
	clearMsg
	"でも このままだと・・・マズいな"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	だっしゅつしなきゃ!
	オクのトビラ スイッチが ついてるよ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	でも プラグインしようにも
	これじゃ ちかづけそうに ないぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うーん・・・"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ちくしょー!
	こんなところで しんじゃったら
	もう みんなと・・・
	"""
	keyWait
	clearMsg
	"みんな"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"?"
	keyWait
	clearMsg
	"そうだ メイルだ!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ほんとだ! メイルちゃんだよ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うん アメロッパに くるまえに
	メイルが くれた 「
	"""
	printItem
		buffer = 0
		item = 24
	"""
	」
	アレ つかおう!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotHide
	msgOpen
	"""
	熱斗は、リュックから
	「
	"""
	printItem
		buffer = 0
		item = 24
	"""
	」
	を とりだした!!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"いくぜ!"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"よし! うまくいったぞ!"
	keyWait
	clearMsg
	jump
		target = 12
}
