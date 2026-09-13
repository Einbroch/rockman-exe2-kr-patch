@archive 0781700
@size 29

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"パパ、プログラム、もってきたよ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	おお 熱斗、
	すまなかったな
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
	このプログラム、アジーナスクエアに
	あったんだけど、
	"""
	keyWait
	clearMsg
	"""
	どうやら、もちだしたら
	いけないモノだったみたいなんだ
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	そうか、あとでパパが
	アジーナスクエアに てんそう
	しておくよ
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	さっそく、このプログラムを
	くみこんで、と
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタカタカタ・・・"
	wait
		frames = 84
	controlUnlock
	soundEnableTextSFX
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	よし できた!
	あたらしい、プログラムが
	かんせいしたぞ!!
	"""
	keyWait
	flagSet
		flag = 591
	clearMsg
	"熱斗、PETをかしてくれないか?"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	flagClear
		flag = 591
	"はい、パパ"
	keyWait
	clearMsg
	flagSet
		flag = 591
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ロックマン、ちょっとイタイ
	かもしれないけど、
	ガマンだぞ
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"はい"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"しんプログラム インストール"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタカタカタ・・・"
	wait
		frames = 85
	controlUnlock
	soundEnableTextSFX
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ウグッ・ググググググ・・・ッ"
	keyWait
	end
}
script 13 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタカタカ・・・"
	wait
		frames = 85
	controlUnlock
	soundEnableTextSFX
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"もうすこしだ がんばれ!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"は・・・はい・・・っ"
	keyWait
	end
}
script 16 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタカタカタ・・・"
	wait
		frames = 85
	controlUnlock
	soundEnableTextSFX
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"インストールかんりょう!"
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
	だいじょうぶか!?
	ロックマン?
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
	だいじょうぶ みたいだけど・・・
	インストールまえと
	あんまりかわらない みたいだ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	いま、インストールした プログラムは
	ロックマンを つよくする
	タネ のようなものだ
	"""
	keyWait
	clearMsg
	"""
	ロックマンの けいけんを
	えいようにして め をだすんだ
	"""
	keyWait
	clearMsg
	"""
	いつ め がでるかわからないが
	その、め がでたとき、
	"""
	keyWait
	clearMsg
	"""
	ロックマンは、あたらしいちからを
	える ことが できるだろう!
	"""
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ありがとう、パパ!"
	keyWait
	end
}
script 22 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	"ビー"
	soundPlay
		track = 209
	wait
		frames = 54
	"ビー"
	soundPlay
		track = 209
	wait
		frames = 54
	"ビー"
	soundPlay
		track = 209
	"!!"
	wait
		frames = 54
	soundEnableTextSFX
	keyWait
	end
}
script 23 mmbn2 {
	mugshotHide
	msgOpen
	flagClear
		flag = 591
	"""
	オフィシャルスクエアに
	なにものかが しんにゅうした もよう!
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"まさか、れいのナビが・・・!!"
	keyWait
	clearMsg
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"いこう! 熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 26
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おう!"
	keyWait
	clearMsg
	flagSet
		flag = 591
	jump
		target = 27
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	熱斗!
	ぜったいに ムリはするな!
	"""
	keyWait
	clearMsg
	jump
		target = 28
}
