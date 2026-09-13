@archive 07889CA
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	おう、みつかったら
	ワタシのところにもってきてくれ
	"""
	keyWait
	clearMsg
	"たのんだぞ!"
	keyWait
	end
}
