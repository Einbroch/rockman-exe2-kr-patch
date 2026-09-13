@archive 07731E8
@size 255

script 0 mmbn2 {
	checkShopStock
		shop = 6
		jumpIfStocked = continue
		jumpIfSoldOut = 2
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
			jump = 1,
			jump = continue
		]
	startShop
		shop = 6
}
script 1 mmbn2 {
	clearMsg
	"マタ おコしクダさい"
	keyWait
	end
}
script 2 mmbn2 {
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
script 3 mmbn2 {
	checkShopStock
		shop = 7
		jumpIfStocked = continue
		jumpIfSoldOut = 5
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
			jump = 4,
			jump = continue
		]
	startShop
		shop = 7
}
script 4 mmbn2 {
	clearMsg
	"マタ おコしクダさい"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは ネットショウニンですが、
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	タクサン カいモノを すれば
	カイインに なれるかと オモったけど
	そういうコトでも なかったみたい・・・
	"""
	keyWait
	clearMsg
	"""
	ゴシュジンサマに
	ナイショで ツカったおカネ・・・
	どうしよう
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 22
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ワタシは バグのカケラ コウカンヤ・・・
	コウカン してイきますか?
	
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
		clear = false
		targets = [
			jump = continue,
			jump = 181,
			jump = continue
		]
	startShop
		shop = 22
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
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ワタシは バグのカケラ コウカンヤ・・・
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 220 mmbn2 {
	jump
		target = 0
}
script 221 mmbn2 {
	jump
		target = 3
}
script 222 mmbn2 {
	msgOpen
	"""
	たとえ、でんのうのモノであっても、
	ハナは、いいものだ
	"""
	keyWait
	end
}
