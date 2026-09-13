@archive 078A1D4
@size 8

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"さっきのじしん、デカかったなぁー"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"じしんなんて ひさしぶり だよね"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ、ちょっと ビックリだな"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、メールだよ"
	keyWait
	clearMsg
	"""
	メイルちゃんからだね、
	なんだろう? ひらいてみるよ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mayl
	mugshotPalette
		palette = 1
	msgOpen
	mugshotAnimate
		animation = 0
	"「さっき、インターネットしてたら\n じしんがおきて・・・"
	keyWait
	clearMsg
	"""
	ロールが インターネットから
	かえってこれなく なっちゃったの
	どうしよう!?
	"""
	keyWait
	clearMsg
	"ぜんぜん れんらくも とれないし・・・"
	keyWait
	clearMsg
	"""
	たぶん、アジーナエリアに
	いると おもうんだけど・・・
	"""
	keyWait
	clearMsg
	"ロールに なにかあったら ワタシ・・・」"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ボク いく!!
	ロールちゃん さがしに いかなくちゃ!!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちょっ・・・"
	waitSkip
		frames = 10
	"\nおちつけって ロックマン、"
	keyWait
	clearMsg
	"""
	えーと、いなくなったのは
	インターネットの アジーナエリアだな
	・・・
	"""
	keyWait
	clearMsg
	"""
	OK! じゃ ロックマン!
	インターネット みにいくぜ!!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
