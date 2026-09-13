@archive 07383EC
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、プラグアウトするのか?\n"
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
		default = 1
		disableB = false
		clear = false
		targets = [
			jump = 1,
			jump = continue,
			jump = continue
		]
	end
}
script 1 mmbn2 {
	clearMsg
	"OK! りょうかい!"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ナニか、すごいチカラが
	はたらいていて、プラグアウト
	できないよ!
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、きもちは わかるけど
	いま プラグアウトするのは きけんだよ!
	バクダンが バクハツしちゃう!!
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	はやくしないと きゅうきょくのナビが
	かつどうを はじめてしまう!
	プラグアウトしてる ヒマはないよ!!
	"""
	keyWait
	end
}
