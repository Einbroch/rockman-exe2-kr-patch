@archive 0791900
@size 4

script 0 mmbn2 {
	msgOpen
	"わが さばき・・・"
	waitSkip
		frames = 30
	"\nうけるが いい・・・"
	keyWait
	flagSet
		flag = 591
	flagSet
		flag = 594
	end
}
script 2 mmbn2 {
	mugshotHide
	msgOpen
	"""
	フン・・・ここにも
	まだ できそこないが いたか・・・
	"""
	keyWait
	end
}
