@archive 078BA94
@size 6

script 0 mmbn2 {
	msgOpen
	"そして・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"\n1しゅうかんが すぎた・・・"
	wait
		frames = 120
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"・・・ム!!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"またか・・・"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"クッ!!"
	keyWait
	clearMsg
	jump
		target = 5
}
