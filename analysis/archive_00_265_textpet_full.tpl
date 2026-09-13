@archive 07864A0
@size 13

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、
	また だれかから れんらく!?
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
	"うん! もしもし!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"ハァ・・・ハァ・・・"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ラウルさん!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	熱斗く・・・んか・・・
	スマン・・・やられちまった・・・
	あとは たのむ・・・ぞ
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 260
	"ツー "
	wait
		frames = 57
	soundPlay
		track = 260
	"ツー "
	wait
		frames = 57
	soundPlay
		track = 260
	"ツー"
	wait
		frames = 58
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ラウルさんまで・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん・・・おかしくない?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"えっ なにが?"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"だって みんな やられちゃったんだよ?"
	keyWait
	clearMsg
	"""
	のこってるのは
	熱斗くんと 炎山くんだけ・・・
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
	ということは オレたちの 中に
	まぎれこんでる 「ゴスペル」の
	ネットバトラーって・・・
	"""
	keyWait
	clearMsg
	"""
	まさか!?
	炎山が 「ゴスペル」だなんて
	いくらなんでも ウソだろ!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ボクだって そうおもいたいけど・・・"
	keyWait
	clearMsg
	jump
		target = 12
}
