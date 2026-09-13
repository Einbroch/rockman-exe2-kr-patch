@archive 0749404
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkFlag
		flag = 47
		jumpIfTrue = 1
		jumpIfFalse = continue
	flagSet
		flag = 47
	mugshotShow
		mugshot = Dex
	msgOpen
	"まってたぜ! 熱斗!"
	keyWait
	clearMsg
	"""
	このデカオさまが テシオに かけて
	そだてた ガッツマンと
	ネットバトル してみねぇかっ!!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 1 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 31
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	おっ! 熱斗!
	オレさまの ガッツマンと
	やるってのか!?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、デカオくんに
	ネットバトルを もうしこむ?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ\n"
	select
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = 3,
			jump = 4,
			jump = continue
		]
	end
}
script 3 mmbn2 {
	checkFlag
		flag = 9
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkFlag
		flag = 6
		jumpIfTrue = 7
		jumpIfFalse = 15
	end
}
script 4 mmbn2 {
	flagClear
		flag = 44
	flagClear
		flag = 45
	flagClear
		flag = 46
	mugshotShow
		mugshot = Dex
	msgOpen
	"なんだよ つまんねぇのっ!!"
	keyWait
	end
}
script 5 mmbn2 {
	flagClear
		flag = 44
	flagClear
		flag = 45
	flagClear
		flag = 46
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	・・・やっぱり ガッツマンを
	つよくするまで ちょっと まってくれ!
	な? な?
	"""
	keyWait
	end
}
script 6 mmbn2 {
	checkFlag
		flag = 44
		jumpIfTrue = 16
		jumpIfFalse = continue
	checkFlag
		flag = 45
		jumpIfTrue = 17
		jumpIfFalse = continue
	checkFlag
		flag = 46
		jumpIfTrue = 18
		jumpIfFalse = 18
}
script 7 mmbn2 {
	checkFlag
		flag = 316
		jumpIfTrue = 15
		jumpIfFalse = continue
	flagSet
		flag = 316
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	この バトルのために
	きのう かってきた サポートチップ!
	"""
	keyWait
	clearMsg
	"""
	そして・・・ついに かんせいした
	ガッツマンの しんひっさつプログラム
	ロケットガッツパンチを くらいやがれ!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"こんどは まけねぇぜ!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	くっそー!!
	いまのは まちがいだ! きっと そうだ!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	どうだ!
	ガッツマンのつよさ おもいしったか!
	"""
	keyWait
	end
}
script 11 mmbn2 {
	flagSet
		flag = 9
	msgClose
	waitHold
}
script 12 mmbn2 {
	flagSet
		flag = 6
	flagClear
		flag = 44
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 81
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 81
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 8
}
script 13 mmbn2 {
	flagSet
		flag = 7
	flagClear
		flag = 45
	end
}
script 14 mmbn2 {
	flagSet
		flag = 8
	flagClear
		flag = 46
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	ヘッ!!
	まけても なくんじゃねぇぞっ!!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 16 mmbn2 {
	checkFlag
		flag = 6
		jumpIfTrue = 9
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	マジかよ!
	ちょっとは やるじゃねぇか・・・
	"""
	keyWait
	clearMsg
	"いいだろ・・・"
	waitSkip
		frames = 30
	"\nこいつを つかいな!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 17 mmbn2 {
	checkFlag
		flag = 7
		jumpIfTrue = 9
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	チキショー!!
	これでも かなわねえのかよ!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 18 mmbn2 {
	checkFlag
		flag = 8
		jumpIfTrue = 9
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	くっそー!!
	いまのは まちがいだ! きっと そうだ!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 20 mmbn2 {
	checkFlag
		flag = 590
		jumpIfTrue = 0
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dex
	msgOpen
	"え? キャンプ?"
	keyWait
	clearMsg
	"""
	わりい・・・きょうは ダメだ
	かあちゃんに ルスバン
	たのまれちまったんだ・・・
	"""
	keyWait
	clearMsg
	flagSet
		flag = 592
	checkFlag
		flag = 591
		jumpIfTrue = continue
		jumpIfFalse = 21
	checkFlag
		flag = 593
		jumpIfTrue = continue
		jumpIfFalse = 21
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"それは そうと・・・"
	keyWait
	clearMsg
	checkFlag
		flag = 47
		jumpIfTrue = 1
		jumpIfFalse = 0
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	じゆうけんきゅう?
	休みは まだまだ あるんだぜ
	そんなの やってるわけ ねえだろ!!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	おいおい! なんだってんだよ!
	ひとんち あそびにきて
	そんな しんこくなカオ しちゃってよ!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	わかってるだろうな 熱斗!
	アメロッパに 行くってことは、オレに
	みやげを かってくる ってことだぞ!
	"""
	keyWait
	clearMsg
	"""
	・・・ま それは さておきよ!
	いっちょ しょうぶ しようぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 45 mmbn2 {
	checkFlag
		flag = 574
		jumpIfTrue = 48
		jumpIfFalse = continue
	checkItem
		item = 28
		amount = 1
		jumpIfEqual = 46
		jumpIfGreater = 46
		jumpIfLess = continue
	flagSet
		flag = 574
	jump
		target = 48
}
script 46 mmbn2 {
	flagSet
		flag = 574
	itemTake
		item = 28
		amount = 1
	mugshotShow
		mugshot = Dex
	msgOpen
	"よっ、熱斗 アメロッパはどうだった?"
	keyWait
	clearMsg
	"オレにおみやげ? くれるのか?"
	keyWait
	clearMsg
	"""
	おお! これは!
	オレさまが、まえから ほしかった
	
	"""
	printItem
		buffer = 0
		item = 28
	"じゃねえか!"
	keyWait
	clearMsg
	"""
	オレさまの ほしいものを
	ゲットしてくるたあ
	なかなか やるじゃねえか!
	"""
	keyWait
	clearMsg
	"""
	もらいっぱなしも、
	なんか きが ひけるから
	コレをやるぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 47
}
script 47 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 45
		code = D
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 45
	" "
	printCode
		buffer = 0
		code = D
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"熱斗! きこくの きねんに、"
	keyWait
	clearMsg
	"""
	このデカオさまが テシオに かけて
	そだてた ガッツマンと
	ネットバトル してみねぇかっ!!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 50 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"わ!!"
	keyWait
	clearMsg
	"""
	んだ 熱斗かよ・・・
	おどかすんじゃねぇ!
	じしんかと おもったじゃねぇか・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 53 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	じしんも おさまったみたいだし
	ネットバトルなら うけて立つぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 55 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	しみんネットバトラー として
	今 オレが できることは なんだ?
	熱斗が できることは なんだ?
	"""
	keyWait
	clearMsg
	"ふっ・・・"
	waitSkip
		frames = 30
	"""
	
	やっぱ 「コレ」だな!!
	こいよ! 熱斗!!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 220 mmbn2 {
	msgOpen
	"""
	しゅくだいの ドリルが ならんでいる
	しかし、これっぽっちも 手をつけた
	けいせきが ない
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	デカオも ココロを いれかえたのか
	わりと かたづいている
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	すててあるのは、
	おかしの フクロばかりだ・・・
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ニホンのココロ しょうじだ・・・
	よくみると このいえは
	じゅん わふうだ
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	すこし きゅうがたの テレビだ
	うすがた ではないが、
	"""
	keyWait
	clearMsg
	"""
	テレビの上に
	モノを のせられるトコロが
	みりょくだ
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	デカオの パソコンだ
	プラグインできそうだ
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	わだいの しんがたけいたいゲームきだ
	もちろん、プラグインできる
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"わだいの ゲームざっしだ"
	keyWait
	end
}
