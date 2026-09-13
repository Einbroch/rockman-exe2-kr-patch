@archive 077BBEC
@size 17

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"どう? オフロに ちかづけそう?"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちょっと まって"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ダメだ・・・"
	waitSkip
		frames = 30
	"ガス きえてない"
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
	え? でも
	もう かんきせんのプログラム
	みあたらないよ
	"""
	keyWait
	clearMsg
	"・・・"
	waitSkip
		frames = 30
	"""
	今のは
	かんけいない プログラム だったのかな?
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
	くそっ、なんか あおぐモノでもあれば
	こんな ガス・・・
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! それだ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"?"
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
	ほら、けさ
	やいとちゃんと 話したこと!
	おぼえてる!?
	"""
	keyWait
	clearMsg
	mugshotHide
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"もち!\n"
	option
		left = 0
		right = 0
		up = 0
		down = 2
	space
		count = 2
	"うーん\n"
	option
		left = 0
		right = 0
		up = 1
		down = 0
	space
		count = 2
	"話してない・・・?"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 8,
			jump = 9,
			jump = 12,
			jump = continue
		]
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そっか! せんすだ!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"え・・・と なんだっけ?"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ほら! せんすだよ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"・・・そっか! それだ!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	えーと、けさ
	やいとと 話したかなー
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"そうなの? "
	waitSkip
		frames = 30
	"""
	ボクが
	きいたところによると やいとちゃん、
	さいきん せんす あつめてるんだって!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"せんすか! つかえそうだな!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	せんす、
	きっと このウチのどこかに あるはず!
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
