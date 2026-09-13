@archive 077FA6C
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"しけん、うけにきました!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	おっ、この あいだのボウヤ
	とくべつにんむを
	かいけつしてきたみたいだね
	"""
	keyWait
	clearMsg
	"それじゃぁ PETをはいけん"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ど・どうですか?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"""
	よくがんばったね!
	OK! しけん うけてもいいよ
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
	"""
	やったぜ!
	おじさん アリガト!!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
