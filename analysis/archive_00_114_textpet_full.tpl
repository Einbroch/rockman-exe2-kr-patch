@archive 076BAF0
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシハ、アリガタイ
	オジゾウサマ プログラムデス
	セカイノ ヘイワヲ カンリシテイマス
	"""
	keyWait
	clearMsg
	"""
	・・・トイウノハ ジョウダンデ、
	コノ モリノ、クウキノジョウタイヲ
	チョウサシテイマス
	"""
	keyWait
	clearMsg
	"""
	ココノ クウキハ、マチニクラベルト
	キレイ デスケド、
	"""
	keyWait
	clearMsg
	"""
	スウネンマエニ クラベルト
	アキラカニ、キタナクナッテイマス
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	タダノ、クウキ カンソクシステム
	ナンデスケド、
	"""
	keyWait
	clearMsg
	"""
	ミタメハ、オジゾウサマナノデ、
	ナントモ、アリガタイ キブンデス
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 156
		jumpIfTrue = 197
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ハァハァ・・・
	キョウのトレーニングもハードだぜ!
	"""
	keyWait
	clearMsg
	"オレになんかようか!?"
	keyWait
	clearMsg
	"""
	オレはトレーニングでキがタっているんだ!
	キヤスく ハナシかけるんじゃねえ!
	"""
	keyWait
	clearMsg
	jump
		target = 191
}
script 191 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"じつは・・・\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ファンなんです "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"とおりすがりです"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 193,
			jump = continue
		]
}
script 192 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ほ、ほほう
	キミはヒトを ミるメがアるねえ
	で、どうしたんだい?
	"""
	keyWait
	clearMsg
	jump
		target = 194
}
script 193 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワルいが、トレーニングのジャマだ
	どこかにイってくれ
	"""
	keyWait
	end
}
script 194 mmbn2 {
	flagSet
		flag = 156
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こんど、ネットバトルをされるって
	きいたんですけど
	"""
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"さくせんは "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"あなたのじゃくてんは"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 195,
			jump = 196,
			jump = continue
		]
}
script 195 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ふふん、サクセンってほどのコトじゃないが"
	keyWait
	clearMsg
	"""
	とにかく、ウゴきまわって
	ヤツを ホンロウしてやるぜ!
	"""
	keyWait
	clearMsg
	"スピードでショウブだ!"
	keyWait
	clearMsg
	"ホカにキくコトはナいか?"
	keyWait
	clearMsg
	"ん オレのジャクテン?"
	keyWait
	clearMsg
	"""
	そんなコト、おしえられるワケ
	ないだろう!!
	"""
	keyWait
	clearMsg
	"""
	おマエまさか オレのタイセンアイテの
	スパイだな!? ・・・
	"""
	keyWait
	clearMsg
	"""
	でも、マてよ・・・
	アイツがそんなコト オモいツくハズないか
	"""
	keyWait
	clearMsg
	"""
	トりアえず、ジャクテンはナい
	と、イっておこう!
	"""
	keyWait
	end
}
script 196 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	そんなコト、おしえられるワケ
	ないだろう!!
	"""
	keyWait
	clearMsg
	"""
	おマエまさか オレのタイセンアイテの
	スパイだな!? ・・・
	"""
	keyWait
	clearMsg
	"""
	でも、マてよ・・・
	アイツがそんなコト オモいツくハズないか
	"""
	keyWait
	clearMsg
	"""
	トりアえず、ジャクテンはナい
	と、イっておこう!
	"""
	keyWait
	clearMsg
	"ホカにキくコトはナいか?"
	keyWait
	clearMsg
	"""
	ん? ナニ?
	こんどのネットバトルのサクセン?
	"""
	keyWait
	clearMsg
	"ふふん、サクセンってほどのコトじゃないが"
	keyWait
	clearMsg
	"""
	とにかく、ウゴきまわって
	ヤツを ホンロウしてやるぜ!
	"""
	keyWait
	clearMsg
	"スピードでショウブだ!"
	keyWait
	clearMsg
	"ま、ラクショウだな ラクショウ"
	keyWait
	end
}
script 197 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ま、オレのショウリは カクジツだ
	バスティングレベルで イったらSだな
	"""
	keyWait
	clearMsg
	"""
	タトえがワカりにくい?
	それがイイんだよ!!
	"""
	keyWait
	clearMsg
	"さ、れんしゅう れんしゅう!"
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1399
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 96
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
