@archive 078D8CC
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どうやら ここみたいだな・・・"
	keyWait
	clearMsg
	"""
	どこかに 電磁波を コントロールしている
	プログラムが あるはず! 
	"""
	waitSkip
		frames = 30
	"""
	そいつを
	さがしだして デリート するんだ!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 525
	jump
		target = 1
}
