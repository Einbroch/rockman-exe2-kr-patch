@archive 077B77C
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ハヤク、ムコウニ イカナキャ!"
	keyWait
	clearMsg
	"""
	ズット ズット イッタラ
	カンキセンノ プログラムガ アルカラ、
	ソレヲ ナオシマス!
	"""
	keyWait
	clearMsg
	"デモ コノガス ダイジョウブ???"
	waitSkip
		frames = 30
	"\n・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"イキマース!!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ワ~~"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	モウ ダメデーーーース!
	・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"アレ?"
	keyWait
	clearMsg
	jump
		target = 3
}
