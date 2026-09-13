@archive 0782C84
@size 24

script 0 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"""
	よもや、せっしゃ が
	やぶれるとは・・・!
	"""
	keyWait
	clearMsg
	"ダーク・ミヤビさま・・・"
	keyWait
	clearMsg
	"むねん!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	くるしい・・・
	たたかい だったね
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
	だいじょうぶか!?
	ロックマン!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ぼくよりも・・・
	ブルースがしんぱいだよ!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	炎山!!
	ブルースは!?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・・・・・・"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	flagSet
		flag = 576
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	伊集院くん、みせてごらん
	ブルースは かなりのキズを
	おっているはずだ
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	・・・けっこうです
	ブルースは、オレがみます
	"""
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山・・・"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	flagClear
		flag = 576
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ロックマン、メインシステムは
	いじょうないか?
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"いじょうナシ!"
	soundPlayBGM
		track = 7
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	flagSet
		flag = 642
	mugshotShow
		mugshot = Dad
	msgOpen
	"ふたりとも、よくやったぞ!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	オレたちだけじゃ かてなかったよ
	炎山と、ブルース
	"""
	keyWait
	clearMsg
	"""
	それと、オフィシャルの
	おじさんたち、おじさんたちのナビ
	"""
	keyWait
	clearMsg
	"""
	みんなのチカラがあったから
	かてたんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"フフッ"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そうだ! パパ!
	オレたちのために
	オフィシャルの おじさんたちのナビが
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	だいじょうぶ、パパが
	バックアップデータを
	さいせいして おいたから
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	flagClear
		flag = 642
	mugshotShow
		mugshot = Lan
	msgOpen
	"パパ、ありがとう!!"
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	そうだ、熱斗
	パパ、こんばん
	ウチにかえれそうだから
	"""
	keyWait
	clearMsg
	"""
	ひさしぶりに、
	いっしょに フロでもはいるか!
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	いいよ!
	フロくらい ひとりではいれるよ
	"""
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ホントはうれしいくせに
	テレちゃって、もう
	"""
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちがうってば!"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	熱斗も、もう11さいだもんな!
	ハハハハハハ
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"さ、ウチにかえるか!"
	keyWait
	clearMsg
	"ロックマン、プラグアウトだ!"
	keyWait
	clearMsg
	jump
		target = 23
}
