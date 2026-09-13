@archive 0785F94
@size 20

script 0 mmbn2 {
	msgOpen
	soundDisableTextSFX
	"ピピピ!"
	soundEnableTextSFX
	wait
		frames = 60
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"もしもし? だれですか!?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"キャーーーー!!"
	keyWait
	clearMsg
	soundPlayBGM
		track = 14
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"プリンセスさんだ!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	ハァ、ハァ・・・
	なかなか やりますわね!
	"""
	keyWait
	clearMsg
	"""
	でも きずついているとはいえ
	ナイトマンは そうかんたんには
	たおせませんわよ!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	だれか!
	プリンセスの ちかくに いないのか!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	プリンセスさん!
	まだ さっきのところに いるの!?
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"ロイヤルレッキングボール!!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	きづいてないみたい・・・
	きっと でんわのスイッチが ぐうぜん
	入っちゃったんだ
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"・・・!"
	keyWait
	clearMsg
	"""
	ロイヤルレッキングボールが きかない!?
	これが 「ゴスペル」の ナビの力!?
	"""
	keyWait
	clearMsg
	"ナイトマン あぶない!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"ダメーーーーー!!!"
	soundPlay
		track = 237
	wait
		frames = 120
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"・・・熱斗くん"
	keyWait
	clearMsg
	"""
	ネットワークから ナイトマンの
	はんのうが きえちゃった・・・
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちくしょ!!"
	waitSkip
		frames = 30
	"\nプリンセスさんが あぶない!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	flagSet
		flag = 599
	"ゴーーーーーゴゴゴゴゴゴゴゴ!!!!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	soundEnableTextSFX
	"キャーーーーーー!!"
	keyWait
	end
}
script 15 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 288
	flagClear
		flag = 599
	"ゴゴーーーン!!"
	soundEnableTextSFX
	keyWait
	end
}
script 16 mmbn2 {
	msgOpen
	soundDisableTextSFX
	"・・・"
	soundPlay
		track = 260
	"ツー "
	wait
		frames = 57
	soundPlay
		track = 260
	"ツー "
	wait
		frames = 57
	soundPlay
		track = 260
	"ツー"
	wait
		frames = 58
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン! さっきのへやにもどろう!"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"光 ムダだ!"
	waitSkip
		frames = 30
	"\nもう・・・"
	waitSkip
		frames = 30
	"おそい・・・"
	keyWait
	clearMsg
	"""
	のこったメンバーで いっこくも はやく
	「ゴスペル」の ネットバトラーを
	さがし出すんだ
	"""
	keyWait
	clearMsg
	"""
	これいじょう
	ひがいしゃを 出すわけにいかん!
	"""
	keyWait
	clearMsg
	jump
		target = 19
}
