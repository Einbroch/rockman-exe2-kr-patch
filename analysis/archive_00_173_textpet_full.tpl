@archive 077B5D0
@size 8

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだよ これ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ガスが たちこめてる!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やいとちゃん、きっとあそこに・・・"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"くそ! はやくたすけないと!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"あ、熱斗くん! そこ!"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"デカオじゃんか!"
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
	"このガス、"
	waitSkip
		frames = 30
	"どうすりゃいいんだ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ほら、さっき グライドさんが
	「ガスゆわかしきが おかしい」って
	言ってたよね!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
