@archive 0788EF8
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	きちょう!
	オレ、しみんネットバトラーです!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"おお、キミが"
	keyWait
	clearMsg
	"""
	いま、うよくエンジンの プログラムに
	バグがはっせいしているんだ
	"""
	keyWait
	clearMsg
	"""
	そのため、さゆうのエンジンの
	バランスがとれなくなって、
	こんなに、ゆれているんだ
	"""
	keyWait
	clearMsg
	"""
	このままでは、
	ついらくしてしまう おそれもある
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
	"""
	オレたちに まかせてください!
	ロックマンいくぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
