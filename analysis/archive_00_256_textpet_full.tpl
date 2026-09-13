@archive 0785248
@size 7

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	これが
	ボクたちの ほんとうの力 だ!
	"""
	keyWait
	clearMsg
	"""
	さあ!
	熱斗くんの パスポートを かえせ!!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"わぁったよ・・・"
	waitSkip
		frames = 30
	"\nカエします カエせば いいんだろ・・・"
	keyWait
	clearMsg
	"ほらよっつーノ"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotHide
	msgOpen
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 23
	"""
	」
	を ふたたび ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"シット! くそっ! おぼえてロっつーの!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ! やったな!"
	keyWait
	clearMsg
	jump
		target = 6
}
