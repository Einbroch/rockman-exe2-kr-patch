@archive 077FBD7
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ハイハイ、ロックマン.EXEさん
	ですね
	"""
	keyWait
	clearMsg
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタ"
	wait
		frames = 91
	controlUnlock
	"\n"
	soundPlay
		track = 139
	"ピーーン!"
	keyWait
	clearMsg
	soundEnableTextSFX
	"トウロクかんりょう!"
	keyWait
	clearMsg
	"""
	これで、いつでもしけんを
	うけることができます
	"""
	keyWait
	clearMsg
	"""
	しけんにチャレンジしたいときは
	ワタシに はなしかけてください
	"""
	keyWait
	end
	"   "
}
