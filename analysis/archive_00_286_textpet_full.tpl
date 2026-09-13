@archive 0788D70
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"きちょう!!"
	keyWait
	clearMsg
	"""
	うよくエンジン、いじょうはっせい!!
	バグのようです!
	"""
	keyWait
	clearMsg
	"""
	こちらからの、にゅうりょくを
	いっさいうけつけません!!
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
	"きないネットバトラーをよべ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	それが、ドクグモさわぎのときに、
	ドクグモにさされたのが、
	ネットバトラーでありまして・・・
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
