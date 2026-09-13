@archive 078948C
@size 15

script 0 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"こうどがあがってきたぞ!!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ついらくの ききは、まぬがれたか・・・"
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
	きちょう、あと5ふんで
	デンサンくうこうです
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"よし、ちゃくりくたいせいに はいれ!!"
	keyWait
	clearMsg
	"""
	まだ、ナニが おこるかわからん!
	ゆだんするなよ!!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	ラジャー! ・・・
	きちょう・・・
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"どうした!?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	soundPlayBGM
		track = 14
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	ギアせいぎょプログラムに
	いじょうはっせい!
	ギアがでません・・・
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"なに!?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ギアって!?"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	タイヤのコトだ!
	ギアがでないとなると
	どうたいちゃくりく するしかない
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どうたいちゃくりく!?"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	つまり、タイヤをださずに
	きたいをちょくせつじめんに
	おろすんだよ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	しっぱいすれば・・・
	だいさんじだ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	ギアせいぎょプログラムに
	いってくれ!!
	"""
	keyWait
	clearMsg
	"""
	このままじゃ、
	タイヘンなコトになる!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
