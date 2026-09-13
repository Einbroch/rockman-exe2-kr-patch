@archive 0781544
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	コクホウヲ、オイテ タチサレ!!
	タチサラヌノナラ
	"""
	keyWait
	clearMsg
	"ウイルスヲ ケシカケルマデ!"
	keyWait
	clearMsg
	jump
		target = 1
}
