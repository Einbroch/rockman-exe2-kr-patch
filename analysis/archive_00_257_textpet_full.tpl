@archive 0785380
@size 4

script 0 mmbn2 {
	msgOpen
	"そして、あくる日・・・"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おはよ! ロックマン!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	おはよ 熱斗くん!
	きょうは めずらしく はやおきだね!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
