@archive 078052C
@size 17

script 0 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタカタカタ・・・"
	wait
		frames = 84
	controlUnlock
	soundEnableTextSFX
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	なぞの ナビのてによって
	アジーナは かいめつしました
	"""
	keyWait
	clearMsg
	"""
	このままでは ほかのクニにまで
	ひがいが でます・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ねぇ、ここでなにがあったの?"
	keyWait
	flagSet
		flag = 580
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"&*%♥♪!?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	アジーナご みたいだ
	ほんやくシステムきどう!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 282
	"ピピッ"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"だれだ!?"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ボクは、ロックマン
	このクニから おくられてきた
	ふうせんを ひろって
	"""
	keyWait
	clearMsg
	"""
	おくりぬしに あうために
	ニホンからきたんだ
	"""
	keyWait
	clearMsg
	"ね、ここでなにがあったの?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	それが・・・・・・
	わからないんだ・・・
	"""
	keyWait
	clearMsg
	"""
	いつもより、おそくプラグインしたら
	アジーナスクエアが、こんなじょうたいで
	それで、おうさまが たおれてて・・・
	"""
	keyWait
	clearMsg
	"""
	そういえば、キミ ニホンから
	きたんだろう?
	"""
	keyWait
	clearMsg
	"""
	おうさまが しぬまぎわに
	このクニを ほろぼしたヤツらの
	つぎのターゲットは・・・
	"""
	keyWait
	clearMsg
	"ニホンだって いってた!!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだって!?"
	soundStop
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"いそいでニホンにかえらなきゃ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = CutMan
	msgOpen
	"そうは させないよ"
	soundPlayBGM
		track = 34
	keyWait
	soundPlay
		track = 222
	flagSet
		flag = 587
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"だれだ!?"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = CutMan
	msgOpen
	"""
	ゴスペル アジーナこうりゃくぶたい
	ふくたいちょう 
	"""
	flagClear
		flag = 587
	soundPlay
		track = 223
	"カットマン!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	flagSet
		flag = 587
	mugshotShow
		mugshot = CutMan
	msgOpen
	"ま、ふくたいちょうと いっても"
	keyWait
	clearMsg
	"""
	たいちょうが かいめつさせた
	クニにいきのこりが いないか
	しらべるのが しごとなんだけどね
	"""
	keyWait
	clearMsg
	"""
	たいちょうは いまごろ
	ニホンに むかってるんじゃないかな?
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"また、ゴスペルか!!"
	keyWait
	clearMsg
	jump
		target = 16
}
