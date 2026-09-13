@archive 078D354
@size 11

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ここを なおせば
	マンションの さいじょうかいに
	たどりつけるはず!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"たのむぜ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"あ!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	おまえたち!
	どうして ここに!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = AirMan
	msgOpen
	"ロックマン.EXE デリート"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = QuickMan
	msgOpen
	"デリート!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = CutMan
	msgOpen
	"デリート・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	どうやら
	はなしても ムダみたいだな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん、たぶん じどうプログラムで
	せいぎょされてる・・・
	"""
	keyWait
	clearMsg
	"""
	熱斗くん、ボクなら だいじょうぶだよ!
	もう ヤツらの データは
	アタマに 入ってるから!!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"まとめて あいてしてやるか!"
	keyWait
	clearMsg
	"""
	いくぞロックマン!
	トリプルバトルオペレーション セット!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
