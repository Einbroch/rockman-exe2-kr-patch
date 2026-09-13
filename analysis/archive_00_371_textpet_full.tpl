@archive 073C27C
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
		upper = 48
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
	msgOpen
	"""
	Lボタンを おせば、
	熱斗と ロックマンが かいわできるぞ!
	(ここは まだ入ってません)
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
	checkFlag
		flag = 531
		jumpIfTrue = 153
		jumpIfFalse = continue
	checkChapter
		lower = 38
		upper = 38
		jumpIfInRange = 152
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
		mugshot = MegaMan
	msgOpen
	"""
	・・・熱斗くん、
	いったん ホテルに 行って
	たいさくを かんがえよう・・・
	"""
	keyWait
	end
}
script 152 mmbn2 {
	msgOpen
	"""
	PETが ないので
	ロックマンとは はなせない
	"""
	keyWait
	end
}
script 153 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマンと なかなおり しよう・・・"
	keyWait
	end
}
script 154 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	パスポートと チップを
	とりかえしに 行こう!
	まずは 手がかりさがし からだね!
	"""
	keyWait
	end
}
script 155 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	パスポート ぜったい とりかえすぞ!
	・・・っと そのまえに ネットに
	アクセス できるように しなきゃね
	"""
	keyWait
	end
}
script 156 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	インターネットに
	パスポート さがしに 行こう!!
	このまま ひき下がれないもんね!!
	"""
	keyWait
	end
}
script 157 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	もっかい ジムのところに 行こ!
	ところで、「
	"""
	printChip
		buffer = 0
		chip = 111
	" "
	printCode
		buffer = 0
		code = *
	"""
	」のこと
	わすれてないよね?
	"""
	keyWait
	end
}
script 158 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	チップを かった
	おカネもちの おばさんか・・・
	それって ボクらのチップだと おもう?
	"""
	keyWait
	end
}
script 159 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	これで いっけんらくちゃく かな?
	かんこうしても ホテルに かえっても
	ボクは どっちでも いいよ
	"""
	keyWait
	end
}
script 165 mmbn2 {
	checkFlag
		flag = 566
		jumpIfTrue = 175
		jumpIfFalse = continue
	checkChapter
		lower = 45
		upper = 45
		jumpIfInRange = 174
		jumpIfOutOfRange = continue
	checkFlag
		flag = 562
		jumpIfTrue = 173
		jumpIfFalse = continue
	checkChapter
		lower = 44
		upper = 44
		jumpIfInRange = 172
		jumpIfOutOfRange = continue
	checkFlag
		flag = 601
		jumpIfTrue = 171
		jumpIfFalse = continue
	checkFlag
		flag = 559
		jumpIfTrue = 170
		jumpIfFalse = continue
	checkFlag
		flag = 557
		jumpIfTrue = 169
		jumpIfFalse = continue
	checkChapter
		lower = 43
		upper = 43
		jumpIfInRange = 168
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 7
		upper = 8
		jumpIfInRange = 167
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 6
		upper = 6
		jumpIfInRange = 166
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	かいぎって 世界から ネットバトラーが
	あつまって きてるんだよね!
	たのしみだね!
	"""
	keyWait
	end
}
script 166 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こんなところに
	かいぎじょうが あるなんてね・・・
	ね、みんなと ハナシを してみよっ
	"""
	keyWait
	end
}
script 167 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ここから だっしゅつして
	そして ゴスペルの ネットバトラーを
	たおさなきゃ!
	"""
	keyWait
	end
}
script 168 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	このままじゃ おしつぶされちゃうよ!
	熱斗くん! はやく プラグインッ!!
	"""
	keyWait
	end
}
script 169 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	プリンセスさん 気になるけど・・・
	だっしゅつして ゴスペルの
	ネットバトラーを たおさなきゃ!!
	"""
	keyWait
	end
}
script 170 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	プリンセスさん まで・・・
	こんなことを するヤツ、
	ボクは ゆるさない!!
	"""
	keyWait
	end
}
script 171 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ゴスペルの ネットバトラーは
	ボクたちの 中にいる・・・
	熱斗くん しんじられる?
	"""
	keyWait
	end
}
script 172 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	だいじょうぶ!
	ワイヤレスプラグが ささってるから
	ボク ここから プラグインできるよ!
	"""
	keyWait
	end
}
script 173 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	とにかく・・・
	炎山くんを 見つけて・・・
	そして ちゃんと はなしあってみよう
	"""
	keyWait
	end
}
script 174 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ボクたちを だましていた「アイツ」・・・
	だれだか たしかめに 行こう!
	"""
	keyWait
	end
}
script 175 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! プラグインを!!
	みんなのためにも まけられないよ!!
	"""
	keyWait
	end
}
script 180 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	さ、熱斗くん
	くうこうに むかおう!
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
