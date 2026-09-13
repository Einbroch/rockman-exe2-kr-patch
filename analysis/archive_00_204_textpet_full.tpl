@archive 077E378
@size 16

script 0 mmbn2 {
	mugshotShow
		mugshot = QuickMan
	msgOpen
	"グァ・・・"
	waitSkip
		frames = 20
	"だが!"
	keyWait
	clearMsg
	"""
	オレの デリートは
	ただの デリート ではない!
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
	"!?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	つまりね! クイックマン そのものが
	きばくプログラム なんだよ!
	"""
	keyWait
	clearMsg
	"""
	クイックマンが デリートされれば
	じどうてきに ダムの バクダンが
	バクハツ するんだ!
	"""
	keyWait
	clearMsg
	"""
	もう いいや
	みんな いっしょに
	水に のみこまれちゃおうよ!
	"""
	keyWait
	clearMsg
	"クイックマン、かくごは いいかい!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = QuickMan
	msgOpen
	"かけぬけた 人生に まんぞく!\n"
	flagSet
		flag = 649
	"3!"
	wait
		frames = 60
	" 2!"
	wait
		frames = 60
	" 1!"
	wait
		frames = 60
	end
}
script 4 mmbn2 {
	soundStop
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマーーン!"
	waitSkip
		frames = 60
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	textSpeed
		delay = 15
	"・・・"
	textSpeed
		delay = 2
	"あれ? "
	waitSkip
		frames = 15
	"ダムが バクハツして、"
	waitSkip
		frames = 15
	"\nオレたち・・"
	waitSkip
		frames = 15
	"水に のまれたんじゃ・・・"
	waitSkip
		frames = 15
	"\nないのか?"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ブルース!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	炎山さまの めいに より
	ブルース、けんざん!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"光、生きてるなら へんじしな"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"フッ・・・まにあった ようだな"
	keyWait
	clearMsg
	"""
	ダムの バクダンは オレと ブルースが
	すべて しょりをした
	"""
	keyWait
	clearMsg
	"そいつのナビも しにぞん てわけだ"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"アンビリーバブル! "
	waitSkip
		frames = 30
	"""
	IQ170、
	ゴスペル かんぶこうほの このボクが
	こども2人に やられるなんて!
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	フン、170ていどの IQで
	じまんされても こまるが・・・
	"""
	keyWait
	clearMsg
	"""
	「速見ダイスケ」、ダムばくは ようぎ
	オフィシャルネットバトラーけんげん で
	タイホ する!!
	"""
	keyWait
	clearMsg
	"""
	すぐに オフィシャルポリス が
	とうちゃく する
	"""
	keyWait
	clearMsg
	"""
	とりしらべで ゴスペルとの かんけいを
	あらいざらい はくじょう してもらう!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"くっ・・・"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"これで もう、おまえら・・・"
	waitSkip
		frames = 15
	"\nそして キャンプにつきあう りゆうもない"
	waitSkip
		frames = 15
	"\nじゃあな"
	keyWait
	clearMsg
	"ブルース! プラグアウトだ"
	keyWait
	clearMsg
	jump
		target = 15
}
