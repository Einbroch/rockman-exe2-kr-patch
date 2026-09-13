@archive 077AD3C
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"それでは イマから、\n"
	printItem
		buffer = 0
		item = 58
	"""
	の シケンを
	ハジめます!
	"""
	keyWait
	clearMsg
	"""
	コンカイは、あなたが
	ウイルスに マけずに インターネットを
	アルけるかどうかの シケンです!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 254
	"ピロピロピロピロ"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ハイ! インターネットのどこかに
	「
	"""
	printItem
		buffer = 0
		item = 1
	"」と 「"
	printItem
		buffer = 0
		item = 2
	"""
	」
	を セットしました!
	"""
	keyWait
	clearMsg
	"""
	この2つを ミつけたら、
	ここに モドってキてクダさい
	そしたら 
	"""
	printItem
		buffer = 0
		item = 58
	"をあげます!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"行こうぜ! ロックマン!"
	keyWait
	clearMsg
	jump
		target = 4
}
