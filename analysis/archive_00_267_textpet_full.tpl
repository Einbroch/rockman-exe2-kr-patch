@archive 07868B4
@size 20

script 0 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	炎山、ごめん
	オレ ブルースを・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・・・よわいな"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	オレの よわさが
	ブルースを デリートさせてしまった
	"""
	keyWait
	clearMsg
	"""
	おまえを 100% にくむことが
	できていたなら・・・
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"えんざん・・・"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	あくにんに かけられる
	なさけなど むよう!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山! それは ごかいだよ!"
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"う・うう・・・"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"!!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	熱斗くんの いうとおり・・・だ
	「ゴスペル」は キミたちの
	どちらでもない
	"""
	keyWait
	clearMsg
	"ほんとうの はんにんは あいつだ・・・"
	keyWait
	clearMsg
	soundPlayBGM
		track = 13
	"""
	あいつは 「ゴスペル」に
	やられてなんか いなかった・・・
	"""
	waitSkip
		frames = 30
	"\nオレたちは だまされていたんだ・・・"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"しかし!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"わたしを しんじてくれ・・・"
	keyWait
	clearMsg
	"""
	あいつは
	この上に のぼっていっ・・・
	"""
	waitSkip
		frames = 30
	"グフッ!!"
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ラウルさん!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	とんだ ちゃばんだったようだな・・・
	スマン・・・光
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ううん
	オレだって おまえのことを・・・
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そうだ! 「ゴスペル」の ネットバトラー
	たおしに いかなくちゃ!
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"ここは まかせてくれ"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	"""
	ブルース なきいま、「ゴスペル」を
	たおせるのは おまえしかいない・・・
	"""
	keyWait
	clearMsg
	"たのんだぞ・・・"
	keyWait
	clearMsg
	jump
		target = 19
}
