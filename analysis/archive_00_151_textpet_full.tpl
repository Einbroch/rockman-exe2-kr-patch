@archive 07779B0
@size 255

script 0 mmbn2 {
	jump
		target = 211
}
script 10 mmbn2 {
	checkFlag
		flag = 647
		jumpIfTrue = 11
		jumpIfFalse = continue
	flagSet
		flag = 647
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ったく! ダレだよインターネットのナカに
	こんなモン オきやがったのは!!
	"""
	keyWait
	clearMsg
	"""
	こんなトコロ フサがれちゃあ、
	シタに オりられねえじゃねえか
	"""
	keyWait
	clearMsg
	"""
	さて、どうやって、トりノゾくかな?
	ブツブツ・・・
	"""
	keyWait
	clearMsg
	"ん? ナンだ? おめえは?"
	keyWait
	clearMsg
	"""
	え? アニキがオレをサガしてたって?
	ホント、シンパイしょうだな アニキは
	"""
	keyWait
	clearMsg
	"""
	なあ、アンタ ワルいけど、もっかい
	アニキのトコロにモドって、
	"""
	keyWait
	clearMsg
	"""
	オレはダイジョウブだ すぐカエるって、
	ツタえてくれないか?
	"""
	keyWait
	clearMsg
	"""
	オレはもうスコシ、このコオリを
	コワすホウホウを サガしてみる
	"""
	keyWait
	clearMsg
	"""
	え? おめえもコオリのコワしかたを
	サガしてるのか?
	"""
	keyWait
	clearMsg
	"""
	このコオリのコワしカタは、
	カギショクニンのオレでも
	なかなかワカらねえんだよな
	"""
	keyWait
	clearMsg
	"""
	コレをコワすには、
	3つの「あおのかけら」が、
	ヒツヨウなのは、わかったんだけど、
	"""
	keyWait
	clearMsg
	"""
	その「あおのかけら」が
	どこにあるかワカらんからな
	"""
	keyWait
	clearMsg
	"ま イマんトコはそんなカンジだ"
	keyWait
	clearMsg
	"""
	とりあえず、アニキにオレは
	ダイジョウブだってコト ツタえてキてくれ
	ヨロシクな
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"アニキに ヨロシクツタえておいてくれ"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1810
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"ナニ! ココにどうやって!!"
	keyWait
	clearMsg
	"""
	フン まあいいどうせ おマエは
	ココで シぬのだからな!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 649
	checkFlag
		flag = 2148
		jumpIfTrue = 24
		jumpIfFalse = continue
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 46
		field = 0
		music = 27
}
script 22 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1809
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 23 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 60
		upper = 60
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ここにいた カギショクニン?"
	keyWait
	clearMsg
	"""
	あぁ サッキ、アメロッパスクエアに
	カエるとか いってたぜ
	"""
	keyWait
	end
}
script 24 mmbn2 {
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 46
		field = 117
		music = 27
}
script 30 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	サスガの カギショクニンも、
	このコオリには、テもアシも
	デなかったみたいだな
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"カギショクニンには アえたかい?"
	keyWait
	end
}
script 210 mmbn2 {
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 211
		jumpIfOutOfRange = continue
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 211 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	オイ ナニミてんだボウズ!
	ココはガキのクるトコロじゃねえぞ
	さっさとカエりな!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"このサキ いきどまり・・・"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	このサキ ウラインターネット4
	はやまるな ひきかえせ!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkItem
		item = 87
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
		jumpIfLess = continue
	msgOpen
	"なぞの セキュリティキューブだ"
	keyWait
	clearMsg
	"""
	パスコードがないので
	キューブを かいじょ
	することができない
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 87
	"""
	」
	を つかった!!
	"""
	keyWait
	clearMsg
	"""
	セキュリティキューブが
	かいじょされた!!
	"""
	keyWait
	msgClose
	flagSet
		flag = 213
	wait
		frames = 102
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
		flag = 1536
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 69
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 69
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 231 mmbn2 {
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
	checkFlag
		flag = 2144
		jumpIfTrue = continue
		jumpIfFalse = 232
	"サブチップ「"
	printItem
		buffer = 0
		item = 115
	"""
	」
	が こうりょくを はっきした!!
	"""
	keyWait
	clearMsg
	"""
	ミステリーデータに ひそむ
	ウイルスデータが デリートされた!
	"""
	keyWait
	jump
		target = 232
}
script 232 mmbn2 {
	flagSet
		flag = 1537
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 233,
			ratio = 32
			jump = 234,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 235
		]
	flagClear
		flag = 2144
}
script 233 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	clearMsg
	startRandomBattle
	end
}
script 234 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 14
			code = O,
			chip = 14
			code = O,
			chip = 14
			code = O,
			chip = 14
			code = O,
			chip = 92
			code = D,
			chip = 92
			code = D,
			chip = 92
			code = D,
			chip = 92
			code = D,
			chip = 62
			code = N,
			chip = 62
			code = N
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 235 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 4000,
			amount = 4000
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 236 mmbn2 {
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
	checkFlag
		flag = 2144
		jumpIfTrue = continue
		jumpIfFalse = 237
	"サブチップ「"
	printItem
		buffer = 0
		item = 115
	"""
	」
	が こうりょくを はっきした!!
	"""
	keyWait
	clearMsg
	"""
	ミステリーデータに ひそむ
	ウイルスデータが デリートされた!
	"""
	keyWait
	jump
		target = 237
}
script 237 mmbn2 {
	flagSet
		flag = 1538
	jumpRandom
		untrap = true
		targets = [
			ratio = 16
			jump = 238,
			ratio = 48
			jump = 239,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 240
		]
	flagClear
		flag = 2144
}
script 238 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	clearMsg
	startRandomBattle
	end
}
script 239 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 3
			code = I,
			chip = 14
			code = O,
			chip = 14
			code = O,
			chip = 14
			code = O,
			chip = 14
			code = O,
			chip = 92
			code = D,
			chip = 92
			code = D,
			chip = 92
			code = D,
			chip = 92
			code = D,
			chip = 62
			code = N,
			chip = 62
			code = N
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 240 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 500,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 4000,
			amount = 4000
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 241 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 242
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
	playerAnimate
		animation = 24
	itemGive
		item = 101
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 101
	"""
	」
	を ゲットした!!
	"""
	keyWait
	clearMsg
	playerFinish
	"""
	サブチップを もてるかずが
	1つ ふえた!
	"""
	keyWait
	msgClose
	flagSet
		flag = 1539
	end
}
script 242 mmbn2 {
	msgOpen
	"""
	このミステリーデータには、
	セキュリティがかかっていて
	かいせきすることができない
	"""
	keyWait
	clearMsg
	"""
	かいせきするには、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 117
	"""
	」
	が、ひつようだ
	"""
	keyWait
	end
}
