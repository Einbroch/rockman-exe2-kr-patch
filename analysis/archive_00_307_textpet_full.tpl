@archive 078B5D0
@size 14

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ママ! もうだいじょうぶだよ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	mugshotAnimate
		animation = 0
	"・・・・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ママ・・・どしたの・・・?\n"
	mugshotAnimate
		animation = 0
	"(おこってる?)"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	さっき、パパかられんらくがあって
	ぜんぶきいたわ
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
	あ、あの その・・・
	ママ、しんぱいかけてゴメン
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	ホント、あなたもパパも
	ママをしんぱいさせるのが
	とくいなのね
	"""
	keyWait
	clearMsg
	"""
	・・・・・・
	熱斗! ロックマン!
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
	"はいっ!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"はいっ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"おつかれさま、よくがんばったわね"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ママ!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	やっぱり、ちは あらそえないわね
	パパや、おじいちゃんも ホントに
	せいぎかんが つよくて
	"""
	keyWait
	clearMsg
	"""
	ただしいと おもうコトにかんしては、
	かんがえるよりさきに カラダが
	うごいちゃう
	"""
	keyWait
	clearMsg
	"""
	それが、光のかけいなのね
	・・・クスッ
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"オレの カオ、なんかついてる?"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	いまの 熱斗のカオ
	わかいころの パパそっくり
	"""
	keyWait
	clearMsg
	"""
	さ、つかれたでしょ
	ちょっと ねむったら?
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
