@archive 075FCF8
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	こんな ところで
	はしゃがないで くれるか?
	"""
	keyWait
	clearMsg
	"オレまで どうるいに 見られる・・・"
	keyWait
	flagSet
		flag = 550
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	わたくしは クリームランドの 王女
	プリンセス・プライドと いいます
	"""
	keyWait
	clearMsg
	"""
	はるか キタにある わがクニが
	めざましい はってんを とげたのは、
	インターネットの おかげなのです
	"""
	keyWait
	clearMsg
	"""
	「ゴスペル」の いんぼうから
	わが うつくしいクニと こくみんを
	まもるため、わたしは たたかっています
	"""
	keyWait
	flagSet
		flag = 546
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	やあ、キミは きのうの・・・
	オレだ ラウルだよ
	"""
	keyWait
	clearMsg
	"""
	オレは マイナーな
	みんぞくをだいひょうしているんだ
	"""
	keyWait
	clearMsg
	"""
	げんじつと でんのうの りょうほうに
	びょうどうを もたらさなくてはな
	"""
	keyWait
	flagSet
		flag = 547
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	オレは アメロッパの ジョンソン!
	じゆうと へいわを
	こよなく あいする ネットバトラーさ!
	"""
	keyWait
	clearMsg
	"よろしくな!"
	keyWait
	flagSet
		flag = 548
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"かくしつうろ 見つけたみたいね"
	keyWait
	clearMsg
	"""
	アタシは ミナミアメロッパたいりく から
	やってきた ジェニファー
	なかよくしましょ フフッ!
	"""
	keyWait
	flagSet
		flag = 549
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん そっちは うすぐらいよ、
	かいぎには かんけいない へやみたい
	・・・
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	キミが 光くんだね
	キミの かつやくの おかげで
	アメロッパは、まもられたよ!
	"""
	keyWait
	clearMsg
	"""
	かんどうした!
	ありがとう!
	"""
	keyWait
	end
}
script 35 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 56
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 46
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	せかいじゅうのクニは、
	それぞれ そのクニとくゆうの
	さいがいを かかえているんだ
	"""
	keyWait
	clearMsg
	"""
	たとえば、ニホンは じしん、
	アジーナは だいこうずい、
	"""
	keyWait
	clearMsg
	"""
	そしてアメロッパでは、
	きょうりょくな、しがいせんによる
	さいがい・・・
	"""
	keyWait
	clearMsg
	"""
	それらの さいがいは、
	かんきょういじシステムによって
	ながく、ふういん されてきたが、
	"""
	keyWait
	clearMsg
	"""
	こんかい、かんきょういじシステムが
	げんいんふめいの フリーズをおこした
	"""
	keyWait
	clearMsg
	"""
	そして、せかいじゅうで それまで
	ふういん されてきた しぜんさいがいが、
	もういを ふるっているんだ
	"""
	keyWait
	clearMsg
	"""
	はやく、システムを
	ふっきゅう させなくては、
	"""
	keyWait
	clearMsg
	"""
	せかいじゅうで、とんでもない
	ひがいが でるぞ!
	"""
	keyWait
	end
}
script 36 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 47
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	いま、アメロッパぜんどに
	ふりそそぐ しがいせんは、
	つうじょうの、すうじゅうばいだ
	"""
	keyWait
	clearMsg
	"""
	にんげんが、ちょうじかん
	あびつづけると
	ヒフにいじょうをきたす
	"""
	keyWait
	clearMsg
	"""
	「日やけ」っていうのは、
	きょくたんなハナシ
	かるい ヤケドなんだ
	"""
	keyWait
	clearMsg
	"""
	しかし、こんかいばかりは、
	「日やけ」なんて なまやさしいもんじゃ
	すまないかもしれない・・・
	"""
	keyWait
	clearMsg
	"""
	きょうりょくな、しがいせんは
	ゆうがいなんだ
	"""
	keyWait
	clearMsg
	"""
	キミも、あまり そとを
	であるかないほうがいい
	"""
	keyWait
	end
}
script 37 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 48
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 42
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	こまったわね、はやく たいさくを
	ねらなければ・・・
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	インターネットに はっせいした
	ナゾのコオリが、こんかいのじけんの
	ほったん だったみたいだ・・・
	"""
	keyWait
	clearMsg
	"はやく、あのコオリを とりのぞかねば"
	keyWait
	clearMsg
	"しかし、どうやって・・・"
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	いまの トコロ、おおきなひがいの
	ほうこくは、うけてはいないけど、
	ゆだんは、できないよ・・・
	"""
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	ほかのクニも さいがいが
	ひろがっているわ・・・!
	"""
	keyWait
	clearMsg
	"せかいは、どうなってしまうの?"
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ふぅ~、なんとか
	かんきょういじシステムが
	ふっきゅうしたか・・・
	"""
	keyWait
	clearMsg
	"""
	しかし、せかいじゅうの かがくしゃが
	チカラをあわせても かいじょできなかった
	フリーズをだれが・・・?
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"た、たすかった~~"
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	とつぜん、インターネットじゅうの
	コオリが、くだけたんだけど
	いったいナニがおこったのかしら?
	"""
	keyWait
	clearMsg
	"""
	なには ともあれ、
	さいがいは、おさまったのね・・・
	"""
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	アメロッパの オフィシャルの ダメージも
	ビッグ・・ビガー・・・いや、
	ビゲストと いって いいでしょう
	"""
	keyWait
	clearMsg
	"""
	とにかく
	しんこくな ひがいを うけています
	"""
	keyWait
	clearMsg
	"""
	げんいんは いわずもがな、
	先日からの さいがい、
	そして 今回の ウイルスひがいです
	"""
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ゴスペルに たいしてだけは
	わがオフィシャルの プライドも
	つうよう しない・・・
	"""
	keyWait
	clearMsg
	"""
	じっさい 今アメロッパが もっているのは
	ミスターラウルの がんばりも あるが、
	"""
	keyWait
	clearMsg
	"""
	ニホンから ヘルプにきた
	エンザンという ボーイの 力に
	よるところが 大きい・・・
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 274
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 273
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 273
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	だれがよんだか~ クイズマスター
	だれがよんだか~ クイズマスター
	"""
	keyWait
	clearMsg
	"""
	いってみよ~! やってみよう!
	さーぁ さぁさぁ
	(チャッチャー)クイズアワ~~
	"""
	keyWait
	clearMsg
	"""
	ワタシのあだなは クイズマスター
	キミのちしきをみせてくれ!!
	"""
	keyWait
	clearMsg
	"""
	ワタシのクイズに
	10問れんぞく せいかいすれば!!
	"""
	keyWait
	clearMsg
	"""
	ごうかしょうひん
	ゲットだぜ!!
	"""
	keyWait
	clearMsg
	"さあ もんだいをきくかい!?"
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"おう! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"やだよ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 194,
			jump = continue,
			jump = continue
		]
	"""
	いつでも おいで!
	キミのちょうせん、まってるぞ!
	"""
	keyWait
	end
}
script 191 mmbn2 {
	soundEnableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	だれがよんだか~ クイズマスター
	だれがよんだか~ クイズマスター
	"""
	keyWait
	clearMsg
	"""
	いってみよ~! やってみよう!
	さーぁ さぁさぁ
	(チャッチャー)クイズアワ~~
	"""
	keyWait
	clearMsg
	"""
	どうしたんだい キミ?
	ワタシのクイズに ちょうせんするきに
	なったのかい?
	"""
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"おう! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"やだよ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 194,
			jump = continue,
			jump = continue
		]
	"""
	いつでも おいで!
	キミのちょうせん、まってるぞ!
	"""
	keyWait
	end
}
script 192 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	soundPlay
		track = 280
	waitSkip
		frames = 40
	"ざんねん~~!"
	keyWait
	clearMsg
	"""
	しかし、ニンゲンは、しっぱいして
	せいちょうするもんだよ!
	いつでも ちょうせんしてくれよ!
	"""
	keyWait
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"ほほぉ~! やるねえキミ!"
	keyWait
	clearMsg
	"""
	でもね、よのなか うえには、
	うえがいるんだよ
	"""
	keyWait
	clearMsg
	"""
	ボクのししょう クイズキングに
	キミは、かつコトが できるかな?
	"""
	keyWait
	end
}
script 194 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"それじゃあ、いくよ!"
	keyWait
	clearMsg
	"だい1問"
	keyWait
	clearMsg
	"""
	にんき じょしアナの
	みどりかわケロさんが しょぞくする
	テレビきょくの なまえは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"デンサンニュースネットワーク\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"カトルオックステレビ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ライシップTV"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = continue,
			jump = 192,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	じゃあ、つぎのもんだいだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 195
}
script 195 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい2問"
	keyWait
	clearMsg
	"""
	うごきがすばやい ネズミのカタチをした
	ウイルスのなまえは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"ラットン\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ネズミン\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"チュートン"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	じゃあ、つぎのもんだいだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 196
}
script 196 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい3問"
	keyWait
	clearMsg
	"""
	スプレッドガンを アルファベットじゅんに
	ならべると はつどうする
	プログラムアドバンスは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"パワードキャノン\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ハイパーバースト\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"オメガキャノン"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = continue,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	じゃあ、つぎのもんだいだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 197
}
script 197 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい4問"
	keyWait
	clearMsg
	"""
	おくデンだに にある
	くうきかんそくシステムは、
	どんな カタチをしているでしょう?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"おじぞうさま\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"テント\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"クマ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = continue,
			jump = 192,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	じゃあ、つぎのもんだいだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 198
}
script 198 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい5問"
	keyWait
	clearMsg
	"""
	こだい メルポポスぶんめい の
	たたかいのカミの ぞうは、
	ドコにあるでしょう?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"アメロッパじょう\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ほうせきてん\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"やいとのいえ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	じゃあ、つぎのもんだいだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 199
}
script 199 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい6問"
	keyWait
	clearMsg
	"""
	ある ネットバトラーが カゼで
	ねこんでいます
	"""
	keyWait
	clearMsg
	"ネットバトラーの いえの まえでは、"
	keyWait
	clearMsg
	"ウシが、モ~っとなき、"
	keyWait
	clearMsg
	"チョウが とんでいます"
	keyWait
	clearMsg
	"""
	ネットバトラーは、なんのびょうきで
	ねこんでいるのでしょうか?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"モウチョウ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"けびょう\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"カゼ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	じゃあ、つぎのもんだいだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 200
}
script 200 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい7問"
	keyWait
	clearMsg
	printChip
		buffer = 0
		chip = 17
	"と "
	printChip
		buffer = 0
		chip = 15
	"""
	、
	こうげきりょくは、どっちがうえ?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	printChip
		buffer = 0
		chip = 17
	"\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	printChip
		buffer = 0
		chip = 15
	"\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"じつは、おなじ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	じゃあ、つぎのもんだいだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 201
}
script 201 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい8問"
	keyWait
	clearMsg
	"""
	スネークマンの オペレータの
	なまえは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"サルモネラふじん\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ミリオネアふじん\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ミリネオアふじん"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = continue,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	じゃあ、つぎのもんだいだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 202
}
script 202 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい9問"
	keyWait
	clearMsg
	"""
	秋原町で イチバンおおきな いえの
	おフロは、どんな もくざいを
	つかっているでしょう?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"エノキ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"スギ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ヒノキ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい!
	つぎは、いよいよ さいごの もんだいだよ
	"""
	keyWait
	clearMsg
	jump
		target = 203
}
script 203 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = Scientist
	msgOpen
	"だい10問"
	keyWait
	clearMsg
	"""
	アメロッパの ウラどおりにある
	ゴミバコに すててあるのは、
	つぎのうち どれ?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"クマのぬいぐるみ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ラジカセ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"バスケットボール"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = continue,
			jump = 192,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 301
	waitSkip
		frames = 20
	"だーーい せーーいかーーい!"
	keyWait
	clearMsg
	"やったねーーー!!"
	keyWait
	clearMsg
	"""
	みごと、クイズを
	ぜんもん せいかいした キミには
	きねんひんが ぞうていされます~!
	"""
	keyWait
	clearMsg
	"イエーーー、ブラボーー!"
	keyWait
	clearMsg
	jump
		target = 204
}
script 204 mmbn2 {
	flagSet
		flag = 274
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 67
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 67
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	熱斗は、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 96
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 205 mmbn2 {
	checkFlag
		flag = 294
		jumpIfTrue = 208
		jumpIfFalse = continue
	flagSet
		flag = 294
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	ハイ! 光クン
	せんじつの じけんのときには、
	たいへん おせわになりました!
	"""
	keyWait
	clearMsg
	"""
	これは、われわれ アメロッパの
	オフィシャルネットバトラーからの
	おれいの きもちです
	"""
	keyWait
	clearMsg
	"どうぞ うけとってください!"
	keyWait
	clearMsg
	jump
		target = 206
}
script 206 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 86
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 86
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 207
}
script 207 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	その Pコードで アメロッパの
	オフィシャルが かんりする
	セキュリティキューブを かいじょできます
	"""
	keyWait
	clearMsg
	"どうぞ、ごかつようください"
	keyWait
	end
}
script 208 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	われわれも、光クンに まけないように
	ウデをみがきます!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	せかいちずだ
	さいしんの せかいじょうせいの
	データが うつしだされる
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	おおきくかかげられた
	オフィシャルのマークだ
	"""
	keyWait
	clearMsg
	"""
	オフィシャルはみな、このマークに
	へいわをまもる という けついを
	ちかっている
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	この中で オフィシャルの しょくいんが
	はたらいている
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	おおきなモニターだ
	せかいじゅうの じょうほうを
	ひょうじするには、
	"""
	keyWait
	clearMsg
	"やはり これくらい ひつようなのか"
	keyWait
	end
}
