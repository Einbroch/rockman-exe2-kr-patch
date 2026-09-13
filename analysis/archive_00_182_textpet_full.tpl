@archive 077C2F4
@size 8

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	playerAnimate
		animation = 24
	"やった!"
	playerFinish
	playerAnimate
		animation = 4
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やったな!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"なんで こんな コドモなんかに・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"\nだが・・・"
	waitSkip
		frames = 30
	"""
	いいさ!
	つぎは こうはいかないぜ!
	"""
	keyWait
	clearMsg
	"""
	オレたちの そしきは さいきょうなのさ!
	あばよっ!
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
	"・・・にげやがった"
	waitSkip
		frames = 30
	"\nそれより、ロックマン! "
	waitSkip
		frames = 30
	"やいとだ!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 165
	"カチ!"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こっちは OK!
	はやく、やいとちゃんを たすけて!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
