@archive 077B004
@size 14

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"メール?"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"えーと、オートでんわ みたい・・・"
	waitSkip
		frames = 30
	"\nだれかな・・・"
	keyWait
	clearMsg
	"""
	あ、やいとちゃんの ナビの
	グライドさんだ! 
	"""
	waitSkip
		frames = 30
	"""
	どうしたんですか?
	そんなに あわてて・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	soundPlayBGM
		track = 13
	mugshotShow
		mugshot = Glide
	msgOpen
	"""
	タ、タイヘンなんです!!
	やいとサマが!
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
	"やいとが どうかしたのか?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Glide
	msgOpen
	"""
	オフロに ハイったまま
	デてこないのです!
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
	"のんびり してるだけじゃないの?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Glide
	msgOpen
	"""
	そんなコトは ありません
	やいとサマは すぐ オフロに
	のぼせるのです
	"""
	keyWait
	clearMsg
	"""
	それに、オフロの ガスゆわかしきの
	チョウシも おかしいようで・・・
	ワタシ シンパイなんです!
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
	"ねえ、バグですか? "
	waitSkip
		frames = 30
	"それとも・・・"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Glide
	msgOpen
	"""
	クワしいコトは まだわからないのです
	でも ガスゆわかしきの ケイホウオンが
	ナっています!
	"""
	keyWait
	clearMsg
	"""
	ワタシは モドって
	ガスゆわかしきの プログラムを
	シラべてみます
	"""
	keyWait
	clearMsg
	"""
	熱斗さん、やいとサマを
	タスけに キてクダさい!
	"""
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗 きいた!?"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ! やいとのことだろ?"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	デカオくんにも こえかけたんだけど・・・
	ね?
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	わかってる!
	今から やいとのとこに 行く!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
