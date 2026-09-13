@archive 077A810
@size 13

script 0 mmbn2 {
	flagSet
		flag = 518
	mugshotShow
		mugshot = Mom
	msgOpen
	"ねっとー!!"
	wait
		frames = 20
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"おもい出したわよ! さ、出しなさーい!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なに? ママ?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	なに、じゃないでしょ、
	つ・
	"""
	waitSkip
		frames = 10
	"う・"
	waitSkip
		frames = 10
	"ち・"
	waitSkip
		frames = 10
	"ひょ・"
	waitSkip
		frames = 10
	"う!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちぇー、おもい出しちゃったかー"
	waitSkip
		frames = 30
	"\n・・・はい、コレ"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"どれどれ・・・"
	waitSkip
		frames = 30
	"\nなに これ!"
	waitSkip
		frames = 30
	"・・・もうっ、熱斗!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やばっ!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"やばっ、じゃないでしょ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、ここは あやまった方が・・・"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"だな・・・"
	waitSkip
		frames = 30
	"ママごめん、"
	waitSkip
		frames = 30
	"ね?"
	waitSkip
		frames = 30
	"""
	
	ともだちと やくそく してるんだけど
	インターネットで あそんでも・・・
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	いいわけ ないでしょ!!
	さきに しゅくだい!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うへぇ!"
	keyWait
	msgClose
	flagSet
		flag = 518
	end
}
