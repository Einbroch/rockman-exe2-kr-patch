@archive 0788E54
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	おきゃくさまのなかに、
	ネットバトラーのかたは おられませんか?
	"""
	keyWait
	clearMsg
	"""
	おられましたら、しきゅうコクピットまで
	おこしください
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
	"きいた!? 熱斗くん!?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なにかあったみたいだな!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"いこう! コクピットへ!"
	keyWait
	clearMsg
	jump
		target = 4
}
