@archive 078AB54
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	したのフロアにいるナビ、
	どうやってシタに おりたんだろ?
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ん? あ~!! オマエは!
	ゴスペル ブラックリストにノっている
	ロックマンとかイう コゾウ!!
	"""
	keyWait
	clearMsg
	"""
	さては、オレの カンリする
	「あおのかけら」を
	ウバいに キたんだな!?
	"""
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
	「あおのかけら」それって
	「あおワクチン」の もとじゃないのか?
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	「あおのかけら」がほしけりゃ
	ココまできな!!
	"""
	flagSet
		flag = 519
	wait
		frames = 60
	keyWait
	clearMsg
	"""
	まぁ、ココに タドりツいたとしても
	オマエには、ヤれねえけどな!
	"""
	keyWait
	clearMsg
	"""
	ワレワレの「ぶんめい はかいさくせん」も
	あとワズかで カンセイする!
	"""
	keyWait
	clearMsg
	"""
	オマエは ユビをクワえて
	セカイが ホウカイするサマを
	ミているがイイ!
	"""
	keyWait
	clearMsg
	"ヒャハハー!!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、あのナビ 「アオのかけら」を
	もっているみたいだよ!!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
