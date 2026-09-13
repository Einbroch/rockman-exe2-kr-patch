@archive 077F838
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	あ、あの!
	Aライセンスの しけんを
	うけたいんですけど!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
