@archive 0757B48
@size 255

script 0 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = continue
		jumpIfFalse = 1
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	たしか・・・
	もう もどれないんだったな・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、とうじょうゲートは
	こっち じゃないよ
	それとも・・・ホームシック?
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkItem
		item = 64
		amount = 1
		jumpIfEqual = 7
		jumpIfGreater = 7
		jumpIfLess = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマンと ベツベツ だなんて
	やっぱり・・・なっとく できない!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	それでは ごゆっくり ソラのたびを
	おたのしみ 下さいませ
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! いよいよ アメロッパだね!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	アメロッパに行く?
	それとも ひこうきを見る?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"アメロッパ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ひこうき"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 8,
			jump = 9,
			jump = continue
		]
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	りょうかい!
	じゃ アメロッパまで ひとっとびだ!
	"""
	keyWait
	startWarp
		warp = 3
	end
}
script 9 mmbn2 {
	flagSet
		flag = 120
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	りょうかい!
	じゃ ひこうき 見に行こう!
	"""
	keyWait
	startWarp
		warp = 4
	end
}
script 12 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = continue
		jumpIfFalse = 15
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	フン・・・
	しけたツラ してるじゃないか
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"うん "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ほっといてくれ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = continue,
			jump = 13,
			jump = continue
		]
	"""
	ナビが いないだけで そのザマか・・・
	つまらん・・・
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	それくらいの パワーを もってないと
	この先 のりきれないぜ
	"""
	keyWait
	clearMsg
	"""
	ほらよ、こいつを くれてやる
	オフィシャルけんげん で
	とりもどしておいた
	"""
	keyWait
	clearMsg
	"これがないと おまえ ダメなんだろ?"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	flagClear
		flag = 2141
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 0
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 0
	"""
	」
	を ふたたび ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 21
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"たく、せわの かかるヤツだ・・・"
	keyWait
	end
}
script 16 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 61
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	ひこうきに おのりのさいは
	そちらの入口から おすすみ下さい
	"""
	keyWait
	end
}
script 17 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 91
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 82
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 72
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	こちらの めんぜいてんでは 世界の
	いちりゅうひんを とりそろえています
	どうぞ ごらん下さい
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"・・・ひこうきは ニガテだ"
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"いよいよ たびだち・・・"
	keyWait
	clearMsg
	"""
	見しらぬ いこくの人との であいが
	わたしを まっているのね・・・
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"スリに おカネを スられた?"
	keyWait
	clearMsg
	"ついてないな、ボク"
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! あいたかったよ!"
	keyWait
	clearMsg
	"・・・どしたの?"
	waitSkip
		frames = 30
	"\nゲンキ ないよ?"
	keyWait
	clearMsg
	"""
	え! スリに おカネを!?
	それで 見うしなった?
	"""
	keyWait
	clearMsg
	"・・・しょうがないよ"
	waitSkip
		frames = 30
	"\n今は あきらめて ひこうきに のろ!"
	waitSkip
		frames = 30
	"\nおカネは また かせげば いいんだしさ"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、ここは おり口だよ!"
	keyWait
	end
}
script 61 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 84
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 74
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"おかえりなさいませ!"
	keyWait
	end
}
script 70 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 93
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"""
	なんだよ!? だから 今は
	じけんは おこしてないって
	いってんだろ・・・?
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 71 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"とうじょうぐちは ここです"
	keyWait
	clearMsg
	"""
	ただいま、AALのとくべつきの
	てんじも おこなっておりますので
	"""
	keyWait
	clearMsg
	"よろしかったら、そちらもどうぞ"
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	おきゃくさんが、すくないな
	じしんのえいきょうが、
	こういうカタチで でるとは
	"""
	keyWait
	end
}
script 73 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 83
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 76
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	アメロッパでも、さいがいが
	おこってるのかい!?
	"""
	keyWait
	clearMsg
	"""
	こりゃ こまったね!
	りょこうは、あきらめるかね
	"""
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	おかえりなさいませ
	じしんが ひんぱつしておりますので、
	お気をつけ ください
	"""
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	え? ひなんかんこくが でてるって?
	そりゃ、おきゃくさんも、すくないよ
	"""
	keyWait
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	でも、ここまで はいっちゃって
	キャンセルは できるのかね?
	できなかったら けっこうツラいね
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ひなんかんこくは、
	かいじょ されたんだね
	"""
	keyWait
	clearMsg
	"""
	また こんざつした
	ひびがかえってくるのか・・・
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	おや、せかいじゅうの さいがいが
	おさまったのかい!?
	それじゃ、りょこう さいかいだね!!
	"""
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"おかえりなさいませ!"
	keyWait
	clearMsg
	"""
	じしんは、おさまりました
	もう、あんぜんですよ!
	"""
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	だいじょうぶ、あやしそうな人は
	ひこうきに のりこんで いないから
	あんしんして ごとうじょう 下さいね
	"""
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"うりあげが さっぱりだよ・・・"
	keyWait
	clearMsg
	"""
	まぁ かんこうきゃくの 人が
	ほとんど いないから しょうがないけどね
	"""
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	かいがいに 行きたい人でも
	ネットはんざいを おそれて
	りょこうを ひかえていると いうのに、
	"""
	keyWait
	clearMsg
	"""
	ひこうきが ニガテな わたしが
	しごとで かいがいに
	行かないと いけないとは・・・
	"""
	keyWait
	end
}
script 93 mmbn2 {
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"""
	ゴスペル!? しらねえよ!
	このヒノケンさま、ちかって
	ゴスペルにだけは カンケーが ねえ!
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 160 mmbn2 {
	checkFlag
		flag = 198
		jumpIfTrue = 70
		jumpIfFalse = continue
	flagSet
		flag = 198
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"""
	ヘッ!
	どこかで 見たカオだと おもったら
	光熱斗 じゃねぇか!
	"""
	keyWait
	clearMsg
	"""
	・・・おいおい、
	まさか このヒノケンさまの カオを
	わすれたんじゃ ねぇだろうな!?
	"""
	keyWait
	clearMsg
	mugshotHide
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"おぼえてる "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"おぼえがない"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 176,
			jump = continue,
			jump = continue
		]
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"""
	マジかよ! WWWじけんの ときに
	オマエのいえの レンジを バグらせた
	このヒノケンさまを おぼえてねぇのか?
	"""
	keyWait
	clearMsg
	"""
	・・・って おもいだしたからって
	きゅうに そんなこわいカオ すんなよ!
	"""
	keyWait
	clearMsg
	"""
	今は なんのじけんも おこしていない
	ぜんりょうな しみんだぜ! 
	"""
	waitSkip
		frames = 15
	"今はな!"
	keyWait
	clearMsg
	"""
	どうだ!? オレさまの あたらしいナビ
	ヒートマンと ネットバトルしてみる
	気は ねぇか?
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 161 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ヒノケン・・・さん に
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
			jump = 162,
			jump = 164,
			jump = continue
		]
	end
}
script 162 mmbn2 {
	checkFlag
		flag = 194
		jumpIfTrue = 165
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"""
	ヘッ!!
	ヒートマンと ファイアマンを おなじに
	かんがえたら・・・
	"""
	waitSkip
		frames = 15
	"ヤケドするぜ!"
	keyWait
	clearMsg
	jump
		target = 163
}
script 163 mmbn2 {
	flagSet
		flag = 194
	msgClose
	waitHold
}
script 164 mmbn2 {
	flagClear
		flag = 195
	flagClear
		flag = 196
	flagClear
		flag = 197
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"もえねぇーーー!!!!"
	keyWait
	end
}
script 165 mmbn2 {
	flagClear
		flag = 195
	flagClear
		flag = 196
	flagClear
		flag = 197
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"""
	なんか シケてんだよな 今・・・
	わりぃ、またに してくれや
	"""
	keyWait
	end
}
script 166 mmbn2 {
	checkFlag
		flag = 195
		jumpIfTrue = 167
		jumpIfFalse = continue
	checkFlag
		flag = 196
		jumpIfTrue = 169
		jumpIfFalse = continue
	checkFlag
		flag = 197
		jumpIfTrue = 171
		jumpIfFalse = 171
}
script 167 mmbn2 {
	checkFlag
		flag = 199
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"""
	ヘッ!
	あいかわらずの ウデまえって わけかよ
	"""
	keyWait
	clearMsg
	"""
	くえねぇ ヤツだな・・・
	こいつを とっときな!
	"""
	keyWait
	clearMsg
	jump
		target = 168
}
script 168 mmbn2 {
	flagSet
		flag = 199
	flagClear
		flag = 195
	mugshotHide
	msgOpen
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
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 173
}
script 169 mmbn2 {
	checkFlag
		flag = 200
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"今のは かなり アツかったぜ!"
	keyWait
	clearMsg
	jump
		target = 170
}
script 170 mmbn2 {
	flagSet
		flag = 200
	flagClear
		flag = 196
	end
}
script 171 mmbn2 {
	checkFlag
		flag = 201
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"やられたな・・・"
	waitSkip
		frames = 15
	"""
	今のオマエ、
	どんな キャンプファイヤーより
	大きく 見えるぜ
	"""
	keyWait
	clearMsg
	jump
		target = 172
}
script 172 mmbn2 {
	flagSet
		flag = 201
	flagClear
		flag = 197
	end
}
script 173 mmbn2 {
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"オレを あまく見るのは まだはえぇぜ!"
	keyWait
	end
}
script 174 mmbn2 {
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"もえつきたぜ・・・"
	keyWait
	end
}
script 175 mmbn2 {
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"""
	ヒートアップ ヒノケン!!
	どこまでも たかく もえあがれ!!
	だぜ!!
	"""
	keyWait
	end
}
script 176 mmbn2 {
	mugshotShow
		mugshot = MrMatch
	msgOpen
	"ヘッ! そりゃ そうだよな!"
	waitSkip
		frames = 30
	"\n・・・って そんなこわいカオ すんなよ!"
	keyWait
	clearMsg
	"""
	今は なんのじけんも おこしていない
	ぜんりょうな しみんだぜ! 
	"""
	waitSkip
		frames = 15
	"今はな!"
	keyWait
	clearMsg
	"""
	どうだ!? オレさまの あたらしいナビ
	ヒートマンと ネットバトルしてみる
	気は ねぇか?
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 196 mmbn2 {
	checkFlag
		flag = 266
		jumpIfTrue = 199
		jumpIfFalse = continue
	checkFlag
		flag = 265
		jumpIfTrue = 197
		jumpIfFalse = continue
	flagSet
		flag = 265
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	だれがよんだか~ クイズくん~
	だれがよんだか~ クイズくん~
	"""
	keyWait
	clearMsg
	"""
	いってみよ~! やってみよ~!
	さーぁ さぁさぁ
	(チャッチャー)クイズアワー~~
	"""
	keyWait
	clearMsg
	"""
	ボクの あだなは クイズくん
	ボクのクイズに 5もん れんぞく
	せいかいすると、
	"""
	keyWait
	clearMsg
	"""
	ステキな しょうひん
	ゲットだぜ~!!
	"""
	keyWait
	clearMsg
	"クイズに ちょうせんする?\n"
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
			jump = 200,
			jump = continue,
			jump = continue
		]
	"""
	いつでも きなよ!
	キミのちょうせん、まってるぜ!
	"""
	keyWait
	end
}
script 197 mmbn2 {
	soundEnableChoiceSFX
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	だれがよんだか~ クイズくん~
	だれがよんだか~ クイズくん~
	"""
	keyWait
	clearMsg
	"""
	いってみよ~! やってみよ~!
	さーぁ さぁさぁ
	(チャッチャー)クイズアワー~~
	"""
	keyWait
	clearMsg
	"""
	やっぱり、ちょうせんする きに
	なったかい?
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
	"いいよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いやん"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 200,
			jump = continue,
			jump = continue
		]
	"""
	いつでも きなよ!
	キミのちょうせん、まってるぜ!
	"""
	keyWait
	end
}
script 198 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	soundPlay
		track = 280
	waitSkip
		frames = 40
	"ざんねんでした~~!"
	keyWait
	clearMsg
	"""
	また、いつでも ちょうせんしてね!
	ボクは、いつでもまってるよ!
	"""
	keyWait
	end
}
script 199 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	フフフ、ボクのクイズは
	ほんの じょのくちだよ・・・
	"""
	keyWait
	clearMsg
	"キミは、クイズマスターに かてるかな?"
	keyWait
	end
}
script 200 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"それじゃあ、いくよ!"
	keyWait
	clearMsg
	"だい1問"
	keyWait
	clearMsg
	"""
	秋原町のこうえんにある すべりだいは、
	どうぶつのカタチをしています
	どんな、どうぶつのカタチでしょうか?
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
	"リス\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ゾウ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"キリン"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 198,
			jump = continue,
			jump = 198,
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
		mugshot = BlueShirtBoy
	msgOpen
	"だい2問"
	keyWait
	clearMsg
	"""
	メトロマリンえきにある
	バイテンのセールスポイントは
	なんでしょう?
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
	"しなかずの ほうふさ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"めちゃくちゃ やすい\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"おばちゃんが びじん"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = continue,
			jump = 198,
			jump = 198,
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
		mugshot = BlueShirtBoy
	msgOpen
	"だい3問"
	keyWait
	clearMsg
	"""
	おくデンだにの キャンプじょうには、
	テントが、いくつ はってあるでしょう?
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
	"2つ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"3つ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"4つ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 198,
			jump = continue,
			jump = 198,
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
		target = 203
}
script 203 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"だい4問"
	keyWait
	clearMsg
	"""
	マリンハーバーのカフェで
	バイトしている おねえさんは
	いぜん、どこでバイトしていたでしょうか?
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
	"レストラン\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ゲームセンター\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"オフィシャルセンター"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = continue,
			jump = 198,
			jump = 198,
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
		target = 204
}
script 204 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"だい5問"
	keyWait
	clearMsg
	"""
	キャノンを A、B、Cのじゅんばんで
	えらぶと、はつどうする
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
	"オメガキャノン\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ウルトラキャノン\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ゼータキャノン"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 198,
			jump = 198,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 301
	waitSkip
		frames = 20
	"だーーい せーーいかーーい!"
	keyWait
	clearMsg
	"おめでとう!!"
	keyWait
	clearMsg
	"""
	みごと、クイズを
	ぜんもん せいかいした キミには
	きねんひんが ぞうていされます~!
	"""
	keyWait
	clearMsg
	"ワーーーー、パチパチ~!"
	keyWait
	clearMsg
	jump
		target = 205
}
script 205 mmbn2 {
	flagSet
		flag = 266
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 1
		code = *
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 1
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"おさけと、ネクタイがおいてある"
	keyWait
	clearMsg
	"""
	ここに ならぶ しょうひんは、
	ぜいきんが かからないので
	すこし やすくかえる
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"ニホンのおかしだ!"
	keyWait
	clearMsg
	"""
	ニホンの おみやげといったら
	コレに キマりだろう
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	ガイドブックなどが ならんでいる
	コレが、いがいに やくにたつ
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"ここから がいこくには 行けない"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"ここから いえには かえれない"
	keyWait
	end
}
