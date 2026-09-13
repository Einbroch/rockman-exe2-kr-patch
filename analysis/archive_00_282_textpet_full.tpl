@archive 07887B4
@size 12

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おじさん、ホントのコトいうよ"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"なんだい? ホントのコトって"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"かくかくしかじか・・・"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	なんだってー!?
	メアカモッサドクグモが?
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
	おじさん、しーーーーっ
	こえがデカいよ!!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"あっ ごめん、ごめん"
	keyWait
	clearMsg
	"""
	それで、クモをつかまえるんだったね
	それじゃ、ワナをしかけよう!
	"""
	keyWait
	clearMsg
	"""
	キミには、ワナをつくる
	ざいりょうを、あつめてきてほしい
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
	"どんなワナをしかけるの?"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"そいつは、みてのおたのしみさ"
	keyWait
	clearMsg
	"とにかく、ひつようなモノは、"
	keyWait
	clearMsg
	"""
	カゴのようなモノ
	ぼう を、いっぽん
	ヒモ
	"""
	keyWait
	clearMsg
	"そして、ウイスキーだ"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ウイスキー? なんで?"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	メアカモッサドクグモは、じつは、
	こうきゅうなウイスキーのニオイが
	すきなんだ
	"""
	keyWait
	clearMsg
	"""
	これは、こうきゅうウイスキーの
	ニオイは、クモがはんしょくきにだす
	フェロモンのニオイに にている・・・
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	わ、わかったよ!
	と、とにかく
	"""
	keyWait
	clearMsg
	"""
	カゴ、つっかえぼう、ヒモ、
	こうきゅうウイスキーを
	さがしてくるよ
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
