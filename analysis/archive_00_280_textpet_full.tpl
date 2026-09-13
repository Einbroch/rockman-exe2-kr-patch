@archive 0788470
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どうしたんですか!?"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	ク、クモに・・・やら・・・れ・・・
	・・・ガクッ
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	ど、どうしよう・・・
	わ、わ、わたし・・・
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、このひこうきに
	おいしゃさんが のっていないか
	さがしにいくぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
