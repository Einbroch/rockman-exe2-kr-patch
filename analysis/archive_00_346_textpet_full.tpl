@archive 0795CD0
@size 19

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"!!!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どうしたんだ!? ロックマン?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ね、熱斗くん・・・
	ナニか わからないけど、
	"""
	keyWait
	clearMsg
	flagSet
		flag = 318
	"""
	とてつもなく おおきなチカラが
	ちかづいてくる!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだって?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	すさまじい、いあつかんだ
	ちかいよ!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	どうしたんだよ!
	ロックマン!?
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	あ、あのナビは たしか
	コトブキ町のたたかいで
	たおしたはずの・・・!?
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ね、熱斗くん、このナビは
	あのとき たたかったナビと
	みためは、おなじだけど
	"""
	keyWait
	clearMsg
	"""
	かんじるチカラのはどうは
	まったく べつものだよ
	"""
	keyWait
	clearMsg
	"""
	あのときのヤツより、
	はるかに・
	"""
	wait
		frames = 20
	"・"
	wait
		frames = 20
	"・"
	wait
		frames = 20
	"つよい!!"
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
	プラネットマンたちの
	なかまか!?
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"""
	フン、あんな「じゃくしゃ」どもと
	いっしょにしないでくれ
	"""
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
	じゃ、じゃあ
	おまえは、いったいなにもんだ!?
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"""
	オレのなは、フォルテ
	「きょうしゃ」をもとめ
	でんのうせかいを さまようもの
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"すごい サッキだ!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ああ!
	PETをとおして つたわってくる!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	flagSet
		flag = 318
	wait
		frames = 60
	"""
	かんじるぞ おまえのカラダから
	わきでる「きょうしゃの はどう」を
	"""
	keyWait
	clearMsg
	"""
	これほどの 「はどう」を
	もっているヤツはそうはいない
	"""
	keyWait
	clearMsg
	"すこしは ホネがありそうだな!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! くるよ!!"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	まかせろっ!!
	バトルオペレーション セット!
	"""
	waitSkip
		frames = 30
	keyWait
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"イン!"
	keyWait
	clearMsg
	jump
		target = 18
}
