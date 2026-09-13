@archive 0789110
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"これで、まずはひとあんしん・・・"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	きちょう!
	びよくプログラムに いじょうはっせい!
	コントロールがききません!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	なんだって!?
	びよくのコントロールがきかない?
	そうじゅうふのう になってしまうぞ!
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
	ロックマン、いそいで
	びよくプログラムにいってくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
