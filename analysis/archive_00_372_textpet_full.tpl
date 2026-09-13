@archive 073CDB4
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
	msgOpen
	"""
	Lボタンを おせば、
	熱斗と ロックマンが かいわできるぞ!
	(ここは まだ入ってません)
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 193
		jumpIfOutOfRange = continue
	checkFlag
		flag = 567
		jumpIfTrue = 187
		jumpIfFalse = continue
	checkFlag
		flag = 566
		jumpIfTrue = 199
		jumpIfFalse = continue
	checkFlag
		flag = 565
		jumpIfTrue = 198
		jumpIfFalse = continue
	checkFlag
		flag = 553
		jumpIfTrue = 197
		jumpIfFalse = continue
	checkFlag
		flag = 551
		jumpIfTrue = 196
		jumpIfFalse = continue
	checkFlag
		flag = 549
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 545
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 539
		jumpIfTrue = 191
		jumpIfFalse = continue
	checkFlag
		flag = 536
		jumpIfTrue = 190
		jumpIfFalse = continue
	checkFlag
		flag = 537
		jumpIfTrue = 189
		jumpIfFalse = continue
	checkFlag
		flag = 535
		jumpIfTrue = 188
		jumpIfFalse = continue
	checkFlag
		flag = 534
		jumpIfTrue = 186
		jumpIfFalse = continue
	checkFlag
		flag = 531
		jumpIfTrue = 185
		jumpIfFalse = continue
	checkFlag
		flag = 530
		jumpIfTrue = 183
		jumpIfFalse = continue
	checkFlag
		flag = 524
		jumpIfTrue = 182
		jumpIfFalse = continue
	checkSubArea
		lower = 4
		upper = 4
		jumpIfInRange = 181
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	それじゃ、コクピットを
	みせてもらいにいこうよ!
	"""
	keyWait
	end
}
script 181 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	きちょうさんに、
	なかを みせてもらえるように
	おねがいしよう
	"""
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	いろんなヒトと、ハナシを してみよ!
	たびは みちづれ っていうでしょ
	"""
	keyWait
	end
}
script 183 mmbn2 {
	checkSubArea
		lower = 0
		upper = 0
		jumpIfInRange = 184
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	あんなに、たべるからだよ!
	たしか トイレは、
	いちばん うしろにあったよね
	"""
	keyWait
	end
}
script 184 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ホラ、熱斗くん トイレがあるよ!
	ちゃんと ノックしてから はいろうね
	"""
	keyWait
	end
}
script 185 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、「ムシに くわしいヒト」
	っていったら・・・
	"""
	keyWait
	end
}
script 186 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	さけびごえ? うしろのほうから
	きこえたよ
	熱斗くん、いってみよう!
	"""
	keyWait
	end
}
script 187 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	じゅんびが、ととのったら
	ギアせいぎょプログラムに
	むかおう!
	"""
	keyWait
	end
}
script 188 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、じょうきゃくのなかに
	おいしゃさん、いなかった?
	"""
	keyWait
	end
}
script 189 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	さぁ、熱斗くん、
	かんじゃさんの トコロに!
	"""
	keyWait
	end
}
script 190 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	クモをつかまえる・・・
	そうだ、熱斗くん!
	あのヒトに そうだんしよう!
	"""
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ひつような どうぐを はやくあつめないと
	つぎの ぎせいしゃが でるかもしれないよ
	"""
	keyWait
	end
}
script 192 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、
	はやく ファーストクラスに!
	クモを つかまえよう!
	"""
	keyWait
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、おつかれさま!
	さ、秋原町にかえってみんなに
	ただいま いいに いこ!
	"""
	keyWait
	end
}
script 194 mmbn2 {
	checkSubArea
		lower = 4
		upper = 4
		jumpIfInRange = 195
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	はやく、コクピットにいこう!
	きんきゅう じたい だよ!
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	きちょうさんの トコロに!
	はやく!
	"""
	keyWait
	end
}
script 196 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	じゅんびが、ととのったら
	うよくエンジンプログラムに
	むかおう!
	"""
	keyWait
	end
}
script 197 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	じゅんびが、ととのったら
	びよくプログラムに
	むかおう!
	"""
	keyWait
	end
}
script 198 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	じゅんびが、ととのったら
	きあつちょうせいプログラムに
	むかおう!
	"""
	keyWait
	end
}
script 199 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	じゅんびが、ととのったら
	スロットルプログラムに
	むかおう!
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
