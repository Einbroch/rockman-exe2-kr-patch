@archive 078B7E4
@size 9

script 0 mmbn2 {
	checkItem
		item = 61
		amount = 1
		jumpIfEqual = 7
		jumpIfGreater = 7
		jumpIfLess = continue
	checkFlag
		flag = 217
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkFlag
		flag = 218
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkFlag
		flag = 219
		jumpIfTrue = 4
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ワタシは\n"
	printItem
		buffer = 0
		item = 61
	"の シケンカンです"
	keyWait
	clearMsg
	"シケンを ウけに キましたね"
	keyWait
	clearMsg
	"クリアしたら、"
	printItem
		buffer = 0
		item = 61
	"を あげます"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	printItem
		buffer = 0
		item = 61
	"""
	の
	シケンナイヨウは サバイバルバトルです
	"""
	keyWait
	clearMsg
	"""
	レンゾクで
	10カイ アラワれる ウイルスを
	デリートすれば OKです
	"""
	keyWait
	clearMsg
	"""
	トチュウで
	HPの カイフクは デキませんので
	チュウイして クダさい
	"""
	keyWait
	clearMsg
	"""
	なお、モンダイを ハジめるマエと
	オわったトキには
	HPを カイフクして アげます
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"では いきますよ?"
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"はい!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"また あとで\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"せつめいを もういちど"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 8,
			jump = continue,
			jump = 1,
			jump = continue
		]
	"""
	では、マタ
	ワタシに ハナしカけて クダさい
	"""
	keyWait
	end
}
script 3 mmbn2 {
	flagClear
		flag = 218
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ザンネンでしたね・・・"
	waitSkip
		frames = 30
	"\nもうイチド チャレンジしますか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"する! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"あとで"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 8,
			jump = continue,
			jump = continue
		]
	"""
	では、マタ
	ワタシに ハナしカけて クダさい
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"もうイチド チャレンジ するのですね"
	keyWait
	clearMsg
	jump
		target = 2
}
script 5 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オミゴト! あなたは
	ブジ シケンを クリアしました!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 61
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 61
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	flagSet
		flag = 222
	clearMsg
	mugshotShow
		mugshot = NormalNavi
	"オマケにコレも ツけちゃいましょう!"
	keyWait
	clearMsg
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 98
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 98
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerUnlock
	clearMsg
	"""
	レギュラーメモリの ようりょうが、
	1メガ ふえた!!
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おツカれサマでした"
	keyWait
	end
}
