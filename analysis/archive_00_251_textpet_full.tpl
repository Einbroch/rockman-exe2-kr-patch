@archive 0784330
@size 15

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	いよいよ このむこうは アメロッパかー
	どんなまち なのかなー?
	"""
	keyWait
	clearMsg
	"""
	で ロックマン、
	まちまで どうやって 行くんだっけ?
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
	"んとね・・・バスが 出てるはずだよ"
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
	オッケー!
	じゃ、そとに出て さがしてみるか!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ハイ、ガイ!!
	ゲンキか ボウズ!!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだ なんだ?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"ボウズ どこ行くんだい?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"まちに 行くんだけど"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	オレと おなじじゃねぇか ボウズ!
	ついでだから オレの クルマに
	のっけてってやるゼ!
	"""
	keyWait
	clearMsg
	"ボウズ! おまえは ラッキーガイだな!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	いや、でも オレ
	バスで 行こうと・・・
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	なにいってんだ ボウズ!
	バスは ゼニーが かかるじゃねぇか!
	こっちは タダだゼ!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うーん・・・ロックマン どうおもう?
	なんか あやしくないか?
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	・・・でもー、
	ホントに しんせつな人 かもしれないし
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ドン ウォーリー!!
	オレに まかせときな!
	"""
	keyWait
	clearMsg
	"じゃ、キマリだな! レッツゴー ガイ!"
	keyWait
	end
}
script 13 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 162
	"ガチャ!"
	wait
		frames = 30
	" "
	soundPlay
		track = 287
	"バタン!"
	wait
		frames = 30
	soundEnableTextSFX
	keyWait
	clearMsg
	jump
		target = 14
}
