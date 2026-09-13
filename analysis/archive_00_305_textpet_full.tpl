@archive 078AFB0
@size 11

script 0 mmbn2 {
	mugshotShow
		mugshot = FreezeMan
	msgOpen
	"""
	よくココまでたどりついたな
	さすがだといっておこう
	ロックマン.EXE
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"おまえはダレだ!?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = FreezeMan
	msgOpen
	"""
	ワタシは、
	ゴスペルさいこうしれいかん
	フリーズマンだ
	"""
	keyWait
	clearMsg
	"""
	こんかいの「ぶんめいはかい さくせん」は
	ワタシが しきしたものだ
	"""
	keyWait
	clearMsg
	"""
	まもなく、このホシぜんたいを
	しんど10の だいじしんがおそう
	"""
	keyWait
	clearMsg
	"""
	ほろびゆく せかいを
	ココから たかみのけんぶつと
	いこうじゃないか
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
	そんなコトは させないぞ!!
	さぁ、「あおのかけら」をわたすんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = FreezeMan
	msgOpen
	"""
	フフフ、それはムリな そうだんだな
	インターネットに、バラまいてある
	こおりは ワタシのぶんしん、
	"""
	keyWait
	clearMsg
	"""
	そして、ワタシじしんが3つめの
	「あおのかけら」なのだからな!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんだって?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"て コトは、つまり・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = FreezeMan
	msgOpen
	"そうだ!"
	keyWait
	clearMsg
	"""
	ワタシをたおさなくては
	せかいの、めつぼうをとめるコトは
	できないのだよ
	"""
	keyWait
	clearMsg
	"""
	どうしても、せかいのめつぼうを
	とめようとおもうのならば、
	"""
	keyWait
	clearMsg
	"かかってこい! ロックマン!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、オペレーションおねがい!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	まかせろ!
	このクニを、このせかいを まもるんだ!
	"""
	keyWait
	clearMsg
	"""
	いくぞ! ロックマン!
	バトルオペレーション
	セット!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
