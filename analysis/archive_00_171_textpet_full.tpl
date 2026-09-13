@archive 077B26C
@size 7

script 0 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"とやかく言ってる ヒマはねえ!"
	keyWait
	clearMsg
	"いいか! おまえら!"
	waitSkip
		frames = 30
	"\n今からオレが いえの中にとつにゅうする!"
	waitSkip
		frames = 30
	"\nおまえらは ここで たいきだ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	だいじょうぶ?
	みんなで 行ったほうが いいんじゃない?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"ダメだ! "
	waitSkip
		frames = 30
	"""
	中のようすが わからねえんだ、
	みんなで こうどうするのは
	かえって キケンだ!
	"""
	keyWait
	clearMsg
	"""
	あんしんしろ! このデカオさま、
	かならず 5分いないに もどってくる!
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 255
	"""
	バタンッ! ガチャ!
	・
	"""
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
	"・"
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
	"・"
	soundEnableTextSFX
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ねっと・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"! "
	waitSkip
		frames = 30
	"5分 すぎちまったじゃんか!"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	jump
		target = 6
}
