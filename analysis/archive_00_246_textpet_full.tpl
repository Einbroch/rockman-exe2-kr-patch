@archive 0783608
@size 22

script 0 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	soundSetTextSFX
		track = 249
	msgOpen
	"""
	ふん、ダーク・ミヤビのヤツ、
	しょせんは ようへいか・・・
	"""
	keyWait
	clearMsg
	"""
	たたかいに こうふんする あまり、
	しめいの たっせいを
	しくじるとはな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"ハッ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	しかし、オフィシャルごときが
	ここまで やるとは・・・
	"""
	keyWait
	clearMsg
	"""
	おまえの ほうこくとは
	だいぶ ちがうようだな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"もっ、もうしわけありません!"
	keyWait
	clearMsg
	"""
	伊集院炎山、光熱斗、
	ともに マークは していたのですが、
	せいちょうが われわれの よそうを・・・
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"「ゴスペル」オキテ、その2・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ハ! 「ゴスペル」オキテ、その2!
	「べんかいするものには 死を!」
	"""
	keyWait
	clearMsg
	"ハ! し、しかし「かんりにん」サマ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	わかっているとは おもうが、
	「ゴスペル」からは にげられんぞ・・・
	"""
	keyWait
	clearMsg
	"""
	その日まで、
	せいぜい おびえて すごすがいい・・・
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"お、おゆるし・・!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 284
	"ブチ!"
	keyWait
	clearMsg
	soundEnableTextSFX
	soundSetTextSFX
		track = 249
	jump
		target = 9
}
script 9 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタ・・・"
	wait
		frames = 88
	"\n"
	soundEnableTextSFX
	"""
	・・さんの、アクセスが せつだん
	されました・・・
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"フン・・・ ノウナシめが・・・"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタ・・・"
	wait
		frames = 88
	"\n"
	soundEnableTextSFX
	"・・さんが、にゅうしつ されました"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こんばんは
	おそくなりました
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"「プロジェクト」の しんこうは どうだ?"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"じゅんちょうです"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	「プロジェクト」に ひつようなデータは
	ゲット できたのか?
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
	"""
	こんど、それを 手に入れる
	ぜっこうの チャンスが あります
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ふん、じしんが あるようだな"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	それと・・・ジャマものは
	けして ごらんに いれましょう
	"""
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"あいかわらず、ハナシが はやいな"
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"こうえいです"
	keyWait
	clearMsg
	jump
		target = 21
}
