@archive 07659C4
@size 255

script 220 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、エレベーターに のるなら
	スイッチ おさなきゃ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	flagSet
		flag = 550
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	電磁波のえいきょうで
	ロックがかかっている・・・
	はいれそうにない
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	電磁波のえいきょうで
	ロックがかかっている・・・
	はいれそうにない
	"""
	keyWait
	end
}
