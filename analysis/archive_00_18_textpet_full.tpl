@archive 0752574
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 61
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 31
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	いつもは しずかな このえきも
	このきせつは おおぜいの
	キャンプきゃくで にぎわうんですよ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"クワガタムシを つかまえに きたんだ"
	keyWait
	clearMsg
	"いっぱい つかまえるぞ!"
	keyWait
	clearMsg
	"いっぴき いくらで うろうかな?"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	シゴトを さぼって、
	ついフラリと ココまで きたけど、
	"""
	keyWait
	clearMsg
	"""
	たまには
	こんな日が あっても いいだろ?
	"""
	keyWait
	clearMsg
	"いいはずだ!"
	waitSkip
		frames = 15
	"\nいや、なければ いけない!!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	インターネットで じけんが?
	ぶっそうですね
	"""
	keyWait
	clearMsg
	"""
	そんなときは、おくデンだにで
	ハイキングでも すればいいのに
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	デンサンシティの おくざしき
	おくデンだにへ ようこそ!
	"""
	keyWait
	clearMsg
	"""
	ここは おてがるな ひきょうですからね、
	がいこくじんの方 なんかも
	たまに かんこうに こられますよ
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	えきいんさんの いうとおり
	ここは ちょっとした ひきょう・・・
	"""
	waitSkip
		frames = 30
	"\nつうきんに 2じかんハンは かかるな"
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	ほ~、アメロッパに
	行ってきたんですか?
	"""
	keyWait
	clearMsg
	"""
	アメロッパでは、メトロラインの
	かわりに、バスが ゆうめいですね
	ワタシもいちど、のってみたいものです
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	じしんがおころうと、
	メトロは、はしります!
	"""
	keyWait
	clearMsg
	"""
	それが、「メトロや」の
	イジってもんです!
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	ここのところ
	おきゃくさんが すくないんですよ・・・
	"""
	keyWait
	clearMsg
	"""
	みなさん ウイルスの ひがいで
	キャンプどころじゃ ないんですかねえ
	"""
	keyWait
	clearMsg
	"・・・じゃあ ウチは どうなるんだ!!"
	keyWait
	clearMsg
	"あ ゴメンなさい・・・"
	keyWait
	clearMsg
	"""
	でも 気になるんですよ
	ウチのおくさん きかいに よわいから
	・・・
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	あいらしい カタチで
	にんきの たかいゴミバコだ
	"""
	keyWait
	clearMsg
	"""
	ただ、あいらしすぎて
	クチの中に ゴミをブチこむのは
	気がひける
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	おくデンだにPRようポスターだ!
	「げんだいのオアシス おくデンだに」
	"""
	keyWait
	end
}
script 230 mmbn2 {
	checkItem
		item = 23
		amount = 1
		jumpIfEqual = 231
		jumpIfGreater = 231
		jumpIfLess = continue
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
		up = 1
		down = 2
	space
		count = 2
	"マリンハーバー\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
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
			jump = continue,
			jump = continue
		]
	end
}
script 231 mmbn2 {
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
	"くうこう    "
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
		item = 91
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
		item = 91
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
		item = 91
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
script 241 mmbn2 {
	itemTake
		item = 91
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 91
	"""
	」
	を つかった!
	"""
	keyWait
	end
}
