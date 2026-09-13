@archive 077D8A8
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	ね? 熱斗、さっきひろった
	オペラグラスで あのクマ
	もういっかい よく 見てみて
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"OK!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ん?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	なによ?
	ちょっと あたしにも 見せなさいよ!
	"""
	keyWait
	clearMsg
	"あ! アレ つくりモノじゃない!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 264
	"ガオーーー!!!!"
	wait
		frames = 60
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"で、"
	waitSkip
		frames = 30
	"""
	でも やっぱり
	はくりょくは まんてんね・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	ああ、見たところ うごかねえようだが
	人を おそうような プログラムが
	されてる かもしれねえ・・・
	"""
	keyWait
	clearMsg
	"""
	だれか プラグインして、
	クマを かんぜんに ストップさせる
	ひつようが あるな・・・
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	mugshotAnimate
		animation = 0
	"(チラ)"
	mugshotAnimate
		animation = 1
	keyWait
	clearMsg
	jump
		target = 8
}
