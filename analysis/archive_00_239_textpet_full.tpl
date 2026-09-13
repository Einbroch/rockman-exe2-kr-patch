@archive 0781DEC
@size 25

script 0 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	セキュリティ システムが、
	やられてるみたいだな・・・
	"""
	keyWait
	clearMsg
	"""
	パスワードを入力しないと
	トビラをひらくことはできないな・・・
	"""
	keyWait
	clearMsg
	flagSet
		flag = 626
	"ん? 光さんのムスコさんじゃないか\n"
	flagSet
		flag = 627
	flagSet
		flag = 628
	"どうして こんなところに?"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"オレにも てつだわせてください!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	キミが きてくれると
	ひじょうに、こころづよいな!
	"""
	keyWait
	clearMsg
	"""
	でも、ここは おじさんたちに
	まかせてもらおう!
	"""
	keyWait
	clearMsg
	"""
	オフィシャルのじつりょくを
	みせてあげよう!!
	"""
	keyWait
	clearMsg
	"おまえたち! いくぜ!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ハイ!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"ラジャー!"
	keyWait
	clearMsg
	flagClear
		flag = 626
	flagClear
		flag = 627
	flagClear
		flag = 628
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"プラグイーン!!"
	keyWait
	end
}
script 6 mmbn2 {
	flagClear
		flag = 626
	flagClear
		flag = 627
	flagClear
		flag = 628
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"さぁ、すすむぞ!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	えぇっと・・・
	ここのパスワードは、と・・・
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"オフィシャル・ビィィィィィム!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"よーし、あと ひといきだ!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ハイ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"ラジャー!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	うん!? なんだコイツ!
	ウイルスじゃないぞ!
	おまえたち てを かしてくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ハイ!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"ラジャー!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 275
	"バキ!"
	wait
		frames = 16
	" "
	soundPlay
		track = 276
	"ゲシッ!"
	wait
		frames = 15
	" "
	soundPlay
		track = 277
	"ドリュッ!"
	wait
		frames = 14
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	このままじゃ、ヤバいわ!
	アレをつかって!! アレよ!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 278
	"ビシビシッ!"
	wait
		frames = 19
	" "
	soundPlay
		track = 275
	"ガキッ!"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	ひぃぃぃぃっさぁぁぁつ!!
	オフィシャル・デ・バルバロッサ・
	デンジャラス・キャノーーーン!!
	"""
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 237
	"ボギャーーン!"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 20
}
script 20 mmbn2 {
	flagSet
		flag = 626
	flagSet
		flag = 627
	flagSet
		flag = 628
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"デリートかんりょう!"
	keyWait
	flagClear
		flag = 626
	flagClear
		flag = 627
	flagClear
		flag = 628
	end
}
script 21 mmbn2 {
	flagSet
		flag = 626
	flagSet
		flag = 627
	flagSet
		flag = 628
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	どうだい! おじさんたちの
	うでまえ!
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Lan
	"さすがは、オフィシャルだね!"
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"トビラがひらくぞ!"
	keyWait
	flagClear
		flag = 626
	flagClear
		flag = 627
	flagClear
		flag = 628
	end
}
