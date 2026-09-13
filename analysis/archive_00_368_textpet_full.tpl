@archive 073A3CC
@size 245

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 240
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 226
		jumpIfOutOfRange = continue
	checkChapter
		lower = 59
		upper = 60
		jumpIfInRange = 220
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 58
		jumpIfInRange = 210
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 200
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 180
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 35
		jumpIfInRange = 140
		jumpIfOutOfRange = continue
	checkChapter
		lower = 29
		upper = 30
		jumpIfInRange = 130
		jumpIfOutOfRange = continue
	checkChapter
		lower = 26
		upper = 28
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	checkChapter
		lower = 25
		upper = 25
		jumpIfInRange = 115
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 24
		jumpIfInRange = 110
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 23
		jumpIfInRange = 105
		jumpIfOutOfRange = continue
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 18
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 14
		upper = 15
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 10
		upper = 13
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	msgOpen
	"""
	Lボタンを おせば、
	熱斗と ロックマンが かいわできるぞ!
	(ここは まだ入ってません)
	"""
	keyWait
	end
}
script 60 mmbn2 {
	checkFlag
		flag = 630
		jumpIfTrue = 67
		jumpIfFalse = continue
	checkFlag
		flag = 629
		jumpIfTrue = 66
		jumpIfFalse = continue
	checkFlag
		flag = 627
		jumpIfTrue = 65
		jumpIfFalse = continue
	checkFlag
		flag = 626
		jumpIfTrue = 64
		jumpIfFalse = continue
	checkFlag
		flag = 624
		jumpIfTrue = 63
		jumpIfFalse = continue
	checkFlag
		flag = 621
		jumpIfTrue = 62
		jumpIfFalse = continue
	checkChapter
		lower = 11
		upper = 11
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
}
script 61 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	キャンプの はじまりだね!
	なんだか ウキウキ しちゃうな!
	"""
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ハチを おいはらわなきゃ
	キャンプじょうに 行けないよ・・・
	"""
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"さ キャンプじょうを めざそう!"
	keyWait
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	クマは さすがに ヤバいよ・・・
	でも キャンプ あきらめるのは
	くやしいね・・・
	"""
	keyWait
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、クマに プラグインして
	きのうを ストップさせよう!
	"""
	keyWait
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"キャンプじょうへ レッツゴー! だよ!"
	keyWait
	end
}
script 67 mmbn2 {
	checkSubArea
		lower = 4
		upper = 4
		jumpIfInRange = continue
		jumpIfOutOfRange = 68
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	まずは バーベキューの じゅんびだね
	みんなを てつだって あげようよ!
	"""
	keyWait
	end
}
script 68 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	みんな バーベキューの じゅんび
	してるのに、ひとりだけ あそんでちゃ
	ダメだよ 熱斗くん?
	"""
	keyWait
	end
}
script 70 mmbn2 {
	checkFlag
		flag = 645
		jumpIfTrue = 72
		jumpIfFalse = continue
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こんなときに
	炎山くん どこ 行ったんだろ!?
	"""
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! きばくそうちを さがし出して
	きばくプログラムを ムコウに
	していこう! いそいで!!
	"""
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、こんかいの じけんの はんにん
	ひょっとして あの人???
	"""
	keyWait
	end
}
script 80 mmbn2 {
	checkFlag
		flag = 538
		jumpIfTrue = 84
		jumpIfFalse = continue
	checkFlag
		flag = 521
		jumpIfTrue = 83
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 82
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 81
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ねぇ、さっそく インターネットから
	アジーナこくに いってみようよ
	"""
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"Aライセンスしけん、うけに 行こ!"
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	オフィシャルセンターの
	いらいけいじばん、みにいこう
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	はやく しけんが、うけられるように
	とくべつにんむを こなそうね
	"""
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、しけん うけにいこうよ"
	keyWait
	end
}
script 90 mmbn2 {
	checkFlag
		flag = 575
		jumpIfTrue = 93
		jumpIfFalse = continue
	checkFlag
		flag = 555
		jumpIfTrue = 92
		jumpIfFalse = continue
	checkFlag
		flag = 553
		jumpIfTrue = 91
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、しけんちゅうなのに
	ドコいくの?
	"""
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	アジーナこくの インターネットって
	どんなのかな?
	"""
	keyWait
	clearMsg
	"はやく みてみたいね"
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	がいこくのインターネットって
	はじめてだから、ワクワクするね
	"""
	keyWait
	end
}
script 93 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ねぇ、アジーナには いかないの?"
	keyWait
	end
}
script 100 mmbn2 {
	checkFlag
		flag = 583
		jumpIfTrue = 102
		jumpIfFalse = continue
	checkFlag
		flag = 582
		jumpIfTrue = 101
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	アジーナで ナニがあったのか
	しらべにいこうよ
	"""
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	アジーナできこえた
	あのカタカタっておと・・・
	"""
	keyWait
	clearMsg
	"なんだったんだろ?"
	keyWait
	end
}
script 102 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	アジーナできいた
	ナゾのおとのしょうたいを
	たしかめにいこうよ
	"""
	keyWait
	end
}
script 105 mmbn2 {
	checkFlag
		flag = 2306
		jumpIfTrue = 108
		jumpIfFalse = continue
	checkFlag
		flag = 596
		jumpIfTrue = 107
		jumpIfFalse = continue
	checkFlag
		flag = 594
		jumpIfTrue = 106
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"パパのところにいかなきゃ"
	keyWait
	end
}
script 106 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"けいじばんに カキコミに 行こうよ"
	keyWait
	end
}
script 107 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"じょうほう あつめしなきゃね"
	keyWait
	end
}
script 108 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"そろそろ、カキコミあったかな?"
	keyWait
	end
}
script 110 mmbn2 {
	checkFlag
		flag = 604
		jumpIfTrue = 112
		jumpIfFalse = continue
	checkFlag
		flag = 605
		jumpIfTrue = 111
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"プログラムに くわしいヒトさがそ"
	keyWait
	end
}
script 111 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 21
	"""
	」、
	どこにあるんだろうね
	"""
	keyWait
	end
}
script 112 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 21
	"""
	」、
	まさか、あそこにあるなんて
	"""
	keyWait
	end
}
script 120 mmbn2 {
	checkFlag
		flag = 622
		jumpIfTrue = 123
		jumpIfFalse = continue
	checkFlag
		flag = 620
		jumpIfTrue = 122
		jumpIfFalse = continue
	checkFlag
		flag = 616
		jumpIfTrue = 121
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	このプログラムで
	ボクのせいのうは、アップするのかな
	"""
	keyWait
	clearMsg
	"はやく、くみこんでもらおう"
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、きんきゅうじたいだよ!
	いそごう!
	"""
	keyWait
	end
}
script 122 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	グズグズしてるヒマはないよ!
	いそごう!
	"""
	keyWait
	end
}
script 123 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	いっこくを あらそうときに
	ドコいくの?
	"""
	keyWait
	end
}
script 130 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ニホンのネットワークしゃかいが
	ききに ひんしてるのに
	ドコいくの!?
	"""
	keyWait
	end
}
script 140 mmbn2 {
	checkChapter
		lower = 33
		upper = 33
		jumpIfInRange = 145
		jumpIfOutOfRange = continue
	checkFlag
		flag = 598
		jumpIfTrue = 143
		jumpIfFalse = continue
	checkFlag
		flag = 514
		jumpIfTrue = 141
		jumpIfFalse = continue
	end
}
script 141 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ここに
	パスポート とりにきたわけじゃ、
	ないよね?
	"""
	keyWait
	end
}
script 143 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	くうこうに 行こう!
	みんなとも しばらく おわかれだね
	"""
	keyWait
	end
}
script 145 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	まさか・・・
	おくデンだにから アメロッパへの
	ひみつつうろが・・・ ないよね
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkFlag
		flag = 574
		jumpIfTrue = continue
		jumpIfFalse = 181
	checkFlag
		flag = 575
		jumpIfTrue = continue
		jumpIfFalse = 181
	checkFlag
		flag = 576
		jumpIfTrue = continue
		jumpIfFalse = 181
	checkFlag
		flag = 577
		jumpIfTrue = continue
		jumpIfFalse = 181
	jump
		target = 182
	end
}
script 181 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	やっと、ニホンにかえってきたね
	みんなに ただいま いいにいこ!
	"""
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ながたびで つかれたでしょ?
	そろそろ ねちゃう?
	"""
	keyWait
	end
}
script 200 mmbn2 {
	checkFlag
		flag = 641
		jumpIfTrue = 207
		jumpIfFalse = continue
	checkFlag
		flag = 640
		jumpIfTrue = 206
		jumpIfFalse = continue
	checkFlag
		flag = 638
		jumpIfTrue = 205
		jumpIfFalse = continue
	checkFlag
		flag = 2309
		jumpIfTrue = 203
		jumpIfFalse = continue
	checkFlag
		flag = 636
		jumpIfTrue = 203
		jumpIfFalse = continue
	checkFlag
		flag = 618
		jumpIfTrue = 202
		jumpIfFalse = continue
	checkItem
		item = 34
		amount = 1
		jumpIfEqual = 201
		jumpIfGreater = 201
		jumpIfLess = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、アジーナエリアに
	ロールちゃんを さがしにいこう!
	"""
	keyWait
	end
}
script 201 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	インターネットで もらった
	こおりの かけら
	パパに みてもらおうよ!
	"""
	keyWait
	end
}
script 202 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	さ、熱斗くん アジーナエリアに
	いそごう!
	ロールちゃんを はやく みつけなきゃ
	"""
	keyWait
	end
}
script 203 mmbn2 {
	checkFlag
		flag = 2821
		jumpIfTrue = continue
		jumpIfFalse = 204
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	インターネットで、いったいなにが
	おこってるのかな?
	どこかで、じょうほうを あつめよう!
	"""
	keyWait
	end
}
script 204 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ヤミいしゃさんを よびだすキーワードか
	ウラスクエアにいけばナニか わかるかな?
	"""
	keyWait
	end
}
script 205 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	アメロッパスクエアにいる
	ムラサキいろの ナビさんか・・・
	ホントに、いるのかな?
	"""
	keyWait
	end
}
script 206 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ムラサキいろの ナビさん、
	インターネットで かいもの
	しているみたいだね
	"""
	keyWait
	end
}
script 207 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	WWW・・・きになるキーワードだね
	なにはともあれ、ウラけいじばんに
	カキコミにいこ!
	"""
	keyWait
	end
}
script 210 mmbn2 {
	checkItem
		item = 38
		amount = 1
		jumpIfEqual = 216
		jumpIfGreater = 216
		jumpIfLess = continue
	checkFlag
		flag = 647
		jumpIfTrue = 215
		jumpIfFalse = continue
	checkFlag
		flag = 645
		jumpIfTrue = 214
		jumpIfFalse = continue
	checkItem
		item = 37
		amount = 1
		jumpIfEqual = 213
		jumpIfGreater = 213
		jumpIfLess = continue
	checkFlag
		flag = 643
		jumpIfTrue = 212
		jumpIfFalse = continue
	checkItem
		item = 36
		amount = 1
		jumpIfEqual = 217
		jumpIfGreater = 217
		jumpIfLess = continue
	checkFlag
		flag = 644
		jumpIfTrue = 211
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ウワサが、ホントなら
	ウラスクエアに、ヤミいしゃさんが
	いるはずなんだけど・・・
	"""
	keyWait
	end
}
script 211 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	printItem
		buffer = 0
		item = 36
	"""
	か、
	ひを おこすプログラムみたいだね
	どこに あるんだろ?
	"""
	keyWait
	end
}
script 212 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ヤミいしゃさんに
	ワクチン つくってもらおうよ
	"""
	keyWait
	end
}
script 213 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ヤミいしゃさんの しりあいのナビ
	さがしに行こ!
	"""
	keyWait
	end
}
script 214 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	カギしょくにんさんを
	さがしにいこ!
	"""
	keyWait
	end
}
script 215 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	カギしょくにんさんの
	おにいさんのトコロに もどろう
	"""
	keyWait
	end
}
script 216 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	のこりの 「あおのかけら」は
	ドコにあるんだろ?
	"""
	keyWait
	end
}
script 217 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、
	ヤミいしゃさんのトコロにいこう!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkFlag
		flag = 650
		jumpIfTrue = 222
		jumpIfFalse = continue
	checkItem
		item = 68
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
		jumpIfLess = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ウラインターネット3に
	つながる べつルートを さがそう
	"""
	keyWait
	end
}
script 221 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	炎山くんのメールに かいてあった
	ルートにいってみようよ!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	まさか、あそこが ゴスペルの
	ほんきょち だったなんて・・・!
	いそごう!!
	"""
	keyWait
	end
}
script 226 mmbn2 {
	checkFlag
		flag = 659
		jumpIfTrue = 227
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	さぁ、熱斗くん
	ウチにかえろ! ママがきっと
	しんぱいしてるよ
	"""
	keyWait
	end
}
script 227 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、今日はもう ねちゃう?"
	keyWait
	end
}
script 240 mmbn2 {
	checkChapter
		lower = 67
		upper = 71
		jumpIfInRange = 244
		jumpIfOutOfRange = continue
	checkChapter
		lower = 66
		upper = 66
		jumpIfInRange = 243
		jumpIfOutOfRange = continue
	checkChapter
		lower = 65
		upper = 65
		jumpIfInRange = 242
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! コトブキスクエア
	もういちど ちょうさ してみよう!
	プラグイン おねがい!!
	"""
	keyWait
	end
}
script 242 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	コトブキ町への 行きかた、
	パパに そうだんしてみよう!
	"""
	keyWait
	end
}
script 243 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	コトブキ町・・・
	ゴスペルの ほんきょちに のりこもう!!
	"""
	keyWait
	end
}
