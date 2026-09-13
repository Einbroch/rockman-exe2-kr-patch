@archive 077FF10
@size 17

script 0 mmbn2 {
	mugshotShow
		mugshot = CookMan
	msgOpen
	"""
	まさか、たった いったいの ナビに
	このクニが かいめつ させられるとは
	"""
	keyWait
	clearMsg
	"ゆるさん・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"""
	 ゆるさんぞ!
	ワシの クニを、ワシの たみを
	すべて うばったおまえを!
	"""
	keyWait
	clearMsg
	"""
	もう、にげられんぞ
	かんねんせい!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"・・・・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = CookMan
	msgOpen
	"おまえたち、やってしまえ!!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"はっ!!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = CookMan
	msgOpen
	"な・"
	waitSkip
		frames = 20
	"な・"
	waitSkip
		frames = 20
	"""
	なぬっ!? わがアジーナの
	ゆうしゃたちが!!
	"""
	keyWait
	clearMsg
	"うぬぬぬぬ・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	keyWait
	clearMsg
	"""
	キ、キサマの ねらいはなんだ!?
	なぜ、このクニを ほろぼすのだ?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"""
	フン・・・
	ゴスペルの しんえいたいだか
	なんだかしらんが よけいなコトを・・・
	"""
	keyWait
	clearMsg
	"このクニを ほろぼすりゆう・・・?"
	keyWait
	clearMsg
	"カンタンなコトよ・・・"
	keyWait
	clearMsg
	"""
	ゴスペルとかいう だんたい から、
	このクニを ほろぼせという
	いらいがあった ただそれだけだ
	"""
	keyWait
	clearMsg
	"""
	そしてせっしゃは あたえられた
	シゴトを まっとうするのみ・・・
	"""
	keyWait
	clearMsg
	"""
	うんが ワルかったな・・・
	アジーナおう よ
	"""
	keyWait
	clearMsg
	"ゴメン!!"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = CookMan
	msgOpen
	"ゴス・・ペル・・・うぐっ"
	wait
		frames = 90
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotHide
	msgOpen
	flagClear
		flag = 578
	"ガクッ"
	keyWait
	flagSet
		flag = 578
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"""
	ダーク・ミヤビさま、
	にんむかんりょういたしました・・・
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Dark
	msgOpen
	"""
	うむ、ごくろうだった
	さっそくだが、つぎのにんむに
	うつってもらう
	"""
	keyWait
	clearMsg
	"つぎのターゲットは、"
	keyWait
	clearMsg
	"・・・だ"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"ぎょい!"
	keyWait
	soundPlay
		track = 222
	flagClear
		flag = 578
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おうさま! おうさま!"
	soundPlayBGM
		track = 15
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = CookMan
	msgOpen
	"""
	お・おぉ、いきのこっておったのか・・・
	グフッ
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おうさま、しゃべっちゃダメです!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = CookMan
	msgOpen
	"""
	ふがいない おうを ゆるしてくれ・・・
	クニを まもることが・・・
	できなかった・・・
	"""
	keyWait
	clearMsg
	"""
	このクニを おそったナビ・・・は
	つぎに・・・を ねらっている・・・
	"""
	keyWait
	clearMsg
	"ヤツらの なは・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"ゴスペル・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	keyWait
	clearMsg
	"は、はやくダレかに・・・つたえてくれ・・・"
	keyWait
	clearMsg
	"""
	こんな・・・おもいは・・・ワシだけで
	じゅう・・
	"""
	waitSkip
		frames = 20
	"・ぶ・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"ん・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotHide
	msgOpen
	flagClear
		flag = 579
	"ガクッ"
	wait
		frames = 90
	clearMsg
	flagSet
		flag = 579
	flagSet
		flag = 648
	jump
		target = 16
}
