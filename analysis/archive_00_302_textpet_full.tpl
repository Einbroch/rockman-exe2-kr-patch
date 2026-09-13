@archive 078AA44
@size 7

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"それじゃ、キーワードを かきこむよ"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"たのむ"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"「WWW」"
	keyWait
	clearMsg
	"熱斗くん、かきこんだよ!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	こんなコトできてくれるのか?
	それとも、ホントにウワサだけなのか?
	"""
	keyWait
	clearMsg
	"""
	でも、ウワサのとおりだとすると
	キーワードをかきこむと、
	"""
	keyWait
	clearMsg
	"""
	ウラスクエアのどこかにあらわれる
	ってハナシだしな・・・
	ウラスクエアをさがしてみるか
	"""
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
	たんなる ウワサじゃなきゃ
	いいんだけどね
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
	"それじゃ、みにいくか!"
	keyWait
	clearMsg
	jump
		target = 6
}
