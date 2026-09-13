@archive 0791F2C
@size 13

script 0 mmbn2 {
	checkItem
		item = 63
		amount = 1
		jumpIfEqual = 7
		jumpIfGreater = 7
		jumpIfLess = continue
	checkFlag
		flag = 235
		jumpIfTrue = 9
		jumpIfFalse = continue
	checkFlag
		flag = 236
		jumpIfTrue = 7
		jumpIfFalse = continue
	checkFlag
		flag = 237
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkFlag
		flag = 244
		jumpIfTrue = 3
		jumpIfFalse = continue
	checkFlag
		flag = 243
		jumpIfTrue = 2
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ワタシは\n"
	printItem
		buffer = 0
		item = 63
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
		item = 63
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
		flag = 243
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ダイ1モンでは ネットバトラーとしての
	スイリリョクを テストします
	"""
	keyWait
	clearMsg
	"""
	わずかな ヒントから セイカイを
	ミチビきダすのは、ジッサイの ニンムでも
	ジュウヨウな コトですからね
	"""
	keyWait
	clearMsg
	"さて、テストのナイヨウですが・・・"
	keyWait
	clearMsg
	"""
	あるヒトをサガして、ネットバトルを
	してもらいます
	"""
	keyWait
	clearMsg
	"""
	あるヒトとは、セカイジュウのナビを
	アヤつるとイわれる「ナビマスター」と
	イわれるジンブツです
	"""
	keyWait
	clearMsg
	"""
	これから、あなたに 1つのヒントを
	あたえます
	"""
	keyWait
	clearMsg
	"「シオの かおりのする カンバン」"
	keyWait
	clearMsg
	"""
	あなたは、このヒントを もとにして、
	ツギに ススむべきバショを、スイリします
	"""
	keyWait
	clearMsg
	"""
	もし、あなたの スイリが タダしければ、
	そのサキにある アラたなるヒントを
	エるコトが できます
	"""
	keyWait
	clearMsg
	"""
	そして、そのヒントを タドっていくと、
	サイシュウテキに
	"""
	keyWait
	clearMsg
	"""
	このテストの ゴールである
	「ナビマスター」の モトに
	タドりツくコトがデキます
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
	「ナビマスター」から、ダイ1モン
	クリアのレンラクを ウけていません
	"""
	keyWait
	clearMsg
	"ガンバって スイリして クダさい"
	keyWait
	clearMsg
	"""
	もうイチド
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
		flag = 237
	flagClear
		flag = 243
	flagClear
		flag = 304
	flagClear
		flag = 305
	flagClear
		flag = 306
	flagClear
		flag = 307
	flagClear
		flag = 308
	flagClear
		flag = 309
	flagClear
		flag = 310
	flagClear
		flag = 310
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
	30カイ アラワれる ウイルスを
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
	flagSet
		flag = 243
	flagClear
		flag = 236
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
		item = 63
		amount = 1
	flagClear
		flag = 243
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 63
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	flagSet
		flag = 240
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
