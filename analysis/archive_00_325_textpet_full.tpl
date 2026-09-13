@archive 078D9F0
@size 7

script 0 mmbn2 {
	playerAnimate
		animation = 24
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やったね!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"お・・・"
	waitSkip
		frames = 30
	"おうっ"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	playerAnimate
		animation = 4
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん!?"
	waitSkip
		frames = 30
	"""
	
	・・・ヤバい! 電磁波の レベルが
	また 5万ばいに せまってる!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	か、かんけーねぇよっ!
	ちょっと 立ちくらみが しただけだって
	"""
	waitSkip
		frames = 30
	"\nそれより はやく そのプログラムを!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"・・・わかった!"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	やったよ!
	これで となりのへやに 行けるはず!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
