@archive 077A570
@size 18

script 0 mmbn2 {
	msgOpen
	soundStop
	soundDisableTextSFX
	controlLock
	flagSet
		flag = 525
	soundPlay
		track = 158
	"キーン "
	wait
		frames = 40
	"コーン "
	wait
		frames = 40
	"カーン "
	wait
		frames = 40
	"コーン"
	wait
		frames = 60
	controlUnlock
	soundEnableTextSFX
	flagClear
		flag = 525
	soundPlayBGM
		track = 3
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"・・・! 先生が きたわよ!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	おはようございまーす! いよいよ
	あしたから おまちかねの お休みね、
	みんな!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"ウォーッス!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	みんな
	どんなことをして すごすのかなー?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"おじいちゃんちに あそびに 行きまーす!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"ふふん、"
	waitSkip
		frames = 30
	"""
	アタシは かるく
	せかいいっしゅう りょこう
	って かんじだけどね
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	あらあら、
	みんな よていが もりだくさんで
	いいわね
	"""
	keyWait
	clearMsg
	"・・・でーも!"
	waitSkip
		frames = 30
	"\nべんきょうも わすれちゃ ダメよー!?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ハーイ"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	じゃ、みんなの おまちかね!
	つうちひょうを くばりまーす!
	"""
	keyWait
	clearMsg
	soundStop
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"エー!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"エー!"
	keyWait
	end
}
script 12 mmbn2 {
	soundPlayBGM
		track = 3
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	・・・じゃあ みんな、お休みを
	たのしんでねー! でも ケガと びょうき
	には 気をつけなきゃ ダメよっ
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ハーイ!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"ハーイ!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Dex
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	あらあら、光くんと デカオくんは
	ゲンキが なくなっちゃった みたいね
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
