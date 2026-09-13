@archive 0743268
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
	この ちかくだったら いいんだけどな
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
	アメロッパエリアのドコかに
	いるはずなんだけどな
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
