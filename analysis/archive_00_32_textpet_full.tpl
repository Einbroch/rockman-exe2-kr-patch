@archive 075E2DC
@size 255

script 0 mmbn2 {
	checkFlag
		flag = 531
		jumpIfTrue = 1
		jumpIfFalse = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマンなんて しるもんか!"
	keyWait
	end
}
script 1 mmbn2 {
	flagSet
		flag = 532
	wait
		frames = 1
	end
}
script 190 mmbn2 {
	checkItem
		item = 55
		amount = 1
		jumpIfEqual = 197
		jumpIfGreater = 197
		jumpIfLess = continue
	checkFlag
		flag = 3217
		jumpIfTrue = 197
		jumpIfFalse = continue
	checkFlag
		flag = 283
		jumpIfTrue = 195
		jumpIfFalse = continue
	checkFlag
		flag = 284
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 284
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"どうしたの? ボ・"
	waitSkip
		frames = 20
	"ウ・"
	waitSkip
		frames = 20
	"""
	ヤ?
	おねえさんに なにか ごよう?
	"""
	keyWait
	clearMsg
	"""
	ごようが、ないのに
	オンナのヒトの おへやに
	むやみに はいるものじゃ ないっぺよ
	"""
	keyWait
	end
}
script 191 mmbn2 {
	flagSet
		flag = 283
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	な、なによ・・・
	は、はやく でていくべ!
	ヒトをよぶっぺよ!
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	その とくちょうのある しゃべりかた
	「かいとう 3しまい」の ひとりだな!?
	"""
	keyWait
	clearMsg
	"ぬすんだ ほうせきをかえすんだ!!"
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	はは~ん、あんただすっぺ?
	さいきん ワタシたちのコト
	かぎまわってる わらしってのは・・・
	"""
	keyWait
	clearMsg
	"まぁ、とりあえず ハナシは・・・"
	keyWait
	clearMsg
	"コイツらに かってから、するっぺ!!"
	keyWait
	clearMsg
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 55
		field = 65
		music = 27
}
script 194 mmbn2 {
	mugshotHide
	msgOpen
	"かり"
	keyWait
	end
}
script 195 mmbn2 {
	flagSet
		flag = 283
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	わ、わわ! やられちまったべ!
	こんな わらしが、こげにつよいとは
	おもわんかったべ
	"""
	keyWait
	clearMsg
	"""
	しゃーないべな~
	ホレ、ほうせきは かえすべさ
	"""
	keyWait
	clearMsg
	"""
	でも、あんたに ワタシのいもうとを
	みつけるコトが できるべか?
	"""
	keyWait
	clearMsg
	jump
		target = 196
}
script 196 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 55
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 55
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 197 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	みつかっちまったら しゃーないべ
	かくん に したがって
	ドロボウは もう、やめるべ~
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	トビラの おくには、
	おフロと、トイレがある ぞくにいう
	ユニットバスだ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	タナのちゅうおうに れいぞうこがある
	メンテナンスように、プラグインできる
	つくりになっている
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 320
		jumpIfTrue = continue
		jumpIfFalse = 235
	jump
		target = 236
	end
}
script 222 mmbn2 {
	msgOpen
	"おおきな でんきスタンドだ"
	keyWait
	clearMsg
	"""
	よる、でんきをつけると、
	ムーディーな アメロッパのよるを
	えんしゅつ してくれる
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	テーブルの うえには、ルームサービスの
	メニューがおいてある
	"""
	keyWait
	end
}
script 224 mmbn2 {
	checkChapter
		lower = 41
		upper = 41
		jumpIfInRange = 225
		jumpIfOutOfRange = continue
	checkChapter
		lower = 38
		upper = 38
		jumpIfInRange = 233
		jumpIfOutOfRange = 230
	end
}
script 225 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"今日は もうねちゃう?\n"
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
			jump = 231,
			jump = continue,
			jump = continue
		]
	end
}
script 226 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	今日の できごとを
	PETに セーブしておこうか?
	
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
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 232,
			jump = 228,
			jump = continue
		]
	end
}
script 227 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	save
		jumpIfSuccessful = continue
		jumpIfFailed = 229
	"""
	OK!
	・・・
	"""
	waitSkip
		frames = 30
	"セーブ できたよ!"
	keyWait
	clearMsg
	jump
		target = 228
}
script 228 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん おやすみ!"
	keyWait
	end
}
script 229 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"セーブに しっぱいしたみたい・・・"
	keyWait
	clearMsg
	"もう1回 やってみるね\n"
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
			jump = 227,
			jump = 228,
			jump = continue
		]
	end
}
script 230 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、せっかく がいこくきたのに
	ひるねしたら もったいないよ
	"""
	keyWait
	end
}
script 231 mmbn2 {
	checkChapter
		lower = 41
		upper = 41
		jumpIfInRange = continue
		jumpIfOutOfRange = 226
	flagSet
		flag = 543
	jump
		target = 226
}
script 232 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	すでに セーブデータが あるばあい
	うわがき しちゃうけど いい?
	
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
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 227,
			jump = 228,
			jump = continue
		]
	end
}
script 233 mmbn2 {
	msgOpen
	"""
	ニホンにはない ビッグな ベッドだ
	でも 今は ねむくない・・・
	"""
	keyWait
	end
}
script 235 mmbn2 {
	flagSet
		flag = 320
	msgOpen
	"ゴソゴソ"
	textSpeed
		delay = 10
	"・・・"
	textSpeed
		delay = 2
	keyWait
	clearMsg
	"""
	熱斗は
	れいぞうこを あけてみた・・・
	"""
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 96
	"""
	」が ある・・・
	ヒエヒエだが つかえそうだ
	"""
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	熱斗は、
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
	playerReset
	keyWait
	end
}
script 236 mmbn2s {
	end
}
