@archive 077A298
@size 11

script 0 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	soundSetTextSFX
		track = 249
	msgOpen
	"""
	・・・さま、
	ついに・・・の けんきゅうが
	さいしゅう・・・に 入り・・・した
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ずいぶん時間・・・ かかったな・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"もうしわけ ・・・せん"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	ふん・・・ ・・・おくれだ
	バツ・・・!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"ハッ! ・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ともかく・・・ ジッコウせよ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	では、われわれ・・・
	WWWと 同じ・・・
	・・・世界せいふく・・・!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	おろかもの・・・!
	WWWごとき・・・ あまい・・・
	わが「・・・・」を ・・・するな!
	"""
	keyWait
	clearMsg
	"・・・プロジェ・・・ かいしせよ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = SternMan
	mugshotPalette
		palette = 1
	msgOpen
	"ハッ! "
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"・"
	keyWait
	end
}
