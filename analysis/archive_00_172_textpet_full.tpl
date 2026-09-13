@archive 077B3EC
@size 13

script 0 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 255
	"バタンッ! ガチャ!"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"え? トビラのロックが かかったよ?"
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
	やいとー! デカオー!
	へんじしろー!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"まって! 熱斗くん!? このニオイ!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ほんとだ! クサい!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	これ ガスだ!
	たいへんだよ! きっと ふたりとも
	ガスに やられたんだよ!
	"""
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
	おまけに とじこめられて
	だっしゅつふかのう っていうわけか・・・
	あやしいな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ガスを すったら、
	熱斗くんだって あぶないよ
	ちょっと まって・・・
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 259
	"テカテカテカテカ"
	wait
		frames = 30
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	おまたせ! PETに
	ガスチェックきのうを くみこんだよ!
	これで画面に ガスがひょうじされるはず!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"サンキュ!"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うん、これで
	ガスをすわずに うごけそうだ!
	2人を さがしに行こう!
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
