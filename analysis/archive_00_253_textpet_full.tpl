@archive 07848D8
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	・・・ふぁ~
	やっと ホテルに ついたぜー
	"""
	waitSkip
		frames = 30
	"\n・・・に しても、"
	keyWait
	clearMsg
	"""
	くっそー!!
	なんてとこなんだ ココは!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"イロイロ ひどい目に あったもんね・・・"
	keyWait
	clearMsg
	"""
	こどもの ひとりたび だから
	ねらわれやすかったのかな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマンが わるいんだ!"
	keyWait
	clearMsg
	"""
	さっきだって、ロックマンが
	「わるい人かはわかんない」 っていうから
	クルマに のったのに!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	でも、熱斗くんだって そうおもったから
	そうしたんでしょ
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマンは PETの中に いるから
	そんなふうに きらくに いえるんだよ
	"""
	keyWait
	clearMsg
	"どうせ 人ごとだと おもってるんだろ!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	なんてこと いうんだ!
	熱斗くん ひどいよ!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うるさい!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	そんなんだったら
	熱斗くんなんか もうしらない!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
