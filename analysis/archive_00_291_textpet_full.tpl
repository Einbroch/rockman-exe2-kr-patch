@archive 07891D0
@size 7

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ふぅ"
	textSpeed
		delay = 20
	"・・・"
	textSpeed
		delay = 2
	"いっちょーあがり っと!"
	keyWait
	clearMsg
	"""
	ゴスペルの ヤツら、
	つぎは どこを バグらせるつもりだ?
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
	"ビー"
	soundPlay
		track = 209
	wait
		frames = 54
	"ビー"
	soundPlay
		track = 209
	wait
		frames = 54
	"ビー"
	soundPlay
		track = 209
	"!!"
	wait
		frames = 54
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"こんどは なんだ!!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	きないの きあつが!
	どんどん 下がっています!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	なんだと?
	こんどは きあつちょうせいプログラムが?
	"""
	keyWait
	clearMsg
	"""
	今の こうどで・・・
	このまま きあつが さがりつづければ、
	"""
	keyWait
	clearMsg
	"""
	こうざんびょうで
	ヘタをすると ししゃがでるぞ!
	"""
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
	そ、そういえば
	なんか いきぐるしいような・・・
	"""
	keyWait
	clearMsg
	"""
	ロックマン、きあつちょうせいプログラムだ
	いそいでくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
