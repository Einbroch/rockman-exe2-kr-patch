@archive 0789D48
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	アテンションプリーズ
	ながらくの ごとうじょう
	おつかれさまでした
	"""
	keyWait
	clearMsg
	"""
	ほんきは、もくてきち
	デンサンくうこうに
	ちゃくりくいたしました
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
	"熱斗くん、おてがらだったね"
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
	ロックマンこそ、おつかれ!
	さあ、ニホンについたし、
	秋原町にかえろうぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
