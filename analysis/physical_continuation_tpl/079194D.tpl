@archive 079194D
@size 2

script 0 mmbn2 {
	flagSet
		flag = 592
	mugshotShow
		mugshot = Bass
	msgOpen
	"あの おいぼれ・・・"
	waitSkip
		frames = 30
	"人間め・・・"
	keyWait
	clearMsg
	"""
	コドモを あやつり どうしようと
	オレの しったことでは ない・・・
	"""
	keyWait
	clearMsg
	"""
	だが ことわりナシに
	オレの コピーを ばらまくなど
	"""
	waitSkip
		frames = 15
	"\n・・・ゆるせん"
	keyWait
	clearMsg
	"人間・・・"
	waitSkip
		frames = 15
	"\nそんざいかちの ないヤツらめ・・・"
	keyWait
	clearMsg
	"""
	いずれ
	わがさばきを うけるときが くる・・・
	"""
	keyWait
	flagSet
		flag = 593
	end
	" "
}
