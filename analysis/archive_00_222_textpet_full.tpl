@archive 0780A6C
@size 16

script 0 mmbn2 {
	mugshotHide
	msgOpen
	"""
	アジーナこく かいめつから
	すうじかんご・・・
	"""
	wait
		frames = 90
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"アジーナこくより にゅうでん!"
	keyWait
	clearMsg
	"""
	ゴスペルを なのる
	なぞの ナビの こうげきにより・・・
	"""
	keyWait
	clearMsg
	"アジーナスクエアは・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"\nかいめつ しました!!!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"なに!?"
	keyWait
	clearMsg
	"""
	アジーナこくの セキュリティは、
	世界でも トップクラスの はずだぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	アジーナスクエアを
	かいめつさせる チカラを もつ
	ゴスペルの ナビか・・・
	"""
	keyWait
	clearMsg
	"キケンだな・・・"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタ・・・"
	wait
		frames = 88
	soundPlay
		track = 282
	"ピピッ"
	controlUnlock
	soundEnableTextSFX
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ひきつづき
	アジーナこくより にゅうでん!
	"""
	keyWait
	clearMsg
	"""
	アジーナこくを おそった ナビの
	つぎの ターゲットは・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"!!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	どうした!
	つづきを よまんか!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	flagSet
		flag = 579
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ア、アジーナこくを おそったナビの
	つぎの ターゲットは・・・!!
	"""
	keyWait
	clearMsg
	"ニホン!・・・です"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"なっ、なにっ!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・・・しつれいします"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"伊集院くん、どこに行くんだ!?"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	ちょうさですよ
	ここで 手を こまねいている
	じかんは ない・・・
	"""
	waitSkip
		frames = 30
	"ちがいますか?"
	keyWait
	end
}
script 12 mmbn2 {
	flagSet
		flag = 591
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	伊集院くんが いうとおりだな、
	そうきゅうに 手を うとう
	"""
	keyWait
	clearMsg
	"""
	ワタシは、そのナビに たいこうできる
	きょうりょくな ぶきプログラムを
	つくる!
	"""
	keyWait
	clearMsg
	"""
	みなは、
	ぜんこくの オフィシャルネットバトラーに
	れんらくを!
	"""
	keyWait
	clearMsg
	"""
	がいぶからの ハッキングに たいして
	げんかいたいせいを とって下さい!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	flagClear
		flag = 580
	flagClear
		flag = 591
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	よし! ぜんこくの
	オフィシャルネットバトラーに
	れんらくしろ!
	"""
	keyWait
	clearMsg
	"だいいっしゅ げんかいたいせい だ!!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	flagClear
		flag = 579
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だいいっしゅ げんかいたいせい!"
	keyWait
	clearMsg
	jump
		target = 15
}
