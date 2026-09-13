@archive 077FB64
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ライセンスしけん、うけにきました"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	いらっしゃいませ
	それでは、さっそく
	じゅけんトウロク しましょう
	"""
	keyWait
	clearMsg
	"アナタ、おなまえは?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ロックマン.EXEです"
	keyWait
	clearMsg
	jump
		target = 3
}
