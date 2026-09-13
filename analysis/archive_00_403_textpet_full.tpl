@archive 074A1F8
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	それいじょう ちかづくと アブナイ!
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	"""
	おばさん、ここの おてつだいを
	することに したんだよ
	"""
	keyWait
	clearMsg
	"""
	やっぱり おカネは
	ひたいに アセして かせがないとね
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	これだけ ひろいと
	そうじを するのも ひとくろうだよ・・・
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	まえに このゆわかしきが
	ウイルスに やられたんだったね・・・
	"""
	keyWait
	clearMsg
	"""
	また そうなったら
	こんどは わたしが ガスに・・・
	"""
	waitSkip
		frames = 30
	"?"
	waitSkip
		frames = 30
	"\nぶるるるる!"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"つうきこうだ"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"つうきこうだ"
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	checkChapter
		lower = 7
		upper = 72
		jumpIfInRange = 228
		jumpIfOutOfRange = continue
	"""
	熱斗は、
	ガスゆわかしきを しらべた・・・
	"""
	keyWait
	clearMsg
	soundPlay
		track = 258
	soundDisableTextSFX
	"ピコ"
	wait
		frames = 10
	soundPlay
		track = 258
	"ピコ・・・"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	soundEnableTextSFX
	"""
	ダメだ! スイッチおしても きかない!
	かんきせんも うごかない!
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 547
		jumpIfTrue = 227
		jumpIfFalse = continue
	checkFlag
		flag = 546
		jumpIfTrue = 227
		jumpIfFalse = continue
	flagSet
		flag = 547
	jump
		target = 226
}
script 223 mmbn2 {
	msgOpen
	"ヒノキでつくられた おけだ"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	checkChapter
		lower = 6
		upper = 6
		jumpIfInRange = 229
		jumpIfOutOfRange = continue
	"ヒノキぶろだ"
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ガスが たちこめている!
	ちかづくのは キケンだ!!
	"""
	keyWait
	end
}
script 226 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	きっと プログラムが おかしいんだよ!
	熱斗くん、プラグイン してみて!
	ボク しらべてくる!
	"""
	keyWait
	end
}
script 227 mmbn2s {
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	ガスゆわかしきだ
	これで オフロの おゆをわかすようだ
	プラグインジャックが ついている・・・
	"""
	keyWait
	end
}
script 229 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! きもちは わかるけど
	それいじょう ちかづくのは キケンだよ!
	"""
	keyWait
	clearMsg
	"""
	ここは ボクに まかせて
	もういちど プラグインおねがい!
	"""
	keyWait
	end
}
