@archive 077AAD0
@size 14

script 0 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"おそいでガッツ!!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"ロックー! はやくはやくー!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ロールちゃんに ガッツマン!
	いま 行くよ!
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"お! やっと ロックマンが きたか!"
	waitSkip
		frames = 30
	"\nまちくたびれたぞ! 熱斗!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ごめんごめん! メイルもな!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	おそーい!
	もぉ・・・ちゃんと 時間まもってよね!
	"""
	keyWait
	clearMsg
	"""
	わたし かえってすぐ プラグインして、
	ロールを おくりこんで
	ずっと まってたんだからっ
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	わりぃわりぃ!
	ママに つかまっちまってさ・・・
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Mayl
	msgOpen
	"もぉ! 熱斗ったら!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"ロックも 気をつけてねっ"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ごめん ロールちゃん・・・"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"へへっ、おこられてやんの"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ちょっと まってよー、
	そもそも 熱斗くんの せいせきが
	わるいからー・・・
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	おまえら!
	ゴチャゴチャいうのは あとにしろい!
	オレたちは もう行くぜ!
	"""
	keyWait
	clearMsg
	"""
	ガッツマン!
	「しみんネットバトラー」の
	ぼしゅうのこと ききに行こうぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"ガッツで ガス!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ロール! わたしたちも いこ!"
	keyWait
	clearMsg
	jump
		target = 13
}
