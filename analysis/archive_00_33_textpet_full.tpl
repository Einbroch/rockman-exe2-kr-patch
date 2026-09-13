@archive 075E7E0
@size 255

script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ミリオネアさんに
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
	"いいえ"
	select
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = 3,
			jump = 4,
			jump = continue
		]
	end
}
script 3 mmbn2 {
	checkFlag
		flag = 74
		jumpIfTrue = 5
		jumpIfFalse = continue
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"なんだか ゾクゾク! してきたわ!!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 4 mmbn2 {
	flagClear
		flag = 75
	flagClear
		flag = 76
	flagClear
		flag = 77
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"""
	そうね・・・かんじるわ、
	あなたには なにかが たりないの
	"""
	keyWait
	end
}
script 5 mmbn2 {
	flagClear
		flag = 75
	flagClear
		flag = 76
	flagClear
		flag = 77
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"""
	まだ まえのよいんが のこってるの、
	そんなとき さそっても
	レディは その気に ならないものよ
	"""
	keyWait
	end
}
script 6 mmbn2 {
	checkFlag
		flag = 75
		jumpIfTrue = 16
		jumpIfFalse = continue
	checkFlag
		flag = 76
		jumpIfTrue = 17
		jumpIfFalse = continue
	checkFlag
		flag = 77
		jumpIfTrue = 18
		jumpIfFalse = 18
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	これで とられたもの とりもどしたね!
	いっけん らくちゃく!
	"""
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"""
	あなたには
	こうふん させられましてよ・・・
	"""
	keyWait
	clearMsg
	checkChapter
		lower = 40
		upper = 40
		jumpIfInRange = 7
		jumpIfOutOfRange = continue
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"くやしいけど "
	waitSkip
		frames = 15
	"し・"
	waitSkip
		frames = 15
	"げ・"
	waitSkip
		frames = 15
	"き・"
	waitSkip
		frames = 15
	"て・"
	waitSkip
		frames = 15
	"き"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"カ・"
	waitSkip
		frames = 15
	"イ・"
	waitSkip
		frames = 15
	"カ・"
	waitSkip
		frames = 15
	"ン・"
	waitSkip
		frames = 15
	"!!"
	keyWait
	end
}
script 11 mmbn2 {
	flagSet
		flag = 74
	msgClose
	waitHold
}
script 12 mmbn2 {
	flagSet
		flag = 79
	flagClear
		flag = 2142
	flagClear
		flag = 75
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	soundPlay
		track = 133
	"""
	熱斗は、
	「リュックの中の バトルチップ」
	を とりもどした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 85
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 85
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 10000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	熱斗は、
	「10000ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 8
}
script 13 mmbn2 {
	flagSet
		flag = 80
	flagClear
		flag = 76
	end
}
script 14 mmbn2 {
	flagSet
		flag = 81
	flagClear
		flag = 77
	end
}
script 16 mmbn2 {
	checkFlag
		flag = 79
		jumpIfTrue = 9
		jumpIfFalse = continue
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"フフフ・・・"
	waitSkip
		frames = 30
	"\nまけたけど キモチよかったわ・・・"
	keyWait
	clearMsg
	"""
	やくそくどおり
	バトルチップは かえしてあげる
	だって じゅうぶん みたされたもの
	"""
	keyWait
	clearMsg
	"""
	あとこれは ワタクシからの キモチ、
	うけとってね
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 17 mmbn2 {
	checkFlag
		flag = 80
		jumpIfTrue = 9
		jumpIfFalse = continue
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"""
	この ほてり、
	あなたに つたわってるかしら?
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 18 mmbn2 {
	checkFlag
		flag = 81
		jumpIfTrue = 9
		jumpIfFalse = continue
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"まけたのに エクスタシー・・・"
	waitSkip
		frames = 20
	"\nあなたって つみな "
	waitSkip
		frames = 15
	"オ・"
	waitSkip
		frames = 15
	"ト・"
	waitSkip
		frames = 15
	"コ"
	keyWait
	clearMsg
	jump
		target = 14
}
script 25 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 93
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 61
		jumpIfInRange = 56
		jumpIfOutOfRange = continue
	checkChapter
		lower = 41
		upper = 41
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkFlag
		flag = 78
		jumpIfTrue = 38
		jumpIfFalse = continue
	checkFlag
		flag = 542
		jumpIfTrue = 35
		jumpIfFalse = continue
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"フフフ・・・"
	keyWait
	clearMsg
	jump
		target = 26
}
script 26 mmbn2 {
	checkChapter
		lower = 41
		upper = 72
		jumpIfInRange = 42
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ミリオネアさまは こうきな カタです
	よって、しもじものモノが きやすく
	はなしを することは かないません
	"""
	keyWait
	end
}
script 27 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 73
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 66
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 56
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"いらっしゃいませ!"
	keyWait
	clearMsg
	"""
	ここは 世界てきに ゆうめいな
	ほうせきの ブランドショップ よ
	"""
	keyWait
	clearMsg
	"""
	・・・といっても キミは
	あんまり きょうみが ないかな?
	"""
	keyWait
	end
}
script 28 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 91
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 81
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 74
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 67
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 56
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 46
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"いらっしゃいませ!"
	keyWait
	clearMsg
	"""
	だいふごうの ミリオネアふじん
	って しってる?
	"""
	keyWait
	clearMsg
	"""
	たくさん ほうせきを かってくれる
	ウチの おトクイさま なの
	"""
	keyWait
	clearMsg
	"""
	今なら
	おくの VIPルームに いらっしゃるわ
	"""
	keyWait
	end
}
script 29 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 82
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 47
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	ニホン人の かいものパワー には
	かんしん するね
	"""
	keyWait
	end
}
script 30 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 83
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ほうせき ってのは
	見てるだけで うっとりきちゃうねぇ・・・
	"""
	keyWait
	end
}
script 31 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 84
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 54
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	あ~この かがやき!
	ボーナス はたいて かっちゃおうかなぁ!
	"""
	keyWait
	end
}
script 32 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 85
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"キラキラ "
	waitSkip
		frames = 30
	"キラキラ・・・"
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ミリオネアさまは こうきな カタです
	よって・・・
	"""
	keyWait
	clearMsg
	jump
		target = 36
}
script 36 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"フフフ・・・"
	keyWait
	clearMsg
	"""
	よろしくてよ・・・このボーイなら
	たいくつを まぎらわせてくれる
	そんな気が するの・・・
	"""
	keyWait
	clearMsg
	"""
	それで・・・?
	ワタクシに なんのよう かしら?
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
	"バトルチップ かえして!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"おばさん きれいだね\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"おこづかい ちょうだい"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 37,
			jump = 39,
			jump = 40,
			jump = continue
		]
	end
}
script 37 mmbn2 {
	flagSet
		flag = 78
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"""
	あら? このバトルチップ
	あなたのモノだなんて いうの?
	"""
	keyWait
	clearMsg
	"""
	わたくし これを かうのに
	50万ゼニーも 出したのだけれど・・・
	"""
	keyWait
	clearMsg
	"""
	・・・よろしくてよ
	では こうしましょ
	"""
	keyWait
	clearMsg
	jump
		target = 38
}
script 38 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"""
	あなたが ワタクシの スネークマンとの
	ネットバトルに かてれば
	バトルチップを かえしてあげるわ
	"""
	keyWait
	clearMsg
	"""
	それだけ たのしめれば
	50万ゼニーの かちは あるもの・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 39 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"おべんちゃらは ききあきたの・・・"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"""
	あなた、ワタクシに
	しげきを あたえられる?
	"""
	keyWait
	clearMsg
	"はぁ・・・"
	waitSkip
		frames = 20
	"タ・"
	waitSkip
		frames = 15
	"イ・"
	waitSkip
		frames = 15
	"ク・"
	waitSkip
		frames = 15
	"ツ"
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"ひさびさに しげきてき でしたわ・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
script 42 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ミリオネアさまには きやすく
	はなしを することは かないませんが
	・・・
	"""
	waitSkip
		frames = 20
	"どうぞ おはなしかけ下さい"
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"いらっしゃいませ!"
	keyWait
	clearMsg
	"""
	あら?
	こんな あさから どうしたの?
	"""
	keyWait
	clearMsg
	"""
	ひょっとして
	ほうせきに きょうみが わいてきた?
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	ミリオネアふじんは
	今日は まだ お見えになってないわよ
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"こんな あさから・・・"
	keyWait
	clearMsg
	"""
	ホントに ニホン人の かいものパワーは
	スゴイね
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	いらっしゃいませー
	ほんじつは、こちらのアメジストが
	おすすめですよ~
	"""
	keyWait
	clearMsg
	"ほんの、1せんまんゼニーで ございま~す"
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"アラ ぼうや もうおかえり?"
	keyWait
	clearMsg
	"""
	こんど くるときは、
	どどんと ほうせきを かっていってよね
	"""
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	このみせに ならんでいる
	ほうせきを かうだなんて
	ワタシには、ムリさね
	"""
	keyWait
	clearMsg
	"""
	じゃぁ なんで、
	ここに いるかってかい?
	"""
	keyWait
	clearMsg
	"""
	それは
	ワタシも オンナって ことさよ
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	あのコ、
	あんなタカい ほうせきを かってるよ
	"""
	keyWait
	clearMsg
	"""
	さいきんの わかいコは
	おもいきりが いいねぇ・・・
	"""
	keyWait
	clearMsg
	"ワタシは 見てるだけで じゅうぶんだよ"
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"ほうせき・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"\n・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"\nかっちゃった・・・"
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"大きくなったら キット・・・"
	keyWait
	clearMsg
	"キラキラ "
	waitSkip
		frames = 30
	"キラキラ・・・"
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"ウフフ・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
script 60 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	こんな じょうきょうでも、
	ココに きてくださるなんて
	さすがは、ミリオネアふじん だわ
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	はぁ~、この、きょうあくな
	ひざしのおかげで、おきゃくさんが
	こないわ
	"""
	keyWait
	clearMsg
	"まったく、しょうばいに ならないわね"
	keyWait
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	こちらのダイヤモンドは
	いかがかしら?
	"""
	keyWait
	clearMsg
	"5せんまんゼニーに まけてあげるわよ"
	keyWait
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	タイクツよね~
	おきゃくさん こないかしら・・・
	"""
	keyWait
	end
}
script 73 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	このみせが ヒマだってことは、
	アメロッパじゅうの おみせも
	こんな じょうたいでしょうね
	"""
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	さっき、チラっとそとのようすを
	みたけど ほとんどダレも
	いなかったわ
	"""
	keyWait
	clearMsg
	"""
	けっこう タイヘンなコトに
	なってるみたいね
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	さすがは、ミリオネアふじんね
	あの さわぎの なかでも
	マユ ひとつ うごかさなかったわ
	"""
	keyWait
	clearMsg
	"こうきなかたは、ひとあじちがうわね"
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	やっと、おきゃくさんが
	もどってきてくれたわ
	やっと、しょうばいができるわ
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	にっこうが あんなに
	おそろしいモノ だったなんてね
	"""
	keyWait
	clearMsg
	"しぜんの きょういを おもいしったよ"
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	どんなコトが、あっても
	ほうせきを みにくると
	ココロが おちつくよ
	"""
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ま、また あたらしい ほうせきが
	ほしくなってきてしまったわ・・・
	"""
	keyWait
	clearMsg
	"""
	にんげんの よくぼうは、
	つきることが ないわね・・・
	"""
	keyWait
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	むこうの カウンターにいる
	おねえさん、このあいだも
	タカい ほうせき かってたけど、
	"""
	keyWait
	clearMsg
	"""
	また かってしまいそうな
	いきおいだよ
	"""
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"いらっしゃいませ!"
	keyWait
	clearMsg
	"""
	わかるでしょ、
	おみせを しめずに つづけることが
	わたしたちの たたかいなの
	"""
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	ミリオネアさま・・・
	こんなときでも ほうせきを
	かいにきて くださるなんて・・・
	"""
	keyWait
	clearMsg
	"""
	もはや じょうしきを
	ちょうえつ されているわ・・・
	"""
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	オレは あす
	ネットテロが おきている エリアに
	たびだつ・・・
	"""
	keyWait
	clearMsg
	"""
	そのまえに
	かのじょに おくっておきたいんだ、
	"""
	waitSkip
		frames = 15
	"\nリングをさ・・・"
	keyWait
	end
}
script 93 mmbn2 {
	mugshotShow
		mugshot = MsMillions
	msgOpen
	"オホホホホ・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
script 190 mmbn2 {
	checkFlag
		flag = 3217
		jumpIfTrue = 196
		jumpIfFalse = continue
	checkFlag
		flag = 170
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 169
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 169
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"いらっしゃいませー・・・"
	keyWait
	clearMsg
	"""
	あ、ネットバトラーのかたですね?
	ワタシが いらいしゃです
	"""
	keyWait
	clearMsg
	"""
	じつは、ウチの おみせの
	さいこうきゅう しょうひんが
	3つも、ぬすまれてしまいました
	"""
	keyWait
	clearMsg
	"""
	はんにんは、「かいとう 3しまい」
	といわれる 3にんしまいの
	ドロボウなんです
	"""
	keyWait
	clearMsg
	"""
	せかい かくちの ほうせきを
	ぬすんで あるいているそうなんです
	"""
	keyWait
	clearMsg
	"""
	もし、こんなコトが てんちょうに
	しれたら・・・ワタシ・・・
	"""
	keyWait
	clearMsg
	"""
	おねがいです!
	「かいとう 3しまい」から、
	ほうせきを とりもどしてください!
	"""
	keyWait
	clearMsg
	"""
	かのじょたちは、つかまりそうになると
	ウイルスを はなってくるそうなので、
	"""
	keyWait
	clearMsg
	"""
	PETを バグらされないように
	きを つけてください!
	"""
	keyWait
	clearMsg
	"""
	あと、おしろの ちかくで
	かのじょたちと おもわれる
	じょせいが、いたそうです
	"""
	keyWait
	clearMsg
	"""
	あと、はなしかたに、とくちょうが
	あるらしいんですけど・・・
	"""
	keyWait
	clearMsg
	"""
	これだけの じょうほうで
	みつけられます?
	"""
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"いらいの かくにんですか?"
	keyWait
	clearMsg
	"""
	この、おみせから むすまれた
	3つの ほうせきを とりかえして
	ほしいんです
	"""
	keyWait
	clearMsg
	"""
	はんにんは、「かいとう 3しまい」
	といわれる 3にんしまいの
	ドロボウで、
	"""
	keyWait
	clearMsg
	"""
	はなしかたに、とくちょうが
	あるらしいです
	"""
	keyWait
	clearMsg
	"""
	おしろの ちかくで かのじょたちと
	おもわれる じょせいが いたという
	じょうほうが はいっています
	"""
	keyWait
	clearMsg
	"今、わかるコトは これくらいです"
	keyWait
	clearMsg
	"どうか、よろしくおねがいします"
	keyWait
	end
}
script 192 mmbn2 {
	checkItem
		item = 54
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 191
	checkItem
		item = 55
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 191
	checkItem
		item = 56
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 191
	flagSet
		flag = 3217
	flagClear
		flag = 82
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	ほ、ほうせきを とりもどして
	くれたんですか?
	"""
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotHide
	msgOpen
	itemTake
		item = 54
		amount = 1
	itemTake
		item = 55
		amount = 1
	itemTake
		item = 56
		amount = 1
	"熱斗は、"
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 54
	"""
	」
	「
	"""
	printItem
		buffer = 0
		item = 55
	"""
	」
	「
	"""
	printItem
		buffer = 0
		item = 56
	"」を、てわたした!!"
	keyWait
	clearMsg
	jump
		target = 194
}
script 194 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"わぁ! ありがとうございます!!"
	keyWait
	clearMsg
	"""
	さすが、ニホンのネットバトラーは
	ゆうしゅうね!
	"""
	keyWait
	clearMsg
	"これ、おれいです!"
	keyWait
	clearMsg
	jump
		target = 195
}
script 195 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 120
		code = Z
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 120
	" "
	printCode
		buffer = 0
		code = Z
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 196
}
script 196 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	これで、ワタシのクビが
	つながったわ!
	"""
	keyWait
	clearMsg
	"ほんとうに、かんしゃします"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"ルビーの しゃしんだ"
	keyWait
	clearMsg
	"""
	じつは、ルビーと サファイアは、
	おなじしゅるいの こうぶつだ
	"""
	keyWait
	clearMsg
	"""
	サファイアの中でも アカいものだけを
	ルビーとよぶ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	どれも、いっきゅうひんの ほうせきだ
	しかし、めが とびでるほど タカい
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	きらびやかな ほうせきが
	じょせいの ココロをみりょうする・・・
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	こちらのコーナーは、しょみんでも
	ガンバれば てにはいる ねだんの
	しょうひんが、おかれている
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	ダイヤモンドの しゃしん だ
	うつくしいが ホンモノには、
	とうていかなわない
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ショウケースの中には、けんらんごうかな
	そうしょくを ほどこされた
	アクセサリーが ならんでいる
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	サファイアで、できた アクセサリーの
	しゃしんだ・・・
	"""
	keyWait
	clearMsg
	"""
	よく とれては いるが、
	すこし、ものたりない
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	かなり こうきゅうなツボだ
	これほどの ツボは、
	そうそう みつからない
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	しょだいアメロッパこくおうが
	かぶっていたといわれる
	おうかんだ
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"""
	ミリオネアふじんの カバンだ
	電子ロックに なっていて
	プラグイン できるようだ!
	"""
	keyWait
	end
}
