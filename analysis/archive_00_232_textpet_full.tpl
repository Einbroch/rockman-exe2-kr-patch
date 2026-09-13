@archive 078161C
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ヌスットヨ
	ココガ キサマノ
	ハカバ ダ!
	"""
	keyWait
	clearMsg
	"""
	ウイルス ノ サバキヲ
	ウケヨ!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
