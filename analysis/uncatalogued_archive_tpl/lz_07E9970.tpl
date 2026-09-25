@archive 07E9970
@size 119

script 0 mmbn2 {
	checkFlag
		flag = 3200
		jumpIfTrue = 68
		jumpIfFalse = continue
	checkFlag
		flag = 3264
		jumpIfTrue = 69
		jumpIfFalse = continue
	msgOpenQuick
	"とても こまっています"
	keyWait
	clearMsg
	"""
	くわしい ハナシは
	ここでは、カキコミにくいので
	ちょくせつ おはなしします
	"""
	keyWait
	clearMsg
	"""
	ウイルスバスティングに
	じしんの あるかたおねがいします
	"""
	keyWait
	clearMsg
	"""
	秋原町のえきまえで まっています
	どうぞ、よろしく
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 64,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 1 mmbn2 {
	checkFlag
		flag = 3201
		jumpIfTrue = 70
		jumpIfFalse = continue
	checkFlag
		flag = 3265
		jumpIfTrue = 71
		jumpIfFalse = continue
	msgOpenQuick
	"""
	とても かんたんなシゴトです
	まずは、コトブキスクエアに
	いらしてください!
	"""
	keyWait
	clearMsg
	"""
	チョット、にんそうのワルいナビが
	あなたを おまちしております
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 65,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 2 mmbn2 {
	checkFlag
		flag = 3202
		jumpIfTrue = 72
		jumpIfFalse = continue
	checkFlag
		flag = 3266
		jumpIfTrue = 73
		jumpIfFalse = continue
	msgOpenQuick
	"""
	まいごの プログラム
	さがしてください!
	"""
	keyWait
	clearMsg
	"""
	くわしいコトは、
	おくデンだにキャンプじょう にて
	"""
	keyWait
	clearMsg
	"""
	川の まんなかに 立って
	まっています
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 66,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 3 mmbn2 {
	checkFlag
		flag = 3203
		jumpIfTrue = 89
		jumpIfFalse = continue
	checkFlag
		flag = 3267
		jumpIfTrue = 90
		jumpIfFalse = continue
	msgOpenQuick
	"""
	しんせきの おんなのコが
	どこかにいっちゃったの
	どなたかさがしてくれませんか?
	"""
	keyWait
	clearMsg
	"秋原町のがっこうでまってます"
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 74,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 4 mmbn2 {
	checkFlag
		flag = 3204
		jumpIfTrue = 91
		jumpIfFalse = continue
	checkFlag
		flag = 3268
		jumpIfTrue = 92
		jumpIfFalse = continue
	msgOpenQuick
	"うみのみえるカフェで まっています"
	keyWait
	clearMsg
	"""
	いらいないようは、
	そこでおしらせします
	"""
	keyWait
	clearMsg
	"""
	たしょうキケンをともなうので
	あるていど つよいナビを
	おもちのかた、よろしく
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 75,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 5 mmbn2 {
	checkFlag
		flag = 3205
		jumpIfTrue = 93
		jumpIfFalse = continue
	checkFlag
		flag = 3269
		jumpIfTrue = 94
		jumpIfFalse = continue
	msgOpenQuick
	"""
	ウチのゆわかしプログラムが
	こわれてしまって
	おゆが でないんだよ
	"""
	keyWait
	clearMsg
	"チップをたくさんもっているヒト"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 26
	" "
	printCode
		buffer = 0
		code = F
	"""
	」を、
	わけてくれないかい?
	"""
	keyWait
	clearMsg
	"""
	もちろんタダとはいわないよ
	「
	"""
	printChip
		buffer = 0
		chip = 38
	" "
	printCode
		buffer = 0
		code = L
	"""
	」と、
	こうかんするからね
	"""
	keyWait
	clearMsg
	"""
	オフィシャルセンターのロビーにいるから
	さがしておくれ
	"""
	keyWait
	clearMsg
	"はやいもんがちだよ"
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 76,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 6 mmbn2 {
	checkFlag
		flag = 3206
		jumpIfTrue = 95
		jumpIfFalse = continue
	checkFlag
		flag = 3270
		jumpIfTrue = 96
		jumpIfFalse = continue
	msgOpenQuick
	"""
	さいきん、デンノウ セカイに
	ガラのワルいナビがあらわれて
	"""
	keyWait
	clearMsg
	"""
	いっぱんのナビにインネンをつけ
	ウイルスを けしかけるというヒガイが
	ぞくしゅつしています
	"""
	keyWait
	clearMsg
	"""
	ワタシも メをつけられて
	アチコチを にげまわっています
	"""
	keyWait
	clearMsg
	"なんとかしてもらえないでしょうか?"
	keyWait
	clearMsg
	"""
	あるいえの デンワのなかで
	おまちしています
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 77,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 7 mmbn2 {
	checkFlag
		flag = 3207
		jumpIfTrue = 97
		jumpIfFalse = continue
	checkFlag
		flag = 3271
		jumpIfTrue = 98
		jumpIfFalse = continue
	msgOpenQuick
	"""
	あるヒトをさがしています
	おてつだいしていただけるヒト
	秋原町へきてください
	"""
	keyWait
	clearMsg
	"リスのまえで、まっています"
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 78,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 8 mmbn2 {
	checkFlag
		flag = 3208
		jumpIfTrue = 99
		jumpIfFalse = continue
	checkFlag
		flag = 3272
		jumpIfTrue = 100
		jumpIfFalse = continue
	msgOpenQuick
	"""
	ほうしゅう さきばらいです
	そこらじゃ、てに はいらない
	アイテムを ごよういしています
	"""
	keyWait
	clearMsg
	"""
	カンタンなしごとで、おおきな りえき
	こんなに おいしいハナシはない!!
	"""
	keyWait
	clearMsg
	"""
	うけてくださるカタは、
	アジーナエリア1へいますぐ
	おいでください!!
	"""
	keyWait
	clearMsg
	"""
	とうほうの、クロいナビが
	おまちしております
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 79,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 9 mmbn2 {
	checkFlag
		flag = 3209
		jumpIfTrue = 101
		jumpIfFalse = continue
	checkFlag
		flag = 3273
		jumpIfTrue = 102
		jumpIfFalse = continue
	msgOpenQuick
	"""
	ワタクシ、ただいまモーレツに
	こいをしております!!
	"""
	keyWait
	clearMsg
	"""
	しかし、せいらいの うちきな
	せいかくのせいで
	このキモチを うちあけられません
	"""
	keyWait
	clearMsg
	"""
	どなたか、こんなワタシにチカラを
	かしてください!!
	"""
	keyWait
	clearMsg
	"""
	いらいを うけてくださるかたは、
	キャンプじょういりぐち まで
	きてください
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 80,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 10 mmbn2 {
	checkFlag
		flag = 3210
		jumpIfTrue = 103
		jumpIfFalse = continue
	checkFlag
		flag = 3274
		jumpIfTrue = 104
		jumpIfFalse = continue
	msgOpenQuick
	"""
	こんど、あるオトコとネットバトルで
	タタカいます
	"""
	keyWait
	clearMsg
	"""
	しかし、カてるかどうかワカりません
	どなたか、ワタシのショウリのタメに
	チカラをカしてイタダけませんか?
	"""
	keyWait
	clearMsg
	"""
	オフィシャルスクエアの いりぐちで
	まっています
	"""
	keyWait
	clearMsg
	"""
	このいらいには、オトコのプライドが
	かかっています
	"""
	keyWait
	clearMsg
	"ぜひチカラをかしてください"
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 81,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 11 mmbn2 {
	checkFlag
		flag = 3211
		jumpIfTrue = 105
		jumpIfFalse = continue
	checkFlag
		flag = 3275
		jumpIfTrue = 106
		jumpIfFalse = continue
	msgOpenQuick
	"""
	ただいま、ぼうテレビきょくの
	きょうりょくを えて
	"""
	keyWait
	clearMsg
	"""
	ウイルスバスティングの
	けんきゅうをしています
	"""
	keyWait
	clearMsg
	"""
	けんきゅうにチカラを かしてください
	やることはカンタンです
	"""
	keyWait
	clearMsg
	"""
	ウイルスを なんびきか
	デリートしていただいて
	ナビのデータを そくていするだけです
	"""
	keyWait
	clearMsg
	"うれしい アイテムを、プレゼント"
	keyWait
	clearMsg
	"""
	ただし、ナビがデリートされても
	とうほうは、いっさいせきにんを
	もちません
	"""
	keyWait
	clearMsg
	"あしからず"
	keyWait
	clearMsg
	"""
	このいらいを うけていただけるカタは
	ぼうテレビきょくの
	ちゅうけいしゃの電脳に きてください
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 82,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 12 mmbn2 {
	checkFlag
		flag = 3212
		jumpIfTrue = 107
		jumpIfFalse = continue
	checkFlag
		flag = 3276
		jumpIfTrue = 108
		jumpIfFalse = continue
	msgOpenQuick
	"""
	これから 外国にいきますねん
	でも、あまりツヨいチップを
	もってへんから、ふあんです
	"""
	keyWait
	clearMsg
	"""
	よろしければ、
	「
	"""
	printChip
		buffer = 0
		chip = 136
	" "
	printCode
		buffer = 0
		code = N
	"""
	」を
	わけてもらわれへんやろか?
	"""
	keyWait
	clearMsg
	"おれいは、げんきんで させてもらいます"
	keyWait
	clearMsg
	"デンサンくうこうで おまちしていまっせ"
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 83,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 13 mmbn2 {
	checkFlag
		flag = 3213
		jumpIfTrue = 109
		jumpIfFalse = continue
	checkFlag
		flag = 3277
		jumpIfTrue = 110
		jumpIfFalse = continue
	msgOpenQuick
	"""
	おとつい、もちナビと ケンカしたのが
	げんいんで、ナビが いえで しました
	"""
	keyWait
	clearMsg
	"""
	ダレか、さがしだして
	もらえないでしょうか?
	"""
	keyWait
	clearMsg
	"""
	ボクは、秋原町のえきにいます
	よろしくおねがいします
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?"
	keyWait
	clearMsg
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 84,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 14 mmbn2 {
	checkFlag
		flag = 3214
		jumpIfTrue = 111
		jumpIfFalse = continue
	checkFlag
		flag = 3278
		jumpIfTrue = 112
		jumpIfFalse = continue
	msgOpenQuick
	"""
	ニホンは ウイルスバスティングの
	レベルが たかいクニだと ききました
	"""
	keyWait
	clearMsg
	"""
	どなたか、アメロッパに しゅつぼつする
	「チンピラ してんのう」を たいじして
	もらえないでしょうか?
	"""
	keyWait
	clearMsg
	"ワタシたちでは、てに おえないのです"
	keyWait
	clearMsg
	"""
	ワタシは、アメロッパにある
	アメロッパタウンにおります
	"""
	keyWait
	clearMsg
	"よろしく おねがいします"
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 85,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 15 mmbn2 {
	checkFlag
		flag = 3215
		jumpIfTrue = 113
		jumpIfFalse = continue
	checkFlag
		flag = 3279
		jumpIfTrue = 114
		jumpIfFalse = continue
	msgOpenQuick
	"""
	ワタシの けいえいする かいしゃが、
	とうさん すんぜんで、
	"""
	keyWait
	clearMsg
	"""
	きんきゅうに、50000ゼニー
	ひつようなんです
	"""
	keyWait
	clearMsg
	"""
	こんげつを のりきって
	けいえいが、きどうにのれば
	"""
	keyWait
	clearMsg
	"""
	りしを つけて おかえしできると
	おもいます
	"""
	keyWait
	clearMsg
	"""
	おかねを、ゆうし してくださる かたは、
	いまスグ 秋原町でイチバンおおきな
	おやしきに いらしてください
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 86,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 16 mmbn2 {
	checkFlag
		flag = 3216
		jumpIfTrue = 115
		jumpIfFalse = continue
	checkFlag
		flag = 3280
		jumpIfTrue = 116
		jumpIfFalse = continue
	msgOpenQuick
	"""
	ワタシは、「ニホンこんちゅうがっかい」の
	ものです
	"""
	keyWait
	clearMsg
	"""
	つぎの 「こんちゅう シンポジウム」で
	はっぴょうする けんきゅうのため、
	ニホンにしか せいそくしない
	"""
	keyWait
	clearMsg
	"""
	「デンサン オオゲンゴロウ」を
	さがしています
	"""
	keyWait
	clearMsg
	"""
	たいへん めずらしいムシなので
	なかなかみつけるコトが できません
	"""
	keyWait
	clearMsg
	"""
	さがしてくださる かたを、ぼしゅうします
	われこそはと、おもわれる かたは、
	"""
	keyWait
	clearMsg
	"""
	おくデンだにキャンプじょう まで
	きてください
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 87,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 17 mmbn2 {
	checkFlag
		flag = 3217
		jumpIfTrue = 117
		jumpIfFalse = continue
	checkFlag
		flag = 3281
		jumpIfTrue = 118
		jumpIfFalse = continue
	msgOpenQuick
	"""
	アメロッパの、ほうせきてんで
	はたらいているもの なんですが、
	せんじつ、おみせから
	"""
	keyWait
	clearMsg
	"""
	「アジーナのなみだ」
	「キング ストーン」
	「びじょのたそがれ」
	"""
	keyWait
	clearMsg
	"""
	という3つの ほうせきが
	ぬすまれました・・・
	"""
	keyWait
	clearMsg
	"""
	はんにんの けんとうは、
	ついているのですが、
	どこにいるのか わかりません
	"""
	keyWait
	clearMsg
	"""
	どなたか、そうさに ごきょうりょく
	おねがいします
	"""
	keyWait
	clearMsg
	"この いらいを うけますか?\n"
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
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 88,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 18 mmbn2 {
	msgOpenQuick
	"BBS012 せつめい"
	keyWait
	waitHold
}
script 19 mmbn2 {
	msgOpenQuick
	"BBS013 せつめい"
	keyWait
	waitHold
}
script 20 mmbn2 {
	msgOpenQuick
	"BBS014 せつめい"
	keyWait
	waitHold
}
script 21 mmbn2 {
	msgOpenQuick
	"BBS015 せつめい"
	keyWait
	waitHold
}
script 22 mmbn2 {
	msgOpenQuick
	"BBS016 せつめい"
	keyWait
	waitHold
}
script 23 mmbn2 {
	msgOpenQuick
	"BBS017 せつめい"
	keyWait
	waitHold
}
script 24 mmbn2 {
	msgOpenQuick
	"BBS018 せつめい"
	keyWait
	waitHold
}
script 25 mmbn2 {
	msgOpenQuick
	"BBS019 せつめい"
	keyWait
	waitHold
}
script 26 mmbn2 {
	msgOpenQuick
	"BBS01A せつめい"
	keyWait
	waitHold
}
script 27 mmbn2 {
	msgOpenQuick
	"BBS01B せつめい"
	keyWait
	waitHold
}
script 28 mmbn2 {
	msgOpenQuick
	"BBS01C せつめい"
	keyWait
	waitHold
}
script 29 mmbn2 {
	msgOpenQuick
	"BBS01D せつめい"
	keyWait
	waitHold
}
script 30 mmbn2 {
	msgOpenQuick
	"BBS01E せつめい"
	keyWait
	waitHold
}
script 31 mmbn2 {
	msgOpenQuick
	"BBS01F せつめい"
	keyWait
	waitHold
}
script 32 mmbn2 {
	msgOpenQuick
	"BBS020 せつめい"
	keyWait
	waitHold
}
script 33 mmbn2 {
	msgOpenQuick
	"BBS021 せつめい"
	keyWait
	waitHold
}
script 34 mmbn2 {
	msgOpenQuick
	"BBS022 せつめい"
	keyWait
	waitHold
}
script 35 mmbn2 {
	msgOpenQuick
	"BBS023 せつめい"
	keyWait
	waitHold
}
script 36 mmbn2 {
	msgOpenQuick
	"BBS024 せつめい"
	keyWait
	waitHold
}
script 37 mmbn2 {
	msgOpenQuick
	"BBS025 せつめい"
	keyWait
	waitHold
}
script 38 mmbn2 {
	msgOpenQuick
	"BBS026 せつめい"
	keyWait
	waitHold
}
script 39 mmbn2 {
	msgOpenQuick
	"BBS027 せつめい"
	keyWait
	waitHold
}
script 40 mmbn2 {
	msgOpenQuick
	"BBS028 せつめい"
	keyWait
	waitHold
}
script 41 mmbn2 {
	msgOpenQuick
	"BBS029 せつめい"
	keyWait
	waitHold
}
script 42 mmbn2 {
	msgOpenQuick
	"BBS02A せつめい"
	keyWait
	waitHold
}
script 43 mmbn2 {
	msgOpenQuick
	"BBS02B せつめい"
	keyWait
	waitHold
}
script 44 mmbn2 {
	msgOpenQuick
	"BBS02C せつめい"
	keyWait
	waitHold
}
script 45 mmbn2 {
	msgOpenQuick
	"BBS02D せつめい"
	keyWait
	waitHold
}
script 46 mmbn2 {
	msgOpenQuick
	"BBS02E せつめい"
	keyWait
	waitHold
}
script 47 mmbn2 {
	msgOpenQuick
	"BBS02F せつめい"
	keyWait
	waitHold
}
script 48 mmbn2 {
	msgOpenQuick
	"BBS030 せつめい"
	keyWait
	waitHold
}
script 49 mmbn2 {
	msgOpenQuick
	"BBS031 せつめい"
	keyWait
	waitHold
}
script 50 mmbn2 {
	msgOpenQuick
	"BBS032 せつめい"
	keyWait
	waitHold
}
script 51 mmbn2 {
	msgOpenQuick
	"BBS033 せつめい"
	keyWait
	waitHold
}
script 52 mmbn2 {
	msgOpenQuick
	"BBS034 せつめい"
	keyWait
	waitHold
}
script 53 mmbn2 {
	msgOpenQuick
	"BBS035 せつめい"
	keyWait
	waitHold
}
script 54 mmbn2 {
	msgOpenQuick
	"BBS036 せつめい"
	keyWait
	waitHold
}
script 55 mmbn2 {
	msgOpenQuick
	"BBS037 せつめい"
	keyWait
	waitHold
}
script 56 mmbn2 {
	msgOpenQuick
	"BBS038 せつめい"
	keyWait
	waitHold
}
script 57 mmbn2 {
	msgOpenQuick
	"BBS039 せつめい"
	keyWait
	waitHold
}
script 58 mmbn2 {
	msgOpenQuick
	"BBS03A せつめい"
	keyWait
	waitHold
}
script 59 mmbn2 {
	msgOpenQuick
	"BBS03B せつめい"
	keyWait
	waitHold
}
script 60 mmbn2 {
	msgOpenQuick
	"BBS03C せつめい"
	keyWait
	waitHold
}
script 61 mmbn2 {
	msgOpenQuick
	"BBS03D せつめい"
	keyWait
	waitHold
}
script 62 mmbn2 {
	msgOpenQuick
	"BBS03E せつめい"
	keyWait
	waitHold
}
script 63 mmbn2 {
	msgOpenQuick
	waitHold
}
script 64 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3264
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 65 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3265
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 66 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3266
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 67 mmbn2 {
	msgOpenQuick
	"""
	いらいじっこうちゅうですので
	このいらいを うけるコトはできません
	"""
	keyWait
	clearMsg
	"""
	げんざい うけおっている いらいを
	かいけつしてから きてください
	"""
	keyWait
	waitHold
}
script 68 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"たいした、バスティングテクニックです"
	keyWait
	clearMsg
	"""
	なかなか みこみのある
	しょうねんですね
	"""
	keyWait
	clearMsg
	"""
	もっと けいけんをつめば
	よいネットバトラーに なれるでしょう
	"""
	keyWait
	waitHold
}
script 69 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ 秋原町"
	keyWait
	waitHold
}
script 70 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	じんそくな、オペレーションができる
	しょうねんです
	"""
	keyWait
	clearMsg
	"""
	これからの せいちょうが
	たのしみです
	"""
	keyWait
	waitHold
}
script 71 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ コトブキスクエア"
	keyWait
	waitHold
}
script 72 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	かんさつがんの スルドイしょうねんです
	これからも、きっと よいシゴトを
	するでしょう
	"""
	keyWait
	waitHold
}
script 73 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ キャンプじょう"
	keyWait
	waitHold
}
script 74 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3267
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 75 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3268
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 76 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3269
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 77 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3270
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 78 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3271
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 79 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3272
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 80 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3273
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 81 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3274
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 82 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3275
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 83 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3276
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 84 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3277
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 85 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3278
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 86 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3279
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 87 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3280
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 88 mmbn2 {
	checkFlag
		flag = 82
		jumpIfTrue = 67
		jumpIfFalse = continue
	flagSet
		flag = 3281
	flagSet
		flag = 82
	msgOpenQuick
	"いらいをうけました"
	keyWait
	waitHold
}
script 89 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	光くん、ありがとう
	光くんってやっぱりスゴいね
	"""
	keyWait
	waitHold
}
script 90 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ 秋原町 がっこう"
	keyWait
	waitHold
}
script 91 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	こんかいの いらいは、
	なかなかホネのあるわかものが
	かいけつしてくれた
	"""
	keyWait
	clearMsg
	"しょうらいがたのしみだ"
	keyWait
	waitHold
}
script 92 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ うみのみえるカフェ"
	keyWait
	waitHold
}
script 93 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	わたしゃ、ウイルスバスティングなんて
	さっぱりわからないからね
	"""
	keyWait
	clearMsg
	"""
	じぶんでチップをあつめたり
	したコトないけど、
	"""
	keyWait
	clearMsg
	"""
	こんかいみたいにしんせつなヒトに
	わけてもらうってのも
	チップあつめの ほうほうのヒトツだね
	"""
	keyWait
	clearMsg
	"ぼうや、ありがとうね"
	keyWait
	waitHold
}
script 94 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"""
	まちあわせばしょ
	オフィシャルセンターロビー
	"""
	keyWait
	waitHold
}
script 95 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	あぶないトコロをたすけていただき
	ありがとうございました
	"""
	keyWait
	clearMsg
	"""
	ワタシも しゅうれんをつんで、
	アクにくっしないチカラを
	つけたいとおもいます
	"""
	keyWait
	waitHold
}
script 96 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"""
	まちあわせばしょ
	ある デンワの電脳
	"""
	keyWait
	waitHold
}
script 97 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	おかげさまで、きょうあくはんを
	タイホするコトができました
	ごきょうりょくかんしゃします
	"""
	keyWait
	waitHold
}
script 98 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ 秋原町"
	keyWait
	waitHold
}
script 99 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"こちらは、オフィシャルセンターです"
	keyWait
	clearMsg
	"""
	しみんネットバトラーをターゲットにした
	れんぞくサギじけんをよくぞ
	かいけつしてくださいました
	"""
	keyWait
	clearMsg
	"おてがらです"
	keyWait
	waitHold
}
script 100 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"""
	まちあわせばしょ
	アジーナエリア1
	"""
	keyWait
	waitHold
}
script 101 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	キューピッドよ
	かんしゃしておるぞい!
	"""
	keyWait
	clearMsg
	"""
	いまは、いきながら てんごくにきた
	きぶんじゃ!!
	"""
	keyWait
	waitHold
}
script 102 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"""
	まちあわせばしょ
	キャンプじょういりぐち
	"""
	keyWait
	waitHold
}
script 103 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	カレのおかげで、こんどのバトルに
	カてそうなキがします!
	"""
	keyWait
	clearMsg
	"ほんとうにありがとう!"
	keyWait
	waitHold
}
script 104 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"""
	まちあわせばしょ
	オフィシャルスクエアいりぐち
	"""
	keyWait
	waitHold
}
script 105 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	かれのナビからは、きょうみぶかい
	データをとることができました
	"""
	keyWait
	clearMsg
	"""
	しかし、ワタシたちの ぎじゅつでは
	そのデータを どうすることもできません
	"""
	keyWait
	clearMsg
	"""
	かれのナビをつくったヒトは
	きっと、てんさいに ちがいありません
	"""
	keyWait
	waitHold
}
script 106 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"""
	まちあわせばしょ
	ぼうテレビきょくの ちゅうけいしゃの電脳
	"""
	keyWait
	waitHold
}
script 107 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	あんしんして、かいがいりょこうに
	行けます
	どうも、ありがとうございました
	"""
	keyWait
	waitHold
}
script 108 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ くうこう"
	keyWait
	waitHold
}
script 109 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	しみんネットバトラーさんの
	おかげで、
	ナビと、なかなおり できそうです
	"""
	keyWait
	waitHold
}
script 110 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ メトロ秋原えき"
	keyWait
	waitHold
}
script 111 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	「チンピラ してんのう」が
	いなくなって、みんな よろこんでいます
	ありがとうございました
	"""
	keyWait
	waitHold
}
script 112 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ アメロッパタウン"
	keyWait
	waitHold
}
script 113 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	おかげさまで、かいしゃを
	とうさんさせずに すみました
	"""
	keyWait
	clearMsg
	"""
	あの しょうねんは、
	きっと ふくのカミ だったんです
	"""
	keyWait
	clearMsg
	"ほんとうに、かんしゃしています"
	keyWait
	clearMsg
	"""
	「かぜが ふけば、おけやがもうかる」とは
	よくいった ものですね
	"""
	keyWait
	waitHold
}
script 114 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"""
	まちあわせばしょ
	秋原町で いちばん おおきい
	おやしき
	"""
	keyWait
	waitHold
}
script 115 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	たいへん みつけにくい
	「デンサン オオゲンゴロウ」を
	みつけてもらい
	"""
	keyWait
	clearMsg
	"ありがとう ございました"
	keyWait
	clearMsg
	"""
	これで、ナゾのおおかった
	「デンサン オオゲンゴロウ」の
	ヒミツが、あきらかに なるでしょう
	"""
	keyWait
	waitHold
}
script 116 mmbn2 {
	msgOpenQuick
	"""
	このいらいは、
	げんざいじっこうちゅうです
	"""
	keyWait
	clearMsg
	"まちあわせばしょ キャンプじょう"
	keyWait
	waitHold
}
script 117 mmbn2 {
	msgOpenQuick
	"いらいしゃ かんしゃのこえ"
	keyWait
	clearMsg
	"""
	あやうく クビになるトコロでした
	ほんとうに かんしゃしています
	"""
	keyWait
	clearMsg
	"""
	ほうせきを かわれるときは、
	ぜひ ウチのおみせに きてください
	"""
	keyWait
	clearMsg
	"サービスさせてもらいますよ"
	keyWait
	waitHold
}
