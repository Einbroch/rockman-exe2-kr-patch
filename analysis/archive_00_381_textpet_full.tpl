@archive 073EF6C
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
		lower = 48
		upper = 55
		jumpIfInRange = 180
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 45
		jumpIfInRange = 165
		jumpIfOutOfRange = continue
	checkChapter
		lower = 36
		upper = 41
		jumpIfInRange = 150
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
	checkChapter
		lower = 9
		upper = 9
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	checkChapter
		lower = 8
		upper = 8
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 7
		upper = 7
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 5
		upper = 6
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 4
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 3
		upper = 3
		jumpIfInRange = 21
		jumpIfOutOfRange = continue
	checkChapter
		lower = 2
		upper = 2
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	checkChapter
		lower = 0
		upper = 1
		jumpIfInRange = 5
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
script 15 mmbn2 {
	checkFlag
		flag = 524
		jumpIfTrue = 16
		jumpIfFalse = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	はやいとこ
	オフィシャルスクエア 行かなきゃな!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	オフィシャルスクエアで、
	「しみんネットバトラー」の しけん
	うけるんだったっけ・・・
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 1
	"""
	」 と
	「
	"""
	printItem
		buffer = 0
		item = 2
	"""
	」 か・・・
	たのんだぜ! ロックマン!
	"""
	keyWait
	end
}
script 21 mmbn2 {
	checkItem
		item = 1
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 20
	checkItem
		item = 2
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 20
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	よっしゃ!
	しけんかんの ナビのとこ もどろ!
	"""
	keyWait
	end
}
script 25 mmbn2 {
	checkFlag
		flag = 535
		jumpIfTrue = 26
		jumpIfFalse = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	サブライセンスも ゲットできたし
	きょうは てきとうで かえろーぜ
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やっぱ やいとんち 行かなきゃ!"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"こんなことしてちゃ ヤバいか?"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	きょう しないと いけないことは
	もう とくには ないかな
	"""
	keyWait
	end
}
script 45 mmbn2 {
	checkFlag
		flag = 597
		jumpIfTrue = 51
		jumpIfFalse = continue
	checkFlag
		flag = 596
		jumpIfTrue = 48
		jumpIfFalse = continue
	checkFlag
		flag = 590
		jumpIfTrue = 46
		jumpIfFalse = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	インターネットも いいけど
	みんなを キャンプに さそうのを
	わすれないように しなきゃな・・・
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ライセンスしけん うけるには まずオレが
	マリンハーバーの オフィシャルセンターに
	行かなきゃな
	"""
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	しけん うけるには しけんかいじょうから
	プラグイン したほうが
	よかったんじゃねぇか?
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	しけん うけるには、やっぱり
	しけんかいじょう から
	プラグイン しないと ダメかな・・・
	"""
	keyWait
	end
}
script 55 mmbn2 {
	checkItem
		item = 59
		amount = 1
		jumpIfEqual = 57
		jumpIfGreater = 57
		jumpIfLess = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"サクっと しけん クリアしようぜ!"
	waitSkip
		frames = 30
	"""
	
	オフィシャルスクエアの しけんかんナビに
	いわれた モンダイ、おぼえてるよな?
	"""
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	あしたは キャンプだし
	きょうは たっぷり ねるぞーー!
	"""
	keyWait
	end
}
script 60 mmbn2 {
	checkFlag
		flag = 630
		jumpIfTrue = 67
		jumpIfFalse = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じぶんから さそっといて
	キャンプ ぶっち するのは
	やっぱ マズいかな?
	"""
	keyWait
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そろそろ プラグアウトして
	キャンプに もどろっか?
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
		mugshot = Lan
	msgOpen
	"""
	インターネット やってる
	ばあいじゃ ないか!?
	"""
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	インターネットなんか してたら
	バクダンが バクハツ しちまうっ!
	いったん プラグアウトしよう!
	"""
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	キャンプじょうで
	はんにん さがさなきゃ!
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
		mugshot = Lan
	msgOpen
	"""
	めざすは インターネット、
	アジーナエリアだぜ!
	"""
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ライセンスしけん、うけにいくか!"
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	いらいを うけて
	けいけん つまなくちゃな
	"""
	keyWait
	clearMsg
	"""
	さすがは Aライセンス、
	ひとすじなわでは いかないぜ
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	さ、ロックマン サクサク にんむを
	かたずけて、しけんうけにいこうぜ!
	"""
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"しけん うけにいこうぜ!"
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
		mugshot = Lan
	msgOpen
	"ガリッとしけんを クリアするぜ!"
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"これで、アジーナにいけるな!"
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	アジーナエリア・・・
	がいこくの インターネットかぁ
	なんか、きんちょうするな
	"""
	keyWait
	end
}
script 93 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	アジーナスクエアって
	どんなトコロ なんだろな
	"""
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
		mugshot = Lan
	msgOpen
	"アジーナスクエアで なにがあったんだ?"
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	アジーナスクエアできいた
	あの おと・・・
	"""
	keyWait
	clearMsg
	"きになるな・・・"
	keyWait
	end
}
script 102 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	アジーナスクエアの
	あの へやのなか・・・
	"""
	keyWait
	clearMsg
	"ぜったい ダレかいたよな・・・"
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
		mugshot = Lan
	msgOpen
	"やっぱ、はやくパパのトコにいこうぜ"
	keyWait
	end
}
script 106 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じょうほうけいじばんか・・・
	いい じょうほうが、
	てにはいると いいんだけどな
	"""
	keyWait
	end
}
script 107 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じょうほうしゅうしゅう
	しないとな
	"""
	keyWait
	clearMsg
	"""
	するんだったら
	やっぱ、ヒトがあつまるところだな
	"""
	keyWait
	end
}
script 108 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そろそろ、カキコミ
	あったんじゃないか?
	"""
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
		mugshot = Lan
	msgOpen
	"""
	ゆうりょくな
	じょうほうがもらえたな
	けいじばん さまさまだぜ
	"""
	keyWait
	end
}
script 111 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	いろんな じょうほうを
	あしがかりに、しないとな
	"""
	keyWait
	end
}
script 112 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 21
	"""
	」が、
	まさか あそこにあったとはな
	ゲットしにいこうぜ!
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
		mugshot = Lan
	msgOpen
	"パパんトコ もどるぞ!"
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	まさか、もう、ニホンに
	しんにゅうしているなんて
	いそぐぞ!
	"""
	keyWait
	end
}
script 122 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	オフィシャルセンターがあぶない
	ロックマン、いそごう!
	"""
	keyWait
	end
}
script 123 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じゅんびが ととのったら
	いそいで、マザーコンピュータに
	もどらなきゃな
	"""
	keyWait
	end
}
script 130 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じゅんびがととのったら
	すぐにもどるぞ!
	"""
	keyWait
	end
}
script 140 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	インターネット、てきとうに きりあげて
	アメロッパに 行かなきゃな
	"""
	keyWait
	end
}
script 150 mmbn2 {
	checkChapter
		lower = 41
		upper = 41
		jumpIfInRange = 159
		jumpIfOutOfRange = continue
	checkFlag
		flag = 542
		jumpIfTrue = 158
		jumpIfFalse = continue
	checkChapter
		lower = 40
		upper = 40
		jumpIfInRange = 157
		jumpIfOutOfRange = continue
	checkFlag
		flag = 68
		jumpIfTrue = 156
		jumpIfFalse = continue
	checkFlag
		flag = 536
		jumpIfTrue = 155
		jumpIfFalse = continue
	checkChapter
		lower = 39
		upper = 39
		jumpIfInRange = 154
		jumpIfOutOfRange = continue
	checkChapter
		lower = 37
		upper = 37
		jumpIfInRange = 151
		jumpIfOutOfRange = continue
	end
}
script 151 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なんだか つかれちゃった・・・
	とりあえず ホテル 行くか・・・
	"""
	keyWait
	end
}
script 154 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	手がかり ナシで
	パスポートと チップを さがすのは
	やっぱ むずかしいな・・・
	"""
	keyWait
	end
}
script 155 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	あれ? いきなり プラグインしちゃ
	ダメ なんだっけか?
	"""
	keyWait
	end
}
script 156 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	パスポート さがしに 行こうぜ!
	ロックマンを ひどい目に あわせたナビを
	とっちめてやろう!
	"""
	keyWait
	end
}
script 157 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	もっかい
	あのジムって チビのところに
	行くか・・・
	"""
	keyWait
	end
}
script 158 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	チップを とりかえす・・・
	こんどは げんじつで おばさん?
	を さがすんだよな・・・
	"""
	keyWait
	end
}
script 159 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	がいこくの でんのう世界って
	やっぱ てごわいよな
	そう おもわねえ??
	"""
	keyWait
	end
}
script 165 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	かいぎ すっぽかしちゃ
	やっぱ マズいよな?
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 181
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	さ、じゅんびが できたら
	くうこうに むかうか
	"""
	keyWait
	end
}
script 181 mmbn2 {
	checkFlag
		flag = 574
		jumpIfTrue = continue
		jumpIfFalse = 182
	checkFlag
		flag = 575
		jumpIfTrue = continue
		jumpIfFalse = 182
	checkFlag
		flag = 576
		jumpIfTrue = continue
		jumpIfFalse = 182
	checkFlag
		flag = 577
		jumpIfTrue = continue
		jumpIfFalse = 182
	jump
		target = 183
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ひととおり まわったら
	みんなの トコロに
	ただいま いいに いくか
	"""
	keyWait
	end
}
script 183 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	さて、きょうは もう つかれたから
	ひとまわりしたら ねよっかな
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
		mugshot = Lan
	msgOpen
	"""
	はやく、ロールを みつけなきゃな・・・
	それにしても、インターネットで
	なにが、おこっているんだ?
	"""
	keyWait
	end
}
script 201 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	コトブキエリアで もらった
	こおりの かけら いったいなんなんだ?
	パパなら わかるかな?
	"""
	keyWait
	end
}
script 202 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、アジーナエリアに
	むかうぞ!
	ロールを さがしにいかないとな!
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
		mugshot = Lan
	msgOpen
	"""
	ドコかで、じょうほうをあつめないと
	うごきようが ないな・・・
	じょうほうのあつまるトコロといえば・・・
	"""
	keyWait
	end
}
script 204 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ヤミいしゃを よびだすキーワード・・・
	ウラスクエアにいけば、
	じょうほうが、えられるかもしれないな
	"""
	keyWait
	end
}
script 205 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	キーワードをしっているナビは、
	アメロッパスクエアに いるんだな
	"""
	keyWait
	end
}
script 206 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	キーワードを しっているナビは、
	インターネットで かいものちゅうか・・・
	ドコのショップだろ?
	"""
	keyWait
	end
}
script 207 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	WWW・・・まさかな・・・
	さ、ロックマン!
	ウラけいじばんに カキコミにいくぞ
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
		mugshot = Lan
	msgOpen
	"""
	ロックマン いっちょ、ヤミいしゃを
	おがみにいくか!
	"""
	keyWait
	end
}
script 211 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	printItem
		buffer = 0
		item = 36
	"""
	か、
	ひを おこすプログラムだな・・・
	どこにあるんだ?
	"""
	keyWait
	end
}
script 212 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	やっぱり、コオリをこわす
	ワクチンは ひつようだよな・・・
	"""
	keyWait
	end
}
script 213 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ヤミいしゃの 知りあい・・・
	たしか、アメロッパエリアにいるって
	いってたな
	"""
	keyWait
	end
}
script 214 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	よし、カギしょくにんナビを
	さがしにいくか
	"""
	keyWait
	end
}
script 215 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	カギしょくにんナビの
	にいさんのトコロに もどろうぜ
	"""
	keyWait
	end
}
script 216 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	のこりの 「あおのかけら」は
	ドコにあるんだ?
	"""
	keyWait
	end
}
script 217 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、
	ヤミいしゃのトコロにいくぞ!
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
		mugshot = Lan
	msgOpen
	"""
	ウラインターネット3に
	つながる べつルートをさがすぞ!
	"""
	keyWait
	end
}
script 221 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	炎山からの メールに たしか
	ウラインターネットに つながる ルートが
	どうしたって かいてあったな
	"""
	keyWait
	end
}
script 222 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	ゴスペルの ほんきょちに のりこむぜ!!
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
		mugshot = Lan
	msgOpen
	"""
	さ、ロックマン
	ウチにかえろうぜ!
	"""
	keyWait
	end
}
script 227 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"今日は もう ねちゃうか"
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
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	コトブキスクエアへ いそいでくれ!
	"""
	keyWait
	end
}
script 242 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	コトブキ町で なにが おきてるんだろう?
	・・・まずは パパに そうだんだな
	"""
	keyWait
	end
}
script 243 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じゅんびが ととのったら・・・
	コトブキ町へ のりこむぜ ロックマン!!
	"""
	keyWait
	end
}
