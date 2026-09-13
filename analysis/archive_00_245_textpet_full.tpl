@archive 0782FE4
@size 20

script 0 mmbn2 {
	checkChapter
		lower = 20
		upper = 31
		jumpIfInRange = 16
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 18
		jumpIfInRange = 19
		jumpIfOutOfRange = continue
	checkItem
		item = 60
		amount = 1
		jumpIfEqual = 16
		jumpIfGreater = 16
		jumpIfLess = continue
	checkFlag
		flag = 649
		jumpIfTrue = 13
		jumpIfFalse = continue
	checkFlag
		flag = 539
		jumpIfTrue = 9
		jumpIfFalse = continue
	checkFlag
		flag = 540
		jumpIfTrue = 8
		jumpIfFalse = continue
	checkFlag
		flag = 541
		jumpIfTrue = 7
		jumpIfFalse = continue
	checkFlag
		flag = 542
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkFlag
		flag = 543
		jumpIfTrue = 4
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ワタシは\n"
	printItem
		buffer = 0
		item = 60
	"の シケンカンです"
	keyWait
	clearMsg
	"シケンを ウけに キましたね"
	keyWait
	clearMsg
	"""
	シケンは ゼンブで 3モンです
	クリアしたら、
	"""
	printItem
		buffer = 0
		item = 60
	"""
	を あげます
	では ダイ1モン!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ダイ1モンは サバイバルバトルです"
	keyWait
	clearMsg
	"""
	レンゾクで
	5カイ アラワれる ウイルスを
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
			jump = 17,
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
		flag = 542
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
			jump = 17,
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
	"""
	もうイチド
	ダイ1モンに チャレンジ するのですね
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 5 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おメデとうゴザいます! やりますね!"
	keyWait
	clearMsg
	"では、ダイ2モンです!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ダイ2モンは、あなたタチが
	ネットバトラーとして ワルさスるヤカラを
	こらしめられるかの シケンです!
	"""
	keyWait
	clearMsg
	"""
	イマ、「インターネットの どこかに
	ワルさをしている ナビが 2タイいる」
	とイう ジョウホウが あります
	"""
	keyWait
	clearMsg
	"""
	あなたは ナビを サガしダして
	こらしめて クダさい
	"""
	keyWait
	clearMsg
	"""
	こらしめたら ワタシのとこに
	モドってきて クダさい
	"""
	keyWait
	clearMsg
	"""
	これが ダイ2モンです
	もうイチド キきますか?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"きく "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いい"
	select
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = 6,
			jump = continue,
			jump = continue
		]
	"では イってらっしゃい!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	まだ クリアしてませんね
	クリアした あかしを もってません・・・
	"""
	keyWait
	clearMsg
	"""
	それとも
	モンダイを マタ キきますか?
	
	"""
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
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = 6,
			jump = continue,
			jump = continue
		]
	"では イってらっしゃい!"
	keyWait
	end
}
script 8 mmbn2 {
	flagSet
		flag = 539
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おメデとうゴザいます! やりますね!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"では、ダイ3モンです!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ダイ3モンも サバイバルバトルです"
	keyWait
	clearMsg
	"""
	レンゾクで
	5カイ アラワれる ウイルスを
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
		target = 11
}
script 11 mmbn2 {
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
			jump = 18,
			jump = continue,
			jump = 10,
			jump = continue
		]
	"""
	では、マタ
	ワタシに ハナしカけて クダさい
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ザンネンでしたね・・・"
	waitSkip
		frames = 30
	"\nもうイチド チャレンジしますか?"
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"する!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"あとで"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 13,
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
script 13 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	もうイチド
	ダイ3モンに チャレンジ するのですね
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 14 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オミゴト! あなたは
	ゼンブの モンダイを クリアしました!
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 60
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 60
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	flagSet
		flag = 552
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
		item = 99
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 99
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
	2メガ ふえた!!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おツカれサマでした"
	keyWait
	end
}
script 17 mmbn2 {
	flagSet
		flag = 543
	msgClose
	flagSet
		flag = 544
	flagClear
		flag = 650
	end
}
script 18 mmbn2 {
	msgClose
	flagSet
		flag = 545
	flagClear
		flag = 650
	end
}
