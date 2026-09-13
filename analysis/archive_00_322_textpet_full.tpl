@archive 078D77C
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"だれも・・・"
	waitSkip
		frames = 30
	"いない?"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"くそ、ここじゃ ないのかっ!?"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うわーーーーーーーー!!!!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん!!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ク・・"
	waitSkip
		frames = 30
	"ク・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ダメだ! このトビラの 電磁波
	5万ばいを よゆうで オーバーしてる!
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
	"ち、ちくしょっ!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、わかってるよな・・・"
	waitSkip
		frames = 30
	"\nオレたちは あきらめない・・・"
	keyWait
	clearMsg
	"""
	どこかに 電磁波を コントロールしてる
	サーバーが あるはず・・・
	"""
	waitSkip
		frames = 30
	"\nそいつを さが・・"
	waitSkip
		frames = 30
	"そう"
	keyWait
	clearMsg
	jump
		target = 8
}
