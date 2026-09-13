@archive 0785E28
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだココ! ヤバいぞ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"てんじょうが せまってきてるんだ!"
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
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"プリンセスさんだ!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	この トラップ! さっき
	ジョンソンさんが やられたのと
	おなじものと おもいます!!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そこの トビラ!"
	waitSkip
		frames = 30
	"""
	
	よこのスイッチに プラグイン したら
	あけられるんじゃない!?
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"それが・・・"
	waitSkip
		frames = 30
	"""
	わたくしの ナイトマンは
	さっき トラップを かいじょするときに
	ダメージを うけてしまったのです・・・
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
	"""
	熱斗くん! ボクなら だいじょうぶ!
	はやく ボクを!!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
