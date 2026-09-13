@archive 077D718
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"むっ!?"
	soundStop
	keyWait
	end
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlayBGM
		track = 14
	soundPlay
		track = 264
	"ガオーーー!!!!"
	wait
		frames = 60
	soundEnableTextSFX
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	こりゃ やばいわ!
	あたし かえらせてもらいます
	"""
	keyWait
	clearMsg
	"(ていうか\n ちょっと チビっちゃったのよ!)"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 264
	"ガオーーー!!!!"
	wait
		frames = 60
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ねっと~ どうする~?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"お おめえら! だらしねえぞ!"
	waitSkip
		frames = 30
	"\nい いいか! "
	waitSkip
		frames = 30
	"ここは・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"\nいったん たいきゃくだ!"
	keyWait
	end
}
script 6 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 264
	"ガオーーー!!!!"
	wait
		frames = 60
	"\n"
	soundPlay
		track = 264
	"ガオーーー!!!!"
	wait
		frames = 60
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"熱斗 ヤバいって!"
	keyWait
	clearMsg
	jump
		target = 8
}
