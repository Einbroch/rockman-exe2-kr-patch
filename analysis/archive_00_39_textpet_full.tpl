@archive 07614D0
@size 256

script 0 mmbn2 {
	checkFlag
		flag = 601
		jumpIfTrue = 5
		jumpIfFalse = continue
	flagSet
		flag = 601
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"ネット"
	waitSkip
		frames = 30
	"ね・・・"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ジェニファーさん!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"すごい キズだ!!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	アタシたち だまさ・・・れてた
	「ゴスペル」の ネットバトラーは
	アタシたちの 中に・・・いたのよ
	"""
	keyWait
	clearMsg
	"ゆだん しちゃダ・・・メ"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ジェニファーさん しっかりするんだ!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"アタシは・・・ "
	waitSkip
		frames = 30
	"もう・・・"
	waitSkip
		frames = 30
	"\n行くのよ・・・ "
	waitSkip
		frames = 30
	"さあ・・・"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	さっきの ジェニファーさん
	ケガしてる みたいだったよ!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 48
		upper = 255
		jumpIfInRange = 225
		jumpIfOutOfRange = continue
	msgOpen
	"""
	かたく とざされている!
	こちらからは あけられないようだ!!
	"""
	keyWait
	end
}
