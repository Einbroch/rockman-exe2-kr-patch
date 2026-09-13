@archive 077E9AC
@size 25

script 0 mmbn2 {
	checkFlag
		flag = 609
		jumpIfTrue = 13
		jumpIfFalse = continue
	checkFlag
		flag = 607
		jumpIfTrue = 9
		jumpIfFalse = continue
	checkItem
		item = 6
		amount = 1
		jumpIfEqual = 8
		jumpIfGreater = 8
		jumpIfLess = continue
	checkFlag
		flag = 600
		jumpIfTrue = 7
		jumpIfFalse = continue
	checkFlag
		flag = 601
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkFlag
		flag = 599
		jumpIfTrue = 4
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ワタシは\n"
	printItem
		buffer = 0
		item = 59
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
		item = 59
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
	mugshotHide
	msgOpen
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
			jump = 22,
			jump = continue,
			jump = 1,
			jump = continue
		]
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	では、マタ
	ワタシに ハナしカけて クダさい
	"""
	keyWait
	end
}
script 3 mmbn2 {
	flagClear
		flag = 601
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
			jump = 22,
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
	ネットバトラーとして コマっているヒトを
	タスけられるかの シケンです!
	"""
	keyWait
	clearMsg
	"""
	イマ、「この デンサンエリアの どこかに
	コマっている ナビがいる」と イう
	ジョウホウが あります
	"""
	keyWait
	clearMsg
	"""
	あなたは ナビを サガしダして
	タスけてあげて クダさい
	"""
	keyWait
	clearMsg
	"""
	タスけたら ワタシのとこに
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
script 8 mmbn2 {
	flagSet
		flag = 607
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"お! 「"
	printItem
		buffer = 0
		item = 6
	"""
	」を
	モってキましたね! ゴウカク!
	"""
	keyWait
	clearMsg
	"これで ダイ2モンは クリアです"
	waitSkip
		frames = 15
	"\nおメデとうゴザいます! やりますね!"
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
			jump = 23,
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
			jump = 23,
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
		item = 59
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 59
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 59
	"""
	」の クワしいコトは
	ワタシに キいて クダさい
	ワタシは いつでも このスクエアにいます
	"""
	keyWait
	clearMsg
	"アト これはオマケです、ドウゾ"
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotHide
	msgOpen
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
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	"""
	レギュラーメモリの ようりょうが、
	1メガ ふえた!!
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	playerLock
	playerAnimate
		animation = 4
	"やーったーっ!!"
	keyWait
	clearMsg
	playerFinish
	playerUnlock
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やったな! ロックマン!"
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	waitSkip
		frames = 30
	"\n・・・"
	waitSkip
		frames = 30
	"""
	けっこう 時間も たったみたいだね
	そろそろ かえる?
	"""
	keyWait
	end
}
script 22 mmbn2 {
	flagSet
		flag = 599
	msgClose
	flagSet
		flag = 598
	flagClear
		flag = 527
	end
}
script 23 mmbn2 {
	msgClose
	flagSet
		flag = 608
	flagClear
		flag = 527
	end
}
