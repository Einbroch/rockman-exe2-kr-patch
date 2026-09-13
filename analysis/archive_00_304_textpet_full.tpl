@archive 078AD10
@size 12

script 0 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	グググ ヌカッたわ!!
	ウワサにはキいていたが
	コレホドのモノとは・・・!
	"""
	keyWait
	clearMsg
	"""
	だが、オレなどタンなる
	ジカンカセぎにスギん!!
	"""
	keyWait
	clearMsg
	"""
	イマごろ ゴスペルほんぶで
	ワレらの サイコウシレイカン
	"""
	keyWait
	clearMsg
	"""
	フリーズマンさまが
	セカイのハメツにムケ
	チャクジツにウゴいておられる!!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	やい! ゴスペルほんぶってのは
	ドコなんだ!?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"ククク、オシえてやろう・・・"
	keyWait
	clearMsg
	"ワレらがほんぶは・・・"
	keyWait
	clearMsg
	"コトブキスクエアだ!!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	なんだって?
	コトブキスクエア・・・?
	そんなトコロにあったなんて!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	タトえ ほんぶに タドりツけたとしても
	フリーズマンさまのテにカカれば
	キサマなど・・・
	"""
	keyWait
	clearMsg
	"""
	フリーズマンさまぁぁぁぁぁ!
	グ、グワアアアアア!
	"""
	keyWait
	flagSet
		flag = 519
	end
}
script 5 mmbn2 {
	mugshotHide
	msgOpen
	"ゴスペルのナビがナニかをおとした!"
	keyWait
	clearMsg
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
		item = 39
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 1
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"これで「あおのかけら」は2つ・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、ゴスペルほんぶに
	むかうぞ!!
	"""
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
	ちょっとまって、熱斗くん
	まだ、ナニかおちてるみたいだよ
	"""
	keyWait
	clearMsg
	"なんだろう? ゲットするよ"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
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
		item = 40
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 1
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	これは、ゴスペルの
	かいいんしょうみたいだね
	"""
	keyWait
	clearMsg
	"""
	さぁ、熱斗くん いこう!
	ゴスペルほんぶに!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
