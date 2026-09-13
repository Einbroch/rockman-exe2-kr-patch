@archive 073B130
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
	msgOpen
	"""
	Lボタンを おせば、
	熱斗と ロックマンが かいわできるぞ!
	(ここは まだ入ってません)
	"""
	keyWait
	end
}
script 140 mmbn2 {
	checkChapter
		lower = 34
		upper = 35
		jumpIfInRange = 146
		jumpIfOutOfRange = continue
	checkChapter
		lower = 33
		upper = 33
		jumpIfInRange = 145
		jumpIfOutOfRange = continue
	end
}
script 144 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	くうこうに くると
	「たびだち」って かんじで
	なんか ワクワク するよね?
	"""
	keyWait
	end
}
script 145 mmbn2 {
	checkSubArea
		lower = 2
		upper = 2
		jumpIfInRange = 144
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	りょこうしゃが あつまってきてるね
	さ ボクたちも ひこうきに のるための
	手つづきを しよ!!
	"""
	keyWait
	end
}
script 146 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = continue
		jumpIfFalse = 147
	msgOpen
	"""
	PETが ない・・・
	ロックマンと はなせない・・・
	"""
	keyWait
	end
}
script 147 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! あいたかったよ!
	さぁ! ひこうきに のれば
	いよいよ アメロッパだね!!
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
