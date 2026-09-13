@archive 0787F4C
@size 8

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ふぅ~くった、くった
	あ~っ もうくえない!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"よくたべたね~ 熱斗くん"
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
	ここの きないしょく
	おもったより、ウマかったから・・・
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotHide
	msgOpen
	"10ぷんご・・・"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"う、うぐぐ・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"どうしたの? 熱斗くん?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ハ・ハラが・・・
	いててて・・・
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
