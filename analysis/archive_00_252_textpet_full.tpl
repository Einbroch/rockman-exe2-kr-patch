@archive 07845A8
@size 19

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	すげーー!!
	これが アメロッパかぁ!
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
	"ニホンとは ずいぶん ちがうねー"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"おい! ついたゼ ボウズ!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あ ありがと おじさん! じゃあね!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 162
	"ガチャ、"
	wait
		frames = 30
	soundPlay
		track = 162
	"ガチャ"
	wait
		frames = 30
	" "
	soundPlay
		track = 162
	"ガチャ"
	wait
		frames = 10
	soundPlay
		track = 162
	"ガチャ!"
	soundEnableTextSFX
	keyWait
	clearMsg
	soundStop
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	・・・あれ? ドアあかないよ、
	こわれちゃってんじゃない?
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おじさん、きいてる?"
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
	! 熱斗くん、気をつけて!
	この人、ようすが おかしい!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	soundPlayBGM
		track = 14
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	おいっ!! ボウズ!
	イノチが オしけりゃ リュックの中の
	チップを おいていきな!
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
	"なに いってんだよ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ニホンの チップは めずらしいからな
	もっていくとこに もっていきゃ
	いいカネに なるのさ!
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
	"""
	とにかく ヤだ!
	しんでも わたさない!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、がんばれ!
	ここで おれちゃダメだ!!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	チ!
	なかなか こんじょう あるじゃねえか!
	しょうがねえ、力づくで いただくゼ!
	"""
	keyWait
	clearMsg
	textSpeed
		delay = 1
	"そぉるぁーーーー!!!!"
	textSpeed
		delay = 2
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"くそ! やめろ! だめだって!"
	keyWait
	clearMsg
	"わーーーー!!!"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	mugshotPalette
		palette = 1
	msgOpen
	"""
	バカな やつだ!
	力で かなうわけねえだろ!
	"""
	keyWait
	clearMsg
	"""
	リュックの中の チップは いただいたゼ!
	じゃ、あばよ!
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"このやろ! かえせー!!!!"
	keyWait
	clearMsg
	jump
		target = 18
}
