@archive 0774868
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ひょっとして
	アメロッパスクエアを サガしてる?
	"""
	keyWait
	clearMsg
	"""
	なら クるエリアを マチガってるな
	アメロッパエリア2から アクセスしなよ
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ニホンノ ナビサン デスカ?
	アメロッパエリアハ ドウデスカ
	ユックリ タノシンデ イッテクダサイ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 3
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ファ~ タスカリマシタ
	ドウモ アリガトウゴザイマス
	"""
	keyWait
	clearMsg
	"""
	ホカニモ コオリニ、
	トジコメラレテイルヒトガ イマス
	ドウカ、タスケテアゲテ クダサイ
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コオリガ ゼンブナクナッタ
	ミタイデス~
	"""
	keyWait
	clearMsg
	"ヨカッタ ヨカッタ"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	イマサラ イわなくても
	わかってると オモうけど、
	"""
	keyWait
	clearMsg
	"""
	アメロッパスクエアに
	アクセス できるのは、
	アメロッパエリア2 からだよ
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コウミエテ ワタシハ、グンジヨウノ
	トクシュプログラム ナノデス
	"""
	keyWait
	clearMsg
	"""
	ウイルスヲ ハッケン シダイ
	コウゲキヲ シカケ、ソノソンザイヲ
	オフィシャルニ ホウコク シマス
	"""
	keyWait
	clearMsg
	"""
	・・・シカシ ソノケッカヲ
	ワタシハ シルコトガ デキマセン・・・
	"""
	keyWait
	clearMsg
	"ナゼカッテ?"
	keyWait
	clearMsg
	"""
	ソレイジョウハ
	ワタシニ イワセナイデ クダサイ・・・
	"""
	keyWait
	end
}
script 210 mmbn2 {
	checkItem
		item = 37
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 211
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 37
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 603
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 31
		field = 65
		music = 27
}
script 211 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 212 mmbn2 {
	checkItem
		item = 37
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 213
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 37
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 604
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 32
		field = 65
		music = 27
}
script 213 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 214 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkItem
		item = 87
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
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
script 221 mmbn2 {
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
		flag = 71
	wait
		frames = 102
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	ミギシバラク アメロッパエリア2
	ヒダリ    デンサンエリア3
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ウェルカム!
	インターネット アメロッパエリア!
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	ミギ      アメロッパエリア2
	ヒダリシバラク デンサンエリア3
	"""
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
		flag = 1429
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
	flagSet
		flag = 1430
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 124
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 124
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 232 mmbn2 {
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
		jumpIfFalse = 233
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
		target = 233
}
script 233 mmbn2 {
	flagSet
		flag = 1431
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 234,
			ratio = 64
			jump = 235,
			ratio = 0
			jump = 0,
			ratio = 32
			jump = 236
		]
	flagClear
		flag = 2144
}
script 234 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	startRandomBattle
	end
}
script 235 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 140
			code = L,
			chip = 140
			code = L,
			chip = 140
			code = L,
			chip = 140
			code = L,
			chip = 9
			code = N,
			chip = 9
			code = N,
			chip = 9
			code = N,
			chip = 9
			code = N,
			chip = 10
			code = K,
			chip = 10
			code = K,
			chip = 10
			code = K,
			chip = 10
			code = K,
			chip = 20
			code = R,
			chip = 20
			code = R,
			chip = 20
			code = R,
			chip = 20
			code = R
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
script 236 mmbn2 {
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
script 237 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 238
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
	itemGiveChip
		chip = 145
		code = Q
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 145
	" "
	printCode
		buffer = 0
		code = Q
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1432
	end
}
script 238 mmbn2 {
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
