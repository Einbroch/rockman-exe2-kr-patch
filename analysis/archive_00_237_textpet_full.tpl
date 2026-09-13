@archive 0781C54
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"パパ! マザーコンピュータは!?"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	なにものかが しんにゅう したみたいだ
	こんなに はやく やってくるとは・・・!
	"""
	keyWait
	clearMsg
	"""
	ナゾのナビ げきたいようの ぶきも
	まだ かんせいしていない というのに
	・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	パパ、オレたちが いくよ!
	そのあいだに パパは
	ぶきを かんせいさせて!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"わかった!"
	keyWait
	clearMsg
	"""
	のこった オフィシャルネットバトラーも
	すでに うごいているんだ
	ちからを かしてやってくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
