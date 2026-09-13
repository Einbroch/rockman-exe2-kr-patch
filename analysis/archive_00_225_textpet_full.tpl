@archive 0781274
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	じょうほうを もとめる
	カキコミをしよう!
	なんて かきこむ?
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そだな・・・"
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 21
	"""
	」さがしてます
	じょうほう まってます
	ロックマン.EXE
	"""
	keyWait
	clearMsg
	"じゃ、これで!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"OK、かきこんだよ!"
	keyWait
	clearMsg
	"""
	あとは、じょうほうが くるのを
	まつだけだね
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
	"どれくらい まつんだ?"
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
	そんなに スグ へんじが
	くるわけないじゃない
	たんきは ソンきだよ!
	"""
	keyWait
	clearMsg
	"""
	オフィシャルスクエアのなかで
	じょうほうしゅうしゅうして
	じかんをつぶそう
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
