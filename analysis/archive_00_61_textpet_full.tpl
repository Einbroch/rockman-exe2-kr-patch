@archive 0765C54
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!! それいじょう ちかづいたら
	また アブナイ!!
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
	checkFlag
		flag = 561
		jumpIfTrue = continue
		jumpIfFalse = 225
	checkFlag
		flag = 566
		jumpIfTrue = continue
		jumpIfFalse = 226
	msgOpen
	"""
	電磁波を コントロールしていた
	サーバーだ
	プラグインできる
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"ソファーだ・・・"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"フラワーバスケットだ"
	keyWait
	clearMsg
	"""
	しかし、ハナは 今にも
	かれおちてしまいそうだ
	"""
	keyWait
	end
}
script 225 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	このサーバーが あやしいよ・・・
	プラグイン してみよう!
	"""
	keyWait
	end
}
script 226 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	しらべてないで 今は プラグインしよう!
	"""
	keyWait
	end
}
