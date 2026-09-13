@archive 0765BDC
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
