@archive 078248C
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ブルース!!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	こんかいの じけんは、炎山さまと、
	このブルースが かいけつする!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"・・・炎山!!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	まさか ちょくせつ
	マザーコンピュータ を
	ねらってくるとはな・・・
	"""
	keyWait
	clearMsg
	"""
	このじけんは
	オフィシャルネットバトラーに
	まかせてもらおう
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なに いってんだ!
	そんなコト いってる
	ばあいじゃないだろ!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"ブルース! いくぞ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"はっ!"
	keyWait
	flagSet
		flag = 636
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! ボクたちもいこう!"
	keyWait
	clearMsg
	jump
		target = 8
}
