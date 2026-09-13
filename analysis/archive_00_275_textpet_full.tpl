@archive 0787E44
@size 3

script 0 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	おきゃくさまに おつたえします
	さきほど、きたいがエアポケットにはいり
	おおきくゆれましたが、
	"""
	keyWait
	clearMsg
	"""
	きたいは、たいせいを
	たてなおしましたので
	"""
	keyWait
	clearMsg
	"""
	シートベルトをはずしていただいても
	かまいません
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
	"熱斗くん、ゆれがおさまったみたいだね"
	keyWait
	clearMsg
	"""
	もうすぐ、おひるみたいだから
	ちょっとブラブラして
	じかんつぶす?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
