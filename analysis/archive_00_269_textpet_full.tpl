@archive 0786DB0
@size 13

script 0 mmbn2 {
	mugshotShow
		mugshot = KnightMan
	msgOpen
	"ムン・・・"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ナイトマンだな!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = KnightMan
	msgOpen
	"""
	そなたに うらみは ないが
	ここで きえてもらう・・・
	"""
	keyWait
	clearMsg
	"""
	ヒメを おまもりするのが
	それがしの やくめ
	"""
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
	だからって こんなこと・・・
	わるいことをしても いいわけじゃない!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = KnightMan
	msgOpen
	"・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	ナイトマン! なにを しているのです!
	ボスのことばを わすれたの?
	"""
	keyWait
	clearMsg
	"""
	オフィシャルを ほろぼすことが
	わがクリームランドの たみの しあわせに
	つながるのです!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"? "
	waitSkip
		frames = 30
	"""
	じじょうは わかんないけど
	こんなやりかたで 手に入れる
	しあわせなんて ないよ!
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
	そうだよ ほんとうに
	みんなが よろこぶと おもってるの?
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = KnightMan
	msgOpen
	"・・・ヒメ"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	なにを ためらっているのです
	ナイトマン!
	"""
	keyWait
	clearMsg
	"""
	あなたは わたくしの メイレイを
	きいていれば いいのです!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = KnightMan
	msgOpen
	"ヒメの メイレイは ぜったい・・・"
	waitSkip
		frames = 30
	"""
	
	それがし じゅうじゅう
	こころえて おります・・・
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
	でも あなたは
	なにか おかしいと かんじてる・・・
	"""
	waitSkip
		frames = 30
	"\nちがいますか?"
	keyWait
	clearMsg
	jump
		target = 12
}
