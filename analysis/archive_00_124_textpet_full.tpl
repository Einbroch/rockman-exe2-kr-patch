@archive 076CF9C
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ブルブル・・・ブルブル・・・
	ジツハ、ワタシ タカイトコロガ
	ニガテナノデス
	"""
	keyWait
	clearMsg
	"""
	ワタシガ、フルエルト
	ガゾウ モ フルエテシマウノデ
	ナルベク、フルエナイヨウニ シテイマス
	"""
	keyWait
	clearMsg
	"ブルブル・・・"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ヒコウキノ テレビエイゾウ ガ
	タマニ ミダレルノハ、
	"""
	keyWait
	clearMsg
	"""
	コウショ キョウフショウ ノ
	プログラムガ、イルショウコ デス
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 20
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは サブチップショウニン・・・
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
		shop = 20
}
script 181 mmbn2 {
	clearMsg
	"マタ おコしクダさい!"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは サブチップショウニンですが、
	イマは イいモノ ありません・・・
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
		flag = 1423
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
