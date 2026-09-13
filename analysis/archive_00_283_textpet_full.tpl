@archive 07889F4
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	おじさん、しかけのざいりょう
	ぜんぶあつまったよ!!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	ついにあつまったか
	それじゃ、ワナをしかけにいくか
	"""
	keyWait
	clearMsg
	"""
	しかし、クモがいまどのへんに
	いるのかな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"キャッ"
	keyWait
	clearMsg
	soundPlayBGM
		track = 14
	flagSet
		flag = 520
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"!?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	いま、なにかクロいモノが
	ファーストクラスのほうに
	はしっていったわ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
