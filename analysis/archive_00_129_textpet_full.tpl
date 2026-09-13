@archive 076EC98
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ガイコクの インターネットは
	キケンが イッパイです
	"""
	keyWait
	clearMsg
	"ですので、"
	printItem
		buffer = 0
		item = 60
	"""
	を もってるとか
	けっこう つよいナビで ないと
	このサキには ススめないんですよ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	msgOpen
	"""
	ロックマンは、おちている データを
	手にとって しらべてみた
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	"""
	どうやら
	「
	"""
	printItem
		buffer = 0
		item = 1
	"」の ようだ!"
	keyWait
	clearMsg
	flagSet
		flag = 1282
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 1
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 1
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やったな!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	keyWait
	end
}
script 15 mmbn2 {
	checkItem
		item = 6
		amount = 1
		jumpIfEqual = 19
		jumpIfGreater = 19
		jumpIfLess = continue
	checkItem
		item = 5
		amount = 1
		jumpIfEqual = 18
		jumpIfGreater = 18
		jumpIfLess = continue
	checkFlag
		flag = 602
		jumpIfTrue = 17
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	さっき ワルいヤツに
	「
	"""
	printItem
		buffer = 0
		item = 5
	"""
	」を とられてしまって
	・・・
	"""
	keyWait
	clearMsg
	"アルけなく なってしまったのです・・・"
	keyWait
	clearMsg
	"ミたトコロ、あなたは ヤサしそう・・・"
	waitSkip
		frames = 30
	"""
	
	すみませんが、ワルい ヤツから
	トりカエして もらえませんか?
	"""
	keyWait
	clearMsg
	mugshotHide
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
			jump = 16,
			jump = continue,
			jump = continue
		]
	mugshotShow
		mugshot = NormalNavi
	"それは ザンネンです・・・"
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オオ! ありがとうございます!
	タヨりに してますね
	"""
	keyWait
	flagSet
		flag = 602
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ハヤく 「"
	printItem
		buffer = 0
		item = 5
	"""
	」を
	トりカエしてキて クダさいね
	"""
	keyWait
	end
}
script 18 mmbn2 {
	itemTake
		item = 5
		amount = 1
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"オオ! それは 「"
	printItem
		buffer = 0
		item = 5
	"""
	」!
	ありがとう ありがとう!
	"""
	keyWait
	clearMsg
	"""
	あなたには これがフサワしいです
	どうぞ
	"""
	keyWait
	clearMsg
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 6
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 6
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	mugshotShow
		mugshot = NormalNavi
	"""
	オカゲで アルくコトが デキます
	ありがとうございます!
	"""
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	イマは
	プログラムを チョウセイチュウです
	もうスコししたら アルけます
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ショボン・・・"
	keyWait
	clearMsg
	"""
	コトブキエリアニ オツカイ ダッタノ
	デモ コウジチュウデ イケナカッタノ
	"""
	keyWait
	clearMsg
	"ボクノ ハツシゴト ダッタノニ・・・"
	keyWait
	clearMsg
	"デモ マァイイヤ"
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1803
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 25 mmbn2 {
	checkFlag
		flag = 530
		jumpIfTrue = 26
		jumpIfFalse = continue
	flagSet
		flag = 530
	mugshotShow
		mugshot = MrProg
	msgOpen
	"コーコーハードーコー?"
	keyWait
	clearMsg
	"タースーケーテークダサーイ"
	keyWait
	clearMsg
	"""
	エッ? オヤッサンガ
	サガシニ キテクレルンデスカ?
	"""
	keyWait
	clearMsg
	"""
	ソレハ ワザワザ
	アリガトウゴザイマス
	"""
	keyWait
	clearMsg
	"タスカリマシタ~"
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"コノ ゴオンハ ワスレマセン"
	keyWait
	end
}
script 27 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 31
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	このミチを マッスグ ススんで
	ツきアたりを ヒダリに マガれば
	アジーナエリアです
	"""
	keyWait
	clearMsg
	"""
	この エリアは、ゲンジツセカイで
	イうトコロの コッキョウなのです
	"""
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	おやおや、コドモガタの ナビが
	こんなトコロマデ クるとは メズラしい
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	printItem
		buffer = 0
		item = 60
	"を トったんですか"
	keyWait
	clearMsg
	"""
	アジーナに イくタメに・・・
	ハァ・・・
	"""
	keyWait
	clearMsg
	"それは、タイヘンでしたね~"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"どうでした? アジーナは?"
	keyWait
	clearMsg
	"ダレも いなかった?"
	keyWait
	clearMsg
	"そんな ハズは ないんですけどね?"
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"オレタチは、オフィシャルの ナビだ"
	keyWait
	clearMsg
	"""
	フシンな ナビが、デンサンエリアに
	ハイってこないか、ココで ミハってるんだ
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"ミンカンの ナビですね"
	keyWait
	clearMsg
	"""
	ちょっと、ジケンが ハッセイしたので
	あまり、インターネットを
	うろつかないで クダさい
	"""
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	コラ コラ! ソウサのジャマだ!
	カエった カエった!
	"""
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ウワッ! キュウに ハナしかけないでよ
	ただでさえ オクビョウなのに、
	"""
	keyWait
	clearMsg
	"""
	こんな、ゲンカイ タイセイだなんて・・・
	もう、コワくて コワくて・・・
	"""
	keyWait
	clearMsg
	"ビクビク・・・"
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	アメロッパに イけば
	「
	"""
	printItem
		buffer = 0
		item = 86
	"""
	」が ゲットできる
	ことも あるかも しれませんね
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 86
	"""
	」が あるおカゲで
	ニホンの ヤバンな ナビが
	ハイって コなくて タスかるよ
	"""
	keyWait
	clearMsg
	"エ! アナタ ニホンのナビ?"
	keyWait
	clearMsg
	"キョエーーー!!"
	keyWait
	clearMsg
	"な なんてね、"
	waitSkip
		frames = 15
	"""
	
	アメロピアンジョーク ですよ
	アメロピア~~~ン!
	"""
	keyWait
	clearMsg
	"""
	ナビルイ ミナ キョウダイ!
	ナカヨく イきましょう
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	アメロッパに イきたいんだけど、
	なかなか イくユウキが でないな
	"""
	keyWait
	clearMsg
	"""
	アメロッパのウイルスは、
	キョウボウだって イうし・・・
	"""
	keyWait
	end
}
script 65 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	このサキのミチを ヘンなコオリが
	フサいでて アジーナにも
	アメロッパにもイけないんだ
	"""
	keyWait
	clearMsg
	"まったく、コマったよ"
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ゲンジツセカイも、デンノウセカイも
	どうなっちまうのかね?
	"""
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ほえー!! あのコトブキスクエアが?
	コワいねえ!!
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 2
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワタシは ネットショウニン・・・
	イいモノ ありますよ?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"みる "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"みない"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = 181,
			jump = continue
		]
	startShop
		shop = 2
}
script 181 mmbn2 {
	clearMsg
	"マタ おコしクダさい!"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワタシは ネットショウニンですが、
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 210 mmbn2 {
	checkItem
		item = 35
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
		item = 35
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
		flag = 588
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
		battle = 16
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
		item = 35
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
		item = 35
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
		flag = 589
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
		battle = 17
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
script 221 mmbn2 {
	checkItem
		item = 83
		amount = 1
		jumpIfEqual = 222
		jumpIfGreater = 222
		jumpIfLess = continue
	msgOpen
	"""
	ケロの かんりする
	セキュリティキューブだ
	"""
	keyWait
	clearMsg
	"""
	パスコードが ないので
	キューブを かいじょ することが
	できない
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	ケロの かんりする
	セキュリティキューブだ
	"""
	keyWait
	clearMsg
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 83
	"""
	」
	を つかった!!
	"""
	keyWait
	clearMsg
	"""
	セキュリティキューブが
	かいじょ された!!
	"""
	keyWait
	msgClose
	flagSet
		flag = 28
	wait
		frames = 102
	end
}
script 223 mmbn2 {
	checkItem
		item = 60
		amount = 1
		jumpIfEqual = 224
		jumpIfGreater = 224
		jumpIfLess = continue
	checkChapter
		lower = 16
		upper = 16
		jumpIfInRange = 228
		jumpIfOutOfRange = continue
	msgOpen
	"""
	アジーナエリアに つながるみちを ふさぐ
	セキュリティキューブだ・・・
	オフィシャルセンターが かんりしている
	"""
	keyWait
	end
}
script 224 mmbn2 {
	flagSet
		flag = 554
	end
}
script 225 mmbn2 {
	checkItem
		item = 86
		amount = 1
		jumpIfEqual = 226
		jumpIfGreater = 226
		jumpIfLess = continue
	msgOpen
	"""
	アメロッパエリアに つながるミチをふさぐ
	セキュリティキューブだ・・・
	"""
	keyWait
	clearMsg
	"""
	アメロッパの オフィシャルが
	かんりしている
	"""
	keyWait
	clearMsg
	"ひらくには、「"
	printItem
		buffer = 0
		item = 86
	"""
	」
	がひつようだ
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	アメロッパの オフィシャルが
	かんりする
	セキュリティキューブだ
	"""
	keyWait
	clearMsg
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 86
	"""
	」
	を つかった!!
	"""
	keyWait
	clearMsg
	"""
	セキュリティキューブが
	かいじょ された!!
	"""
	keyWait
	msgClose
	flagSet
		flag = 30
	wait
		frames = 102
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	ヒダリ アジーナエリア
	ミギ  アメロッパエリア
	"""
	keyWait
	end
}
script 228 mmbn2 {
	flagSet
		flag = 516
	end
}
script 230 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 236
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
		item = 97
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 97
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1294
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
}
script 232 mmbn2 {
	flagSet
		flag = 1295
	jumpRandom
		untrap = true
		targets = [
			ratio = 16
			jump = 234,
			ratio = 48
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
			chip = 7
			code = O,
			chip = 7
			code = O,
			chip = 7
			code = O,
			chip = 7
			code = O,
			chip = 7
			code = O,
			chip = 24
			code = Y,
			chip = 24
			code = Y,
			chip = 24
			code = Y,
			chip = 24
			code = Y,
			chip = 24
			code = Y,
			chip = 25
			code = Y,
			chip = 25
			code = Y,
			chip = 25
			code = Y,
			chip = 46
			code = D,
			chip = 46
			code = D,
			chip = 46
			code = D
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
			amount = 300,
			amount = 600,
			amount = 1000,
			amount = 2000
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
script 237 mmbn2 {
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
		flag = 1296
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
