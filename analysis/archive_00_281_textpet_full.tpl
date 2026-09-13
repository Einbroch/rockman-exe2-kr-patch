@archive 0788510
@size 13

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おいしゃさん、つれてきたよ!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"ふぅ、これでよしっと。"
	keyWait
	clearMsg
	soundPlayBGM
		track = 11
	jump
		target = 2
}
script 2 mmbn2 {
	flagSet
		flag = 520
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"もう、だいじょうぶなんですか・・・?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	よしと、いっても ニホンにつくまで
	ぜったいあんせいだ
	"""
	keyWait
	clearMsg
	"""
	みたところ、なにかのドクによる
	ショックじょうたい だとおもうんだが
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"カレ、さっき クモにさされたって・・・"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ドクグモが きないにいるだって?
	なんで、きゃくにしらせないんだ!?
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	ごめんなさい!
	だって、ドクがあるなんて
	しらなかったし・・・
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	・・・・・・
	いま、スチュワーデスさんをせめても
	しかたない
	"""
	keyWait
	clearMsg
	"""
	とにかく、いっこくもはやく
	ドクグモをつかまえなくては!
	"""
	keyWait
	clearMsg
	"""
	といっても、ワタシはかんじゃを
	みないといけないし・・・
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"オレが つかまえてきます!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"キミが・・・か?"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	だいじょうぶだって!
	まかせてよ!
	ムシにくわしいヒトもしってるし
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	わかった、キミにまかせよう!
	あと、ほかのじょうきゃくに
	きづかれないようにしてくれ
	"""
	keyWait
	clearMsg
	"""
	ドクグモが、きないにいると
	わかったら、パニックじょうたいに
	なるだろう
	"""
	keyWait
	clearMsg
	"""
	そうなったら、ケガにんが
	なんにん でるかわからない
	だから、しんちょうにな!
	"""
	keyWait
	clearMsg
	"""
	ワタシはおくのヘヤで かんじゃを
	みているから!
	"""
	keyWait
	clearMsg
	"よろしく たのんだよ!"
	keyWait
	clearMsg
	jump
		target = 12
}
