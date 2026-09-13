@archive 0774754
@size 255

script 1 mmbn2 {
	flagSet
		flag = 585
	wait
		frames = 1
	end
}
script 30 mmbn2 {
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
		flag = 1283
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 21
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 21
	"""
	」
	を ゲットした!!
	"""
	keyWait
	end
}
script 190 mmbn2 {
	flagSet
		flag = 309
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	アナタは、SSSライセンスシケンの
	ジュケンシャですね
	"""
	keyWait
	clearMsg
	"ワタシのキーワードです"
	keyWait
	clearMsg
	"「オトを カナデるモノ」"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	しつないよう
	セキュリティシステムだ
	"""
	keyWait
	clearMsg
	"ひらくことはできない"
	keyWait
	end
}
