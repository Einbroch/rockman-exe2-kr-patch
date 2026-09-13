@archive 0765420
@size 255

script 220 mmbn2 {
	msgOpen
	"かんり人のへやだ・・・"
	keyWait
	clearMsg
	"""
	しんと、しずまりかえっている・・・
	人の けはいは ない
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"ゆうびんうけだ"
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	オートロックだが、カギは かかっていない
	プラグインできそうだ!
	"""
	keyWait
	end
}
script 223 mmbn2 {
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
script 224 mmbn2 {
	flagSet
		flag = 550
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	マンションの じゅうにんの
	なまえが かいてある・・・
	"""
	keyWait
	end
}
