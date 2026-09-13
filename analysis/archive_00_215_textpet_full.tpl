@archive 077FE88
@size 3

script 0 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 134
	"ピピピピピ"
	wait
		frames = 30
	"\n"
	soundPlay
		track = 265
	"ピキーン!"
	wait
		frames = 30
	keyWait
	soundEnableTextSFX
	flagSet
		flag = 29
	clearMsg
	"""
	Aライセンス かくにんしました
	セキュリティキューブ かいじょします
	"""
	wait
		frames = 60
	"\nおとおりください"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	やたっ!
	行くぜ ロックマン
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
