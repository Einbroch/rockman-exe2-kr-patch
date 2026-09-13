@archive 0788C60
@size 8

script 0 mmbn2 {
	mugshotHide
	msgOpen
	"""
	メアカモッサドクグモ ほかく から
	すうじかんご・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"アテンションプリーズ"
	keyWait
	clearMsg
	"""
	じこくは ごぜん5時 ちょうどです
	げんざい じゅんちょうに ひこうを、
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"じゅ、じゅんちょうに・・・"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"じゅ、じゅ、"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"きゃっー!!"
	keyWait
	clearMsg
	"""
	みなさん!
	シートベルトを おしめください!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	flagSet
		flag = 519
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだ、なんだ?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	ひこうきが ゆれてるんだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
