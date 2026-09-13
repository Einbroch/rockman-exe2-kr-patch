@archive 078706C
@size 12

script 0 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	そんな・・・
	ナイトマンが まけるなんて・・・
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
	"熱斗くん、トラップのスイッチ きるね!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ! たのむ!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"OK!"
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"""
	よし!
	これで もう だいじょうぶのはず!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"よくも やってくれましたわね!"
	keyWait
	clearMsg
	"""
	いいですわ! ナイトマンなど いなくても
	わたくし ひとりで トラップを
	うごかしてみせますわ!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 219
	"パパパッ "
	soundPlay
		track = 254
	"パパパパパピポ"
	soundEnableTextSFX
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	ふふふふっ!
	みんな ほろびてしまうがいいのです!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん 気をつけて!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"だっしゅつしよう!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"あっ!!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"キャーーーーー!"
	keyWait
	end
}
