@archive 077FC5C
@size 11

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	やたっ!
	Aライセンス、ゲットしたぜ!
	"""
	keyWait
	clearMsg
	"ロックマン! おつかれ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"これで アジーナエリアに 行けるね"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おうっ! ごちそうは めのまえだぜ!"
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
	もしかして 熱斗くん、
	けんきゅうよりも ごちそうが
	めあてだったの!?
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
	"あたりまえじゃん!!"
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
	アジーナに 行くのは ボクで、
	熱斗くんが
	ごちそう たべる わけじゃないでしょ
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
	"れいの メルともと なかよくなったら、"
	keyWait
	clearMsg
	"""
	もしかして アジーナこくに しょうたい
	してくれるかも しんないじゃん
	"""
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
	みょうに きあい入ってると おもったら
	そんなコト かんがえてたんだね!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そ、そればっかじゃ ないぞ!
	ちゃんと けんきゅうも するぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	けんきゅうも って、やっぱり
	けんきゅうは 2のつぎ なんだね!
	"""
	keyWait
	clearMsg
	"""
	ふぅ~
	ま、熱斗くんらしくて いいんだけどね
	"""
	keyWait
	clearMsg
	"""
	さ、しけんも おわったことだし
	しけんべやから 出なきゃ
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
