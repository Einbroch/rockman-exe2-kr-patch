@archive 0784298
@size 3

script 0 mmbn2 {
	msgOpen
	textSpeed
		delay = 3
	"そして、"
	waitSkip
		frames = 20
	"""
	10時間ちょっとの フライトの
	あと
	"""
	textSpeed
		delay = 30
	"・・・"
	keyWait
	clearMsg
	textSpeed
		delay = 3
	"""
	ボクらは、アメロッパの ちに
	おり立った
	"""
	textSpeed
		delay = 30
	"・・・"
	textSpeed
		delay = 2
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ふわ~~~
	やっと ついたなー
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
