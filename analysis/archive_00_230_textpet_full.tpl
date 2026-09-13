@archive 0781590
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	コクホウニ テヲカケル
	オロカモノヨ!!
	"""
	keyWait
	clearMsg
	"""
	ユルサジ!
	ウイルスニ ムシバマレルガヨイ!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
