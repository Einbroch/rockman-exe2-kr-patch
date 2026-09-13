@archive 078ECB4
@size 10

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん・・・"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ、ついに ここまで きたな"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"これが・・・"
	waitSkip
		frames = 30
	"\n「きゅうきょくのナビ」 フォルテ・・・"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"・・・"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"さあ フォルテよ!"
	waitSkip
		frames = 30
	"""
	
	プロジェクトを じっこうし
	世界を わがものと するのだ!
	"""
	keyWait
	clearMsg
	"まず てはじめに・・・"
	waitSkip
		frames = 30
	"""
	
	おまえの 目のまえにいる ナビを
	デリート するんだ!!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"・・・わかった"
	waitSkip
		frames = 30
	"\n・・・たたかいなら オレに まかせろ"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どうやら おめざめ みたいだぜ・・・"
	waitSkip
		frames = 30
	"\nロックマン!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん ボクは いつでも!!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"OK! じゃ いくぜ!"
	waitSkip
		frames = 30
	"\nバトルオペレーション! セット!"
	keyWait
	clearMsg
	jump
		target = 9
}
