@archive 0765D8C
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! 今ここで かえったら
	「ゴスペル」の やぼうが じつげん
	されてしまうよ!!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	サーバーだ・・・
	ものスゴい 電磁波を はなっている!
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	パソコンや 電子きき が、
	ざつぜんと つまれている・・・
	"""
	keyWait
	clearMsg
	"プラグインできる!!"
	keyWait
	end
}
