@archive 07919F8
@size 13

script 0 mmbn2 {
	checkItem
		item = 62
		amount = 1
		jumpIfEqual = 7
		jumpIfGreater = 7
		jumpIfLess = continue
	checkFlag
		flag = 225
		jumpIfTrue = 9
		jumpIfFalse = continue
	checkFlag
		flag = 226
		jumpIfTrue = 7
		jumpIfFalse = continue
	checkFlag
		flag = 227
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkFlag
		flag = 234
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkFlag
		flag = 233
		jumpIfTrue = 2
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ワタシは\n"
	printItem
		buffer = 0
		item = 62
	"の シケンカンです"
	keyWait
	clearMsg
	"シケンを ウけに キましたね"
	keyWait
	clearMsg
	"""
	シケンは ゼンブで 2モンです
	クリアしたら、
	"""
	printItem
		buffer = 0
		item = 62
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
	flagSet
		flag = 233
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ダイ1モンでは あるニンムを
	スイコウ してもらいます
	"""
	keyWait
	clearMsg
	"""
	ゲンザイ、ネットマフィア
	「ゴスペル」にエイキョウを ウけた
	ナビ 4ニングミが、
	"""
	keyWait
	clearMsg
	"""
	「ブラック・ナビズ」と、イう チームを
	ケッセイしました
	"""
	keyWait
	clearMsg
	"""
	メンバーは、4ニン だけなのですが、
	ヒトリ ヒトリが、フダツきのワルなのです
	"""
	keyWait
	clearMsg
	"""
	メンバーの スクない イマのウチに
	ボクメツ しなければ、
	"""
	keyWait
	clearMsg
	"""
	ショウライテキに オオキな
	ハンザイ ソシキに なりかねません
	"""
	keyWait
	clearMsg
	"""
	「ブラック・ナビズ」のボクメツ
	それを、あなたに してもらいます
	"""
	keyWait
	clearMsg
	"""
	「ブラック・ナビズ」のメンバーは
	バラバラで コウドウしています
	"""
	keyWait
	clearMsg
	"""
	ミたメは、ミンナ クロくて、
	ワルそうな カンじ です
	"""
	keyWait
	clearMsg
	"""
	メンバーのヒトリが、
	よく アジーナエリアで、
	モクゲキされています
	"""
	keyWait
	clearMsg
	"""
	これが ダイ1モンです
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
			jump = 1,
			jump = continue,
			jump = continue
		]
	"では イってらっしゃい!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	「ブラック・ナビズ」の4ニン、
	ゼンイン タオしました?
	"""
	keyWait
	clearMsg
	"マダですか・・・"
	keyWait
	clearMsg
	"ガンバって、タオしてキてクダさい"
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
			jump = 1,
			jump = continue,
			jump = continue
		]
	"では イってらっしゃい!"
	keyWait
	end
}
script 3 mmbn2 {
	flagSet
		flag = 227
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おメデとうゴザいます! やりますね!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"では、ダイ2モンです!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ダイ2モンは サバイバルバトルです"
	keyWait
	clearMsg
	"""
	レンゾクで
	20カイ アラワれる ウイルスを
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
		target = 6
}
script 6 mmbn2 {
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
			jump = 12,
			jump = continue,
			jump = 5,
			jump = continue
		]
	"""
	では、マタ
	ワタシに ハナしカけて クダさい
	"""
	keyWait
	end
}
script 7 mmbn2 {
	flagClear
		flag = 226
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
			jump = 12,
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
script 8 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	もうイチド
	ダイ2モンに チャレンジ するのですね
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 9 mmbn2 {
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
		target = 10
}
script 10 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 62
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 62
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	flagSet
		flag = 230
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
script 11 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おツカれサマでした"
	keyWait
	end
}
