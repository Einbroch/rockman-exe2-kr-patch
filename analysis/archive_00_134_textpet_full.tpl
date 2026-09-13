@archive 0772308
@size 255

script 20 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ウラインターネットヘ
	チカミチ シヨウト オモッタラ
	カエッテ ミチニ マヨッテ シマイマシタ
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 5
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
		shop = 5
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
script 190 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ハジめまして ナンバー2から
	ハナシは キいている
	"""
	keyWait
	clearMsg
	"""
	ワタシが、「ブラック・ナビズ」の
	リーダー ナンバー1だ
	"""
	keyWait
	clearMsg
	"""
	まさか、ワタシの ブカが
	ゼンイン ヤられてしまうとはな・・・
	"""
	keyWait
	clearMsg
	"""
	しかし、ワタシは スコしも
	オコってはいない・・・
	"""
	keyWait
	clearMsg
	"""
	むしろ、キミのユウシュウさを
	タカく ヒョウカしている
	"""
	keyWait
	clearMsg
	"""
	どうだ? ワタシとイッショに、
	ネットワークセカイを シハイしないか?
	"""
	keyWait
	clearMsg
	"""
	キミが、ワが「ブラック・ナビズ」に
	ハイってくれれば、100ニンリキだ
	"""
	keyWait
	clearMsg
	"もちろん、カンブとして ユウグウするよ"
	keyWait
	clearMsg
	jump
		target = 191
}
script 191 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"あくの、みかたになんか ならないぞ!!"
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"そうか・・・ザンネンだ・・・"
	keyWait
	clearMsg
	"""
	というコトは、キミは ワタシの
	ヤボウをかなえるのに ヒジョウに、
	ジャマな ソンザイになる
	"""
	keyWait
	clearMsg
	"""
	ワタシは、とても ヨウジンブカくてね
	フアンヨウソは、スベて ケさなくては
	キが、スまないのだよ・・・
	"""
	keyWait
	clearMsg
	"タトえ、どんなに チイさくともね!!"
	keyWait
	clearMsg
	flagSet
		flag = 234
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 60
		field = 65
		music = 27
}
script 220 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンは、ワクチンがないので
	こおりを こわすことができない!
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
		flag = 1304
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
		flag = 1305
	jumpRandom
		untrap = true
		targets = [
			ratio = 64
			jump = 233,
			ratio = 32
			jump = 234,
			ratio = 0
			jump = 0,
			ratio = 32
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
			chip = 28
			code = N,
			chip = 28
			code = N,
			chip = 28
			code = N,
			chip = 28
			code = N,
			chip = 31
			code = N,
			chip = 31
			code = N,
			chip = 31
			code = N,
			chip = 31
			code = N,
			chip = 43
			code = W,
			chip = 43
			code = W,
			chip = 43
			code = W,
			chip = 43
			code = W,
			chip = 41
			code = G,
			chip = 41
			code = G,
			chip = 41
			code = G,
			chip = 41
			code = G
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
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 5000,
			amount = 5000,
			amount = 5000,
			amount = 5000,
			amount = 10000,
			amount = 10000,
			amount = 10000,
			amount = 10000
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
		flag = 1306
	jumpRandom
		untrap = true
		targets = [
			ratio = 64
			jump = 238,
			ratio = 32
			jump = 239,
			ratio = 0
			jump = 0,
			ratio = 32
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
			chip = 28
			code = N,
			chip = 28
			code = N,
			chip = 28
			code = N,
			chip = 28
			code = N,
			chip = 31
			code = N,
			chip = 31
			code = N,
			chip = 31
			code = N,
			chip = 31
			code = N,
			chip = 43
			code = W,
			chip = 43
			code = W,
			chip = 43
			code = W,
			chip = 43
			code = W,
			chip = 41
			code = G,
			chip = 41
			code = G,
			chip = 41
			code = G,
			chip = 41
			code = G
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
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 2000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 3000,
			amount = 5000,
			amount = 5000,
			amount = 5000,
			amount = 5000,
			amount = 10000,
			amount = 10000,
			amount = 10000,
			amount = 10000
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
	itemGiveChip
		chip = 187
		code = M
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 187
	" "
	printCode
		buffer = 0
		code = M
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1307
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
