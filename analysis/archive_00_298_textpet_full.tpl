@archive 0789ED8
@size 16

script 0 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ハイジャックじけんから
	すうじつがたったあるひ・・・
	"""
	wait
		frames = 120
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	せんじつの ハイジャックじけんといい
	ネットマフィア「ゴスペル」の
	きょうあくさは ますばかりですね
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ああ、いっこくもはやく、
	ゴスペルのほんきょちを
	みつけ かいめつさせないといけない
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	でも、光さん
	このところ ずっと けんきゅうしつに
	とまりつづき じゃないですか
	"""
	keyWait
	clearMsg
	"""
	たまには きゅうようを とらないと
	おからだに さわりますよ
	"""
	keyWait
	clearMsg
	"""
	熱斗くんにも しばらく
	あってないんじゃ ないですか?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	この いっけんに ケリがついたら
	きゅうかを もらって
	ゆっくり させてもらうよ
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"それがいいですよ・・・"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"じしんだ!! デカいぞ!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"だいじょうぶか?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ええ、ビックリしましたけどね
	じしんなんて ひさしぶりですから
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"おかしいな・・・"
	keyWait
	clearMsg
	"""
	ニホンの じしんは、
	かんきょういじシステムによって
	おさえられているはず・・・
	"""
	keyWait
	end
}
script 10 mmbn2 {
	flagSet
		flag = 519
	mugshotShow
		mugshot = Scientist
	msgOpen
	"きんきゅうけいほうです!!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"よんでくれ!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	アジーナこく、
	ならびにアメロッパこくにおいて
	だいきぼな、さいがいがおきているもよう
	"""
	keyWait
	clearMsg
	"""
	アジーナは、だいこうずい
	アメロッパは、きょうりょくな
	しがいせんによる ひがいです!!
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
	"""
	なんだって?
	おかしい!! そんなはずはない!!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ひがいじょうきょう、
	あっかしていきます!!
	"""
	keyWait
	end
}
