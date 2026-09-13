@archive 077A9FC
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やっと おわったね!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	soundPlay
		track = 134
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"・・・あ "
	waitSkip
		frames = 30
	"メールだ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"だれから?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うーんとね、デカオくん からだ!
	「オフィシャルスクエア」 に
	早く こいってさ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やべ! そうだった!"
	keyWait
	clearMsg
	jump
		target = 5
}
