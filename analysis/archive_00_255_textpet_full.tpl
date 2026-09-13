@archive 0784F2C
@size 16

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
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
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そうだよな、おこってるよな・・・"
	waitSkip
		frames = 30
	"""
	
	ロックマン、オレ ごめん、
	さっきは まちがってた!
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
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ゆるして くれないんだ・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"熱斗くん、"
	waitSkip
		frames = 30
	"ちが・・"
	keyWait
	clearMsg
	soundPlayBGM
		track = 13
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"! "
	waitSkip
		frames = 30
	"どうしたんだ!?"
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
	さっき、わるそうな ヤツが
	へやに 入ってきて、PETに
	プラグイン したんだ
	"""
	keyWait
	clearMsg
	"""
	そいつ PETに ウイルスを
	おくりこんできて、ボク ひとりで
	たたかったんだけど・・・
	"""
	keyWait
	clearMsg
	"ごめん、パスポート とられちゃった・・・"
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
	ロックマン!
	ロックマンは だいじょうぶなの!?
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
	ちょっと データが
	こわれちゃったぐらい・・・
	"""
	waitSkip
		frames = 30
	"\n熱斗くん・・・"
	waitSkip
		frames = 30
	"やっぱり やさしいね"
	keyWait
	clearMsg
	"""
	さっき、
	熱斗くんのこと わるく いったから
	きっと バチが あたったんだね
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
	"ロックマンは わるくないよ!"
	keyWait
	clearMsg
	"ちょっと 見せてみて・・・"
	waitSkip
		frames = 30
	"""
	
	ほんとだ データこわれてる!
	よーし!
	"""
	textSpeed
		delay = 30
	"・・・"
	textSpeed
		delay = 2
	soundStop
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	熱斗は、
	ロックマンの データ
	を ふっきゅうした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン! パスポートも
	チップも とりかえしてやろうぜ!
	"""
	keyWait
	clearMsg
	"""
	また
	オレと いっしょに たたかってくれる?
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ありがとう 熱斗くん!
	もちろんだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"行こう!!"
	keyWait
	clearMsg
	jump
		target = 15
}
