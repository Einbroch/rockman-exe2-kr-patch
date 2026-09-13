@archive 0758910
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 18
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	ここは
	メトロラインの くうこうえきです
	"""
	keyWait
	clearMsg
	"""
	デンサンくうこうに ちょっけつの
	べんりな えき なのです
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 31
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	さあ 今日も フライトよ!
	気を ひきしめて いかなくっちゃ!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	はやく ひこうきが みたいな~!
	ワクワク!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	アメロッパに
	いってこられたんですか?
	"""
	keyWait
	clearMsg
	"いいトコロだったでしょ?"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	この じしんの中でも、
	ひこうきは、うんこうしています
	"""
	keyWait
	clearMsg
	"""
	つまり、われわれも、やすむワケには、
	いかないのです
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	あちこちで、ひなんかんこくが
	でている そうですが、
	にげるワケには いきません
	"""
	keyWait
	clearMsg
	"""
	じつは、めちゃくちゃ
	ビビってるんですけどね
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	じしんは、おさまったんですね
	・・・ハァ~コワかった~・・・
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	ここは
	メトロラインの くうこうえきです
	"""
	keyWait
	clearMsg
	"今日は くうこうけんがく ですか?"
	keyWait
	clearMsg
	"""
	まさか こんなときに
	かいがいりょこう ってことは
	ないですよね?
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	今日の フライト、
	おきゃくさま すくないらしいの
	"""
	keyWait
	clearMsg
	"""
	ラクといえば そうだけど
	やっぱり おおくの おきゃくさまと
	ごいっしょしたい ものなのよ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	くうこうに、ちかいだけあって
	がいこくのゴミも、
	おおく すてられている
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	AALで行く アメロッパ
	みわくの いこくじょうちょを
	アナタに・・・
	"""
	keyWait
	end
}
script 230 mmbn2 {
	checkFlag
		flag = 23
		jumpIfTrue = 236
		jumpIfFalse = continue
	msgOpen
	"行き先を えらんでください\n"
	option
		left = 1
		right = 1
		up = 2
		down = 2
	space
		count = 2
	"秋原町     "
	option
		left = 0
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"マリンハーバー\n"
	option
		left = 3
		right = 3
		up = 0
		down = 0
	space
		count = 2
	"おくデンだに  "
	option
		left = 2
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"どこにも行かない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 233,
			jump = 234,
			jump = 235,
			jump = continue,
			jump = continue
		]
	end
}
script 233 mmbn2 {
	flagSet
		flag = 23
	itemGive
		item = 88
		amount = 1
	msgOpen
	playerAnimate
		animation = 24
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 88
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 4
	playerUnlock
	keyWait
	end
}
script 234 mmbn2 {
	flagSet
		flag = 23
	itemGive
		item = 89
		amount = 1
	msgOpen
	playerAnimate
		animation = 24
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 89
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 4
	playerUnlock
	keyWait
	end
}
script 235 mmbn2 {
	flagSet
		flag = 23
	itemGive
		item = 90
		amount = 1
	msgOpen
	playerAnimate
		animation = 24
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 90
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 4
	playerUnlock
	keyWait
	end
}
script 236 mmbn2 {
	msgOpen
	"きっぷを かいなおしますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 237,
			jump = continue,
			jump = continue
		]
	end
}
script 237 mmbn2 {
	itemTake
		item = 88
		amount = 1
	itemTake
		item = 89
		amount = 1
	itemTake
		item = 90
		amount = 1
	flagClear
		flag = 23
	msgOpen
	"""
	熱斗は、
	もっている きっぷを
	へんきゃくした!
	"""
	keyWait
	clearMsg
	jump
		target = 230
}
script 238 mmbn2 {
	itemTake
		item = 88
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 88
	"""
	」
	を つかった!
	"""
	keyWait
	end
}
script 239 mmbn2 {
	itemTake
		item = 89
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 89
	"""
	」
	を つかった!
	"""
	keyWait
	end
}
script 240 mmbn2 {
	itemTake
		item = 90
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 90
	"""
	」
	を つかった!
	"""
	keyWait
	end
}
