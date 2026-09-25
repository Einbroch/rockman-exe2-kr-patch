@archive 07962BB
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	まけちゃったの?
	しょうが ないわねぇ・・・
	"""
	keyWait
	clearMsg
	"""
	じゃ、バトルの さいしょから
	もう1回 やりなおして みましょう
	"""
	keyWait
	clearMsg
	"できるまで つづけるわよ~!"
	keyWait
	end
	"   "
}
