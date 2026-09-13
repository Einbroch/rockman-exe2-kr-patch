@archive 07825AC
@size 13

script 0 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"""
	おともだちの ごとうちゃくだぜ・・・
	ククク・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ブルース・・・!!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	どうやら、こいつが
	オヤダマ らしいな
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"かせいするよ!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	てだし むよう!
	コイツは、オレのエモノだ
	"""
	keyWait
	clearMsg
	"""
	わるいが、
	キサマの みせばはない!
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
	どっちでも いいから
	はやくかかってきな!
	"""
	keyWait
	clearMsg
	"""
	なんなら、
	ふたり がかりでも
	いいんだぜ
	"""
	keyWait
	clearMsg
	"""
	こしぬけくんたち・・・
	オレがこわいのかい?
	ククク・・・
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"くっ! いわせておけば!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	セキュリティのトビラは、
	すでにかいじょした!
	"""
	keyWait
	clearMsg
	"""
	光、おまえはメインシステムを
	しらべてこい!
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
	"""
	なんで、おまえに
	さしず されなきゃ なんないんだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"はやく いけ!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ここはブルースと
	炎山くんに まかせよう!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"わかったよ!"
	keyWait
	clearMsg
	jump
		target = 12
}
