@archive 077E1AC
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どうだ?"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん、アタリだね!
	やっぱり コレ きばくそうちだよ!
	"""
	keyWait
	clearMsg
	"""
	この中の どこかで きばくプログラムが
	せいぎょ されているはず
	"""
	keyWait
	clearMsg
	"あと・・・"
	waitSkip
		frames = 30
	"""
	
	ウイルスの けはいを かんじる!
	けっこう てごわそうだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	わかった!
	ロックマン、気をつけろよ!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
