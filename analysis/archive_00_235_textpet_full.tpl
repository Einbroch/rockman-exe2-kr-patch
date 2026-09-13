@archive 0781B28
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	おまえが アジーナスクエアを
	メチャクチャにした ナビか!?
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ククク・・・
	オフィシャルの ヤツラも
	みんなして バカばかり だな・・・
	"""
	keyWait
	clearMsg
	"""
	シャドーマンたいちょう は
	イマごろ オフィシャルセンターの
	マザーコンピュータの ナカだぜ
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
	"しまった! ようどうさくせんか!"
	keyWait
	clearMsg
	jump
		target = 3
}
