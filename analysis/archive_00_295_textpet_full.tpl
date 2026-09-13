@archive 0789B5C
@size 13

script 0 mmbn2 {
	mugshotShow
		mugshot = MagnetMan
	msgOpen
	"""
	ガウスさま・・・
	もうしわけございません・・・
	"""
	keyWait
	clearMsg
	"ゴスペルに、ひかりあれ!!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = GaussMagnus
	msgOpen
	"あぁ、ワタシのマグネットマンが!"
	keyWait
	clearMsg
	"""
	おのれ!
	ワタシのハイジャックけいかくが
	だいなし じゃないか!!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	「ワタシのハイジャックけいかく?」
	おまえが、はんにんか!?
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = GaussMagnus
	msgOpen
	"し、しまったーーー!!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	このヤロウ!!
	とっつかまえてやる!!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = GaussMagnus
	msgOpen
	"""
	お、おいやめろっ!
	ワタシを だれだとおもっているんだ!!
	"""
	keyWait
	clearMsg
	"わっぷ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	はんにんはつかまえた
	ちゃくりくしだい、
	オフィシャルに、ひきわたすよ
	"""
	keyWait
	clearMsg
	"こっちにこい!!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = GaussMagnus
	msgOpen
	"ひいい~"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おじさん! サンキュー!!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Copilot
	msgOpen
	"""
	ギアプログラム、せいじょうか!
	ギアでます!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	よし、ちゃくりくだ!
	光くん ありがとう!
	"""
	keyWait
	clearMsg
	"はやく、じぶんのせきに!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"わかりました!"
	keyWait
	clearMsg
	"ロックマン、プラグアウトするぞ!"
	keyWait
	clearMsg
	jump
		target = 12
}
