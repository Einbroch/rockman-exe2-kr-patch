@archive 0788038
@size 8

script 0 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	さっきね、おきゃくさんのニモツを
	せいりしてたら、おおきなクモが
	ガサガサーって はしっていったの
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"どんなクモ?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	くろいケが モサモサはえてて、
	ぶっとい アシしてたわ
	そうそう、めがいじょうに アカかったわ
	"""
	keyWait
	clearMsg
	"けどまあ、だいじょうぶよね"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"だいじょうぶなんじゃない?"
	keyWait
	flagClear
		flag = 519
	flagSet
		flag = 520
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、いまのかいわ きいた?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	くろいケが モサモサはえて
	ぶっといあしのクモって・・・
	"""
	keyWait
	clearMsg
	"""
	ひょっとして
	ドクグモじゃないのか?
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"もし そうだったらたいへんだよ"
	keyWait
	clearMsg
	"""
	だれか、ムシにくわしいヒトに
	かくにん したほうが
	いいんじゃないかな
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
