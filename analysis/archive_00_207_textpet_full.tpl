@archive 077F08C
@size 3

script 0 mmbn2 {
	mugshotHide
	soundSetTextSFX
		track = 249
	msgOpen
	"""
	アラシに つづいて ハヤミまで
	しくじったか・・・
	"""
	keyWait
	clearMsg
	"""
	だが ヤツらは、わがそしきでは
	さいていランクの オペレータ、
	"""
	keyWait
	clearMsg
	"""
	ゴスペルの
	ほんとうの おそろしさを しるのは
	これからだ!
	"""
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"ダーク・ミヤビ"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"""
	・
	おまえの でばんだ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	"""
	オレは なにをすれば よいのだ?
	カネさえ もらえれば なんでもしよう
	・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
