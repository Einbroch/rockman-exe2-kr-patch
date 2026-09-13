@archive 0746844
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	へぇ~、アメロッパに
	いってたのかい?
	"""
	keyWait
	clearMsg
	"けっこう たかくついただろ?"
	keyWait
	clearMsg
	"""
	しょうたいで いったから
	タダ だったって?
	"""
	keyWait
	clearMsg
	"""
	そいつは、うらやましい
	ハナシだねえ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 31
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	なにやら、アメロッパはつの
	ひこうきが、ハイジャックされそうに
	なったらしいんだ
	"""
	keyWait
	clearMsg
	"え? その ひこうきに のってた?"
	keyWait
	clearMsg
	"ホントに!?"
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"アメロッパに いってきたのかい?"
	keyWait
	clearMsg
	"""
	おじさんも、きょねんシゴトで
	アメロッパに いったんだよ
	"""
	keyWait
	clearMsg
	"""
	おしろの てっぺんからの ながめは、
	いまでも、わすれられないなぁ
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkFlag
		flag = 660
		jumpIfTrue = 7
		jumpIfFalse = continue
	flagSet
		flag = 660
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"シャッ! シャッ!"
	keyWait
	clearMsg
	"""
	フフフ だれも、ボクを みつけることは
	できない
	"""
	keyWait
	clearMsg
	"""
	はっ!! ボクをみつけるとは・・・
	オヌシやるな!!
	"""
	keyWait
	clearMsg
	"きねんに、これをあげよう!!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 4 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 34
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	さいきん せかいかくちで
	ぶっそうな じけんが おきているね
	"""
	keyWait
	clearMsg
	"""
	かがく ぎじゅつが、はったつして
	どんどん べんりに なっておるが、
	"""
	keyWait
	clearMsg
	"""
	べんりな はんめん きょうあくな
	はんざいが ふえてきておる
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ちかごろー、ネットワークはんざいが
	ふえてるっていうか コワいわよねー
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 111
		code = *
		amount = 20
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 111
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を 20まい ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ボクが、ここにいる コトは、
	ダレにもないしょだよ!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	おどろいたね!
	あんな、おおきな じしん
	なんねんぶりかねえ!
	"""
	keyWait
	end
}
script 11 mmbn2 {
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 21
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	キミ、あぶないから
	そとに でちゃだめだよ!
	まだ、よしんが あるかもしれない!
	"""
	keyWait
	clearMsg
	"""
	このまま、さっきと おなじくらいの
	じしんが、すうかい きたら
	"""
	keyWait
	clearMsg
	"""
	あちこちで、たてものが くずれたりして、
	とんでもない ひがいが でるぞ!
	"""
	keyWait
	end
}
script 12 mmbn2 {
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 22
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	じしんがおきる ちょっとまえに
	インターネットに いったんだけど、
	"""
	keyWait
	clearMsg
	"""
	インターネットのなかにー、
	へんな、コオリみたいなモノが
	ボコボコできてたわ
	"""
	keyWait
	clearMsg
	"アレは なんだったのかしら?"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	さっきから、なんども、
	おおきな じしんがあったよ
	"""
	keyWait
	clearMsg
	"""
	こりゃ かなりヤバいね
	ドコかに ひなんしないと!
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	また、いつ つぎの じしんが
	くるか わからない!
	"""
	keyWait
	clearMsg
	"""
	こんなトキに オフィシャルは
	ナニを しているんだ!?
	"""
	keyWait
	clearMsg
	"""
	はやく、きんきゅう ひなんじょを
	つくって じゅうみんを
	ひなんさせるべきだ
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"あわわわわわわ・・・"
	keyWait
	clearMsg
	"""
	さすがに、ここまで じしんが
	つづくと、れいせいじゃ いられないわね
	"""
	keyWait
	clearMsg
	"""
	このクニは、どうなっちゃうのかしら
	あわわわわわわ・・・
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	がっこうが、きんきゅう ひなんじょに
	なっているんだ
	"""
	keyWait
	clearMsg
	"キミもはやく ひなんしたまえ!"
	keyWait
	clearMsg
	"""
	ワタシは、にげおくれた
	ヒトがいないか さがしてくる!
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	オフィシャルからの
	せいしきはっぴょうが あって
	"""
	keyWait
	clearMsg
	"""
	もう じしんの しんぱいは、
	ないってさ
	"""
	keyWait
	clearMsg
	"いちじは、どうなるかと おもったよ"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	なんか、せかいじゅうでも
	しぜんさいがいが、おこっていた
	みたいだね
	"""
	keyWait
	clearMsg
	"""
	ほかのクニは、だいじょうぶ
	だったのかな?
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	あれだけの じしんがおきて
	ケガにんが でなかったのは、
	キセキと いうしかないね
	"""
	keyWait
	clearMsg
	"""
	さ、おじさんも、シゴトに
	もどるか!!
	"""
	keyWait
	clearMsg
	"がんばるぞ~"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"じしん、コワかったなぁ~"
	keyWait
	clearMsg
	"""
	あの じしんも、ゴスペルの
	しわざだったの?
	"""
	keyWait
	clearMsg
	"おそろしいね・・・"
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	てんちが、ひっくりかえるかと
	おもう ほどの じしんだったね
	"""
	keyWait
	clearMsg
	"""
	いくら、かがくが はったつしても
	だいしぜんの チカラのまえでは、
	なすすべは ないんじゃよ
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	やっぱり あのコオリが
	げんいん だったんだー
	"""
	keyWait
	clearMsg
	"""
	まさか、インターネットから
	しぜんさいがいを まきおこすだなんて
	"""
	keyWait
	clearMsg
	"""
	ネットワークしゃかいも、
	よしあしね
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	テレビも れいぞうこも
	ウイルスに やられちゃってさ・・・
	"""
	keyWait
	clearMsg
	"""
	よくない よかんが するのは
	アタシ だけかい?
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	オフィシャルネットバトラーが ピンチの
	今こそ、オレたち しみんネットバトラーが
	立ち上がらなければ!
	"""
	keyWait
	end
}
script 42 mmbn2 {
	checkChapter
		lower = 65
		upper = 72
		jumpIfInRange = 56
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	コイツの いうことは
	もっとも なんだが・・・
	"""
	keyWait
	clearMsg
	"""
	ここ2、3日
	じけんのいらいが やたら おおくてよ
	"""
	keyWait
	clearMsg
	"""
	しょうじき
	コトブキスクエアの ちょうさまで
	手が まわんねえんだ・・・
	"""
	keyWait
	end
}
script 43 mmbn2 {
	checkChapter
		lower = 65
		upper = 72
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	ゴスペルが
	かいめつしていない だなんて・・・
	"""
	keyWait
	clearMsg
	"""
	できれば
	まちがいで あってほしい ものだが・・・
	"""
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	となりまちの コトブキ町行きの
	メトロラインが 今こうじ中 なんだって
	"""
	keyWait
	clearMsg
	"""
	でも いつもみたいに
	ワクワクした きもちに ならないのは
	ゴスペルの せいだよね
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	てんぺんちいが おさまって
	ヤレヤレ ですじゃ・・・
	"""
	keyWait
	clearMsg
	"""
	・・・へ?
	また じけんかも しらん?
	"""
	keyWait
	clearMsg
	"カンベン してほしい ですじゃ・・・"
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	光くん、
	あんまり であるいちゃ ダメよ・・・
	"""
	keyWait
	clearMsg
	"""
	いつ じけんが おきるか
	わからないんだからね
	"""
	keyWait
	clearMsg
	"""
	・・・ほかの子は
	ちゃんと いえに いるかしら
	"""
	textSpeed
		delay = 15
	"・・・"
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"ゴスペル・・・"
	waitSkip
		frames = 30
	"""
	いったい
	なにを たくらんで いるのか・・・
	"""
	keyWait
	clearMsg
	"""
	しょうたいが わからないから
	よけい ブキミだな・・・
	"""
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	なに・・・
	やはり コトブキスクエアで いへんが!?
	"""
	keyWait
	clearMsg
	"""
	クソッ!!
	はやく いらいを かたづけなくては!
	"""
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"見えちゃうの・・・"
	keyWait
	clearMsg
	"""
	あなたたちに
	バスティングレベルSで デリートされた
	レベル3の ボスナビの たましいが・・・
	"""
	keyWait
	clearMsg
	"今 見える たましいは・・・"
	keyWait
	clearMsg
	jump
		target = 101
}
script 101 mmbn2 {
	checkFlag
		flag = 90
		jumpIfTrue = continue
		jumpIfFalse = 102
	mugshotShow
		mugshot = Girl
	msgOpen
	"エアーマン・・・"
	keyWait
	clearMsg
	jump
		target = 102
}
script 102 mmbn2 {
	checkFlag
		flag = 101
		jumpIfTrue = continue
		jumpIfFalse = 103
	mugshotShow
		mugshot = Girl
	msgOpen
	"ガッツマン・・・"
	keyWait
	clearMsg
	jump
		target = 103
}
script 103 mmbn2 {
	checkFlag
		flag = 98
		jumpIfTrue = continue
		jumpIfFalse = 104
	mugshotShow
		mugshot = Girl
	msgOpen
	"トードマン・・・"
	keyWait
	clearMsg
	jump
		target = 104
}
script 104 mmbn2 {
	checkFlag
		flag = 91
		jumpIfTrue = continue
		jumpIfFalse = 105
	mugshotShow
		mugshot = Girl
	msgOpen
	"クイックマン・・・"
	keyWait
	clearMsg
	jump
		target = 105
}
script 105 mmbn2 {
	checkFlag
		flag = 103
		jumpIfTrue = continue
		jumpIfFalse = 106
	mugshotShow
		mugshot = Girl
	msgOpen
	"ゲートマン・・・"
	keyWait
	clearMsg
	jump
		target = 106
}
script 106 mmbn2 {
	checkFlag
		flag = 92
		jumpIfTrue = continue
		jumpIfFalse = 107
	mugshotShow
		mugshot = Girl
	msgOpen
	"カットマン・・・"
	keyWait
	clearMsg
	jump
		target = 107
}
script 107 mmbn2 {
	checkFlag
		flag = 93
		jumpIfTrue = continue
		jumpIfFalse = 108
	mugshotShow
		mugshot = Girl
	msgOpen
	"シャドーマン・・・"
	keyWait
	clearMsg
	jump
		target = 108
}
script 108 mmbn2 {
	checkFlag
		flag = 99
		jumpIfTrue = continue
		jumpIfFalse = 109
	mugshotShow
		mugshot = Girl
	msgOpen
	"サンダーマン・・・"
	keyWait
	clearMsg
	jump
		target = 109
}
script 109 mmbn2 {
	checkFlag
		flag = 100
		jumpIfTrue = continue
		jumpIfFalse = 110
	mugshotShow
		mugshot = Girl
	msgOpen
	"スネークマン・・・"
	keyWait
	clearMsg
	jump
		target = 110
}
script 110 mmbn2 {
	checkFlag
		flag = 102
		jumpIfTrue = continue
		jumpIfFalse = 111
	mugshotShow
		mugshot = Girl
	msgOpen
	"ブルース・・・"
	keyWait
	clearMsg
	jump
		target = 111
}
script 111 mmbn2 {
	checkFlag
		flag = 94
		jumpIfTrue = continue
		jumpIfFalse = 112
	mugshotShow
		mugshot = Girl
	msgOpen
	"ナイトマン・・・"
	keyWait
	clearMsg
	jump
		target = 112
}
script 112 mmbn2 {
	checkFlag
		flag = 95
		jumpIfTrue = continue
		jumpIfFalse = 113
	mugshotShow
		mugshot = Girl
	msgOpen
	"マグネットマン・・・"
	keyWait
	clearMsg
	jump
		target = 113
}
script 113 mmbn2 {
	checkFlag
		flag = 97
		jumpIfTrue = continue
		jumpIfFalse = 114
	mugshotShow
		mugshot = Girl
	msgOpen
	"ヒートマン・・・"
	keyWait
	clearMsg
	jump
		target = 114
}
script 114 mmbn2 {
	checkFlag
		flag = 96
		jumpIfTrue = continue
		jumpIfFalse = 115
	mugshotShow
		mugshot = Girl
	msgOpen
	"フリーズマン・・・"
	keyWait
	clearMsg
	jump
		target = 115
}
script 115 mmbn2 {
	checkFlag
		flag = 106
		jumpIfTrue = continue
		jumpIfFalse = 116
	mugshotShow
		mugshot = Girl
	msgOpen
	"ファラオマン・・・"
	keyWait
	clearMsg
	jump
		target = 116
}
script 116 mmbn2 {
	checkFlag
		flag = 105
		jumpIfTrue = continue
		jumpIfFalse = 117
	mugshotShow
		mugshot = Girl
	msgOpen
	"ナパームマン・・・"
	keyWait
	clearMsg
	jump
		target = 117
}
script 117 mmbn2 {
	checkFlag
		flag = 104
		jumpIfTrue = continue
		jumpIfFalse = 118
	mugshotShow
		mugshot = Girl
	msgOpen
	"プラネットマン・・・"
	keyWait
	clearMsg
	jump
		target = 118
}
script 118 mmbn2 {
	checkFlag
		flag = 90
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 101
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 98
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 91
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 103
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 92
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 93
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 99
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 100
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 102
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 94
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 95
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 97
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 96
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 106
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 105
		jumpIfTrue = 119
		jumpIfFalse = continue
	checkFlag
		flag = 104
		jumpIfTrue = 119
		jumpIfFalse = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"・・・なにも ないみたい・・・"
	keyWait
	end
}
script 119 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"こんだけよ・・・"
	keyWait
	clearMsg
	jump
		target = 120
	end
}
script 120 mmbn2 {
	checkFlag
		flag = 90
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 101
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 98
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 91
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 103
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 92
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 93
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 99
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 100
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 102
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 94
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 95
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 97
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 96
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 106
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 105
		jumpIfTrue = continue
		jumpIfFalse = 121
	checkFlag
		flag = 104
		jumpIfTrue = continue
		jumpIfFalse = 121
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	・・・って
	アタシが 見える たましいは
	もう ぜんぶ 見えてるみたい・・・
	"""
	keyWait
	clearMsg
	"""
	いつか あなたたちに おとずれる
	へんかが、あなたたちに とって
	いいもので ありますように・・・
	"""
	keyWait
	end
}
script 121 mmbn2s {
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 16
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ワタシの サブチップ・・・
	すこしでしたら おわけしますが
	ごらんに なりますか?
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
	"みる "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"みない"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = 181,
			jump = continue
		]
	startShop
		shop = 16
}
script 181 mmbn2 {
	clearMsg
	"「そなえあれば うれいナシ」 ですよ"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	む・・・よく かんがえたら
	いまは もっていませんでした・・・
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 256
		jumpIfTrue = 196
		jumpIfFalse = continue
	checkFlag
		flag = 255
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 255
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	よ、熱斗!
	とつぜんなんだけど、
	"""
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 50
	" "
	printCode
		buffer = 0
		code = J
	"""
	」
	もってないか?
	"""
	keyWait
	clearMsg
	"""
	もしもってたら、オイラの
	「
	"""
	printChip
		buffer = 0
		chip = 7
	" "
	printCode
		buffer = 0
		code = *
	"""
	」と
	こうかんしてほしいんだ
	"""
	keyWait
	clearMsg
	"""
	オイラの ニィちゃんの
	たんじょうびいわいに あげたいんだけど
	どこにもないんだよ
	"""
	keyWait
	clearMsg
	"どうだい?\n"
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
			jump = 191,
			jump = continue,
			jump = continue
		]
	"""
	ざんねんだけど、しかたないね
	ほかをあたってみるよ
	サンキュー
	"""
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 50
		code = J
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 256
	itemTakeChip
		chip = 50
		code = J
		amount = 1
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	うわ~、ありがとう!
	もつべきものは、トモダチダだね!
	そんじゃあ、コレこうかんだったね
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 7
		code = *
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 7
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	これで、ニィちゃんも
	よろこぶよ!
	"""
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	や、熱斗!
	「
	"""
	printChip
		buffer = 0
		chip = 50
	" "
	printCode
		buffer = 0
		code = J
	"""
	」
	やっぱり みつからないや
	"""
	keyWait
	clearMsg
	"""
	たのむよ~オイラの
	「
	"""
	printChip
		buffer = 0
		chip = 7
	" "
	printCode
		buffer = 0
		code = *
	"」と"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 50
	" "
	printCode
		buffer = 0
		code = J
	"""
	」
	こうかんしておくれよ
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
	"OK "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"NO"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 191,
			jump = continue,
			jump = continue
		]
	"""
	これも、うんめいだよね・・・
	もちっと、さがしてみるよ
	ありがと・・・
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"う~む、熱斗 「"
	printChip
		buffer = 0
		chip = 50
	" "
	printCode
		buffer = 0
		code = J
	"""
	」
	どこにもないよ?
	"""
	keyWait
	clearMsg
	"""
	もしかしてフォルダのなかに
	はいってたりしない?
	"""
	keyWait
	clearMsg
	"""
	ちゃんと、リュックのなかに
	いれとかないと、チップがちゃんとあるか
	わからないよ
	"""
	keyWait
	clearMsg
	"""
	もしもってるんだったら、
	リュックにいれといてね
	"""
	keyWait
	end
}
script 196 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	これで、ニィちゃんも おおよろこびするよ
	サンキューな、熱斗!
	"""
	keyWait
	end
}
script 198 mmbn2 {
	checkFlag
		flag = 3207
		jumpIfTrue = 206
		jumpIfFalse = continue
	checkFlag
		flag = 149
		jumpIfTrue = 203
		jumpIfFalse = continue
	checkFlag
		flag = 148
		jumpIfTrue = 201
		jumpIfFalse = continue
	flagSet
		flag = 148
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	いらいしたのは、ワタシだが・・・
	もしかして、キミが
	いらいを きいてくれるのか?
	"""
	keyWait
	clearMsg
	mugshotAnimate
		animation = 0
	"""
	(まてよ ・・・コドモのほうが
	はんにんを けいかいさせずにすむか)
	"""
	keyWait
	clearMsg
	mugshotAnimate
		animation = 1
	"まずは、このしゃしんを みてくれ"
	keyWait
	clearMsg
	jump
		target = 199
}
script 199 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	mugshotAnimate
		animation = 0
	"このカオを よくおぼえておいてくれよ"
	keyWait
	clearMsg
	"""
	このオトコを さがしてきてほしい
	もし、みつけたらナニをしているのか
	きいてくれ
	"""
	keyWait
	clearMsg
	jump
		target = 200
}
script 200 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	それができたら、
	おじさんに ほうこくしにきてくれ
	よろしくたのんだよ
	"""
	keyWait
	end
}
script 201 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	どうした? さがしてくる
	オトコのカオを わすれたのか?
	"""
	keyWait
	clearMsg
	jump
		target = 202
}
script 202 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	mugshotAnimate
		animation = 0
	"""
	このカオだ
	よーくおぼえておいてくれよ~
	"""
	keyWait
	end
}
script 203 mmbn2 {
	flagSet
		flag = 3207
	flagClear
		flag = 82
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	おお しょうねん、ヤツの
	いどころを つきとめてくれたか!!
	"""
	keyWait
	clearMsg
	"""
	アイツは しめいてはい中の
	きょうあくはん だったんだ!
	"""
	keyWait
	clearMsg
	"さっそく、しょに れんらくするよ"
	keyWait
	clearMsg
	"""
	はんにんけんきょに ごきょうりょく
	かんしゃ するぞ!!
	"""
	keyWait
	clearMsg
	"さて、ほうしゅうを しはらおう"
	keyWait
	clearMsg
	jump
		target = 204
}
script 204 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 62
		code = Y
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 62
	" "
	printCode
		buffer = 0
		code = Y
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
		target = 205
}
script 205 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	じつは、おじさん けいじだったんだ
	だまっていて すまなかったね
	ハハハハ
	"""
	keyWait
	end
}
script 206 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	はんにんを、つかまえても つかまえても
	いっこうにはんざいは、へらない・・・
	われわれもきを ひきしめないとな
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkFlag
		flag = 89
		jumpIfTrue = 239
		jumpIfFalse = continue
	msgOpen
	"""
	かくれんぼの かくればしょに
	もってこいの アナボコやま だ
	"""
	keyWait
	clearMsg
	"""
	だれかが おいて いったのだろうか、
	アナボコやまの わきに こわれた
	おもちゃが おちている・・・
	"""
	keyWait
	clearMsg
	"よく見ると プラグイン できそうだ"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	この すべりだいは、
	すべった さきに、すなばがある
	あんぜんせっけいだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	この こうえんのシンボル
	リスのぞうだ
	"""
	keyWait
	clearMsg
	"""
	秋原町で なぜ、リスなのか・・・
	それは、えいえんのナゾだ
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	カギが かかっている
	どうやら るすのようだ
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	このいえは、ずいぶん まえから
	ダレも すんでいない
	"""
	keyWait
	end
}
script 225 mmbn2 {
	checkChapter
		lower = 1
		upper = 1
		jumpIfInRange = 240
		jumpIfOutOfRange = continue
	msgOpen
	"""
	いぬごやがたの、セキュリティシステムだ
	ドロボウが はいろうとすると、
	"""
	keyWait
	clearMsg
	"""
	もうけん さながらの なきごえを だして
	おいはらってくれる
	"""
	keyWait
	clearMsg
	"""
	もちろん、メンテナンスように
	プラグインできるように なっている
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"はりがみが してある・・・"
	keyWait
	clearMsg
	"「いっしんじょうの つごうで、いちじ\n へいてん させていただきます でマス」"
	keyWait
	clearMsg
	"と かいてある"
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	じゅうこうな つくりの
	こうもんだ・・・
	"""
	keyWait
	clearMsg
	"どこか、いげんを かんじさせる"
	keyWait
	end
}
script 228 mmbn2 {
	checkChapter
		lower = 2
		upper = 3
		jumpIfInRange = 232
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"メイルちゃんの いえ だけど・・・"
	waitSkip
		frames = 30
	"\nまだ 学校に いるんじゃない?"
	keyWait
	end
}
script 229 mmbn2 {
	checkChapter
		lower = 2
		upper = 3
		jumpIfInRange = 233
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"デカオくんの いえ だけど・・・"
	waitSkip
		frames = 30
	"\nまだ 学校に いるんじゃない?"
	keyWait
	end
}
script 230 mmbn2 {
	checkChapter
		lower = 2
		upper = 3
		jumpIfInRange = 234
		jumpIfOutOfRange = continue
	checkChapter
		lower = 8
		upper = 9
		jumpIfInRange = 235
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やいとちゃんの いえ だけど・・・"
	waitSkip
		frames = 30
	"\nまだ 学校に いるんじゃない?"
	keyWait
	end
}
script 231 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	そこは、
	メトロラインの 駅の入口 だけど・・・
	"""
	keyWait
	clearMsg
	"""
	熱斗くん、あしたから あそびに
	行けるんだから、今日は あまりとおくに
	行くのは やめておこっ
	"""
	keyWait
	end
}
script 232 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、まちあわせは ネットの中だよ?
	プラグインしてくれたら ボクが行くよ
	"""
	keyWait
	end
}
script 233 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、まちあわせは ネットの中だよ?
	プラグインしてくれたら ボクが行くよ
	"""
	keyWait
	end
}
script 234 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"カギが かかってるけど・・・"
	waitSkip
		frames = 30
	"\nやいとちゃん かえってきてるのかな?"
	keyWait
	end
}
script 235 mmbn2 {
	msgOpen
	"「世界いっしゅう りょこう に\n 行っているので いません」"
	waitSkip
		frames = 30
	"\nと ドアに はりがみが してある・・・"
	keyWait
	clearMsg
	jump
		target = 236
}
script 236 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"んーと、"
	waitSkip
		frames = 30
	"\n今日まで いないみたいだね"
	keyWait
	flagSet
		flag = 591
	end
}
script 237 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、まちあわせばしょは バスてい、
	みんな そこに いるよ?
	"""
	keyWait
	end
}
script 238 mmbn2 {
	msgOpen
	"バスてい だ"
	keyWait
	end
}
script 239 mmbn2 {
	msgOpen
	"""
	かくれんぼの かくればしょに
	もってこいの アナボコやま だ
	"""
	keyWait
	end
}
script 240 mmbn2 {
	msgOpen
	"""
	いぬごやがたの、セキュリティシステムだ
	ドロボウが はいろうとすると、
	"""
	keyWait
	clearMsg
	"""
	もうけん さながらの なきごえを だして
	おいはらってくれる
	"""
	keyWait
	clearMsg
	"""
	メンテナンスように プラグインできるが
	それは あさ やった
	"""
	keyWait
	end
}
