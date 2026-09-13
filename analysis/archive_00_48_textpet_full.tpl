@archive 0764BF0
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 53
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 5
		jumpIfOutOfRange = continue
	flagSet
		flag = 522
	wait
		frames = 1
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 27
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 53
		jumpIfInRange = 16
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 11
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 6
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	この ひこうきは、じどうそうじゅうだから
	りちゃくりくの ときいがいは
	"""
	keyWait
	clearMsg
	"""
	ボクたちは、けいきるいのチェックを
	しているんだよ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	さっきのゆれ、おおきかったけど
	ケガはないかい?
	"""
	keyWait
	clearMsg
	"""
	ワタシもびっくりしたよ
	ハハハ
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	いくら じどうそうじゅうでも、
	さっきのエアポケットみたいな
	イレギュラーに たいしょできないから
	"""
	keyWait
	clearMsg
	"""
	しゅどう そうじゅうに
	きりかわるんだよ
	"""
	keyWait
	clearMsg
	"""
	プログラムに まかせっきりにできない
	しごともあるんだよ
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"じゅんちょう、じゅんちょう!"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	なんでもプログラムが
	やってくれるなんて、
	べんりなよのなかだね
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	どうした?
	ナニかあったのかい?
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"ふぁ~あ、ねむくなってきちゃったよ"
	keyWait
	end
}
script 25 mmbn2 {
	checkFlag
		flag = 550
		jumpIfTrue = 26
		jumpIfFalse = continue
	flagSet
		flag = 550
	wait
		frames = 1
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"たのむぞ"
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	どうなってんだ?
	あわわわわ!
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"ふ~、たすかった・・・"
	keyWait
	clearMsg
	"""
	キミは、じょうきゃく じょういん
	みんなの いのちの おんじんだ!
	"""
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"ありがとう! ありがとう!"
	keyWait
	end
}
script 220 mmbn2 {
	jump
		target = 1
	keyWait
	end
}
script 221 mmbn2 {
	jump
		target = 0
	keyWait
	end
}
script 222 mmbn2 {
	checkChapter
		lower = 49
		upper = 53
		jumpIfInRange = continue
		jumpIfOutOfRange = 223
	msgOpen
	"""
	ひこうきの じょうたいを
	あらわす けいきるいが
	ならんでいる
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	けいきるいが ならんでいる
	プラグインできる
	"""
	keyWait
	end
}
script 224 mmbn2 {
	checkFlag
		flag = 305
		jumpIfTrue = 229
		jumpIfFalse = continue
	msgOpen
	"""
	さまざまな けいきが ならんでいる
	しかし、まったくイミがわからない
	"""
	keyWait
	end
}
script 225 mmbn2 {
	checkItem
		item = 30
		amount = 1
		jumpIfEqual = 227
		jumpIfGreater = 227
		jumpIfLess = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 226
		jumpIfOutOfRange = continue
	msgOpen
	"""
	きちょうさんの りっぱな
	ぼうしだ・・・
	"""
	keyWait
	clearMsg
	"""
	かなり おおきい
	いや、おおきすぎる・・・
	"""
	keyWait
	end
}
script 226 mmbn2 {
	checkItem
		item = 30
		amount = 1
		jumpIfEqual = 227
		jumpIfGreater = 227
		jumpIfLess = continue
	msgOpen
	mugshotShow
		mugshot = Lan
	"""
	この ぼうし、つかえそうだな・・・
	こっそりもっていきゃ バレねえよな
	"""
	keyWait
	clearMsg
	"""
	きちょうさん、ゴメンなさい
	ちょっとかります
	"""
	keyWait
	clearMsg
	jump
		target = 228
}
script 227 mmbn2 {
	msgOpen
	"""
	ぼうしのない ぼうしかけは
	すこし、さみしそうだ・・・
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	mugshotHide
	playerAnimate
		animation = 24
	itemGive
		item = 30
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 30
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	flagSet
		flag = 109
	end
}
script 229 mmbn2 {
	flagSet
		flag = 306
	msgOpen
	"ナニか かかれている・・・"
	keyWait
	clearMsg
	"「いぶんかを みおろすトコロ」"
	keyWait
	end
}
