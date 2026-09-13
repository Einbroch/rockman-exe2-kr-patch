@archive 077A404
@size 10

script 0 mmbn2 {
	msgOpen
	"""
	デンサンシティ、秋原小学校
	しゅうぎょうしきの 朝・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	今日は まにあったね!
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
	"ハァ・・・ ハァ・・・"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	もうちょっと 早くおきればなぁー、
	のんびり できるのにね!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマンに 言われなくても
	わかってるよ!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"はいはい、それより!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	soundPlayBGM
		track = 3
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うん、今日で 学校はおわり!
	休み たのしみだなー!
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
	"つうちひょうも ね!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん! まかしとけって!"
	keyWait
	clearMsg
	jump
		target = 9
}
