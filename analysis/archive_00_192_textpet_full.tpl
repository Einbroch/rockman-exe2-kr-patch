@archive 077D0F4
@size 9

script 0 mmbn2 {
	msgOpen
	"・・と くーん・・・"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"むにゃむにゃ・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotHide
	msgOpen
	"っとくん! 熱斗くんっ たらっ!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"う、"
	waitSkip
		frames = 30
	"う・・"
	waitSkip
		frames = 30
	"ーん"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"もーーー、熱斗くーーーん!!"
	waitSkip
		frames = 30
	"\nあさだよ! "
	waitSkip
		frames = 30
	"キャンプだよ!"
	waitSkip
		frames = 30
	"\nおくれちゃうよ!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ん、ロックマン?"
	waitSkip
		frames = 30
	"\nあさ? "
	waitSkip
		frames = 30
	"キャンプ・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"?"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そうだ! キャンプだ!"
	waitSkip
		frames = 30
	"\nロックマン! おはよ!"
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
	ほら! もう みんなと
	やくそくしてる 時間に なっちゃったよ!
	はやく はやく!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
