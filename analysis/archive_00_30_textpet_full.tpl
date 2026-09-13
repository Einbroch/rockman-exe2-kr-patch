@archive 075BB94
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ホテル、ここ みたいだね・・・
	じゃあ へやに 入ろっか
	"""
	keyWait
	flagClear
		flag = 2161
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 36
		jumpIfOutOfRange = continue
	checkFlag
		flag = 531
		jumpIfTrue = 18
		jumpIfFalse = continue
	checkChapter
		lower = 38
		upper = 38
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ハロー ボーイ!!
	ここは ダウンタウン だぜ!
	"""
	keyWait
	clearMsg
	"え? オレが チップごうとう?"
	waitSkip
		frames = 30
	"""
	
	いくら オレに にたかおの ヤツが
	おおいからって カンベン してくれよな
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 57
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 37
		jumpIfOutOfRange = continue
	checkFlag
		flag = 531
		jumpIfTrue = 19
		jumpIfFalse = continue
	checkChapter
		lower = 38
		upper = 38
		jumpIfInRange = 16
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	ハイ! どしたの うかないかお して?
	なにか おてつだい しようか?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ホテルどこ? "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いらない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 3,
			jump = continue,
			jump = continue
		]
	"""
	あら?
	アメロッパ人は しんよう できない
	って かお してる・・・
	"""
	keyWait
	clearMsg
	"""
	そりゃ わるいヤツも いるけど
	それは どこのクニでも おなじでしょ?
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	ひとつ目の まがりかどの ところよ
	トビラの上に 「HOTEL」 って
	かいてあるわ
	"""
	keyWait
	end
}
script 4 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 58
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 38
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"ソーリー! いそがしいんだ"
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 82
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 59
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"いそいでんだ、わるいなっ!"
	keyWait
	end
}
script 6 mmbn2 {
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkChapter
		lower = 41
		upper = 41
		jumpIfInRange = 28
		jumpIfOutOfRange = continue
	checkFlag
		flag = 535
		jumpIfTrue = 27
		jumpIfFalse = continue
	checkChapter
		lower = 39
		upper = 39
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	ここは 世界の けいざいの
	ちゅうしんち だからね
	みんな いそがしく してんのさ
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"あら!! 光くん じゃない!"
	keyWait
	clearMsg
	"先生も お休みなの!"
	keyWait
	clearMsg
	"""
	のこりの おかね・・・
	グルメか ほうせきか・・・
	"""
	waitSkip
		frames = 30
	"\nあ~ まよっちゃうな~"
	keyWait
	end
}
script 8 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	すみまセーン
	サキを いそいで おりマスので
	みちを あけてクダサーイ
	"""
	keyWait
	end
}
script 9 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 102
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	checkChapter
		lower = 39
		upper = 40
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	ホテルの よこに
	ヘンな きかいが あんだろ?
	"""
	keyWait
	clearMsg
	"""
	アレ ヘンなニホン人が おいていったんだ
	「ここに おいていく でマス」
	とか いってさ!
	"""
	keyWait
	clearMsg
	"ニホン人は みんな あんなの なのか?"
	keyWait
	end
}
script 10 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 103
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 63
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkFlag
		flag = 531
		jumpIfTrue = 20
		jumpIfFalse = continue
	checkChapter
		lower = 38
		upper = 38
		jumpIfInRange = 17
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	フフ・・・
	ニホンの オトコのコ って
	ワイルドで ステキね!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ハロー ボーイ!!
	ここは ダウンタウン だぜ!
	"""
	keyWait
	clearMsg
	"んだよ! しけたツラ してんなよ!"
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"ハイ! どしたの?"
	waitSkip
		frames = 30
	"""
	
	さっきより ますます うかないかお
	してる・・・
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	ニホンの オトコのコ・・・
	さっきより ワイルドじゃ なくなったね
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ハロー ボーイ!!
	ここは ダウンタウン だぜ!
	"""
	keyWait
	clearMsg
	"""
	ゲンキ 出たみたいじゃねぇか!
	ボーイは そうでないとな!
	"""
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"ハイ! いいスマイルね!"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	やっぱり ワイルドで ステキね
	ニホンの オトコのコ!
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	ボーイ こまりごとかい?
	だったら アメロッパークに いる
	あのヒトに きいてみることさ
	"""
	keyWait
	clearMsg
	"""
	あのヒト ああ見えて
	けっこう たのもしいのさ
	"""
	keyWait
	clearMsg
	"ポッ"
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	おいおい! むこうに
	れいの ヘンなニホン人が いるぜ!
	"""
	keyWait
	clearMsg
	"ヤバいか!? コワいか!?"
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	どうだい?
	あのヒト たよりに なるだろう?
	"""
	keyWait
	clearMsg
	"ポッ"
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"ボーイ ひとこと いっておくがね、"
	keyWait
	clearMsg
	"""
	今日 おきたことは
	今日中に カタを つけておきなよ
	"""
	keyWait
	clearMsg
	"""
	あしたが 今日とおなじ ほしょうは
	どこにも ないもの なのさ
	"""
	keyWait
	clearMsg
	"""
	おもいあたる フシが
	なければ ベツに いいんだけどね
	"""
	keyWait
	end
}
script 30 mmbn2 {
	checkFlag
		flag = 542
		jumpIfTrue = 34
		jumpIfFalse = continue
	checkFlag
		flag = 604
		jumpIfTrue = 33
		jumpIfFalse = continue
	checkFlag
		flag = 602
		jumpIfTrue = 32
		jumpIfFalse = continue
	flagSet
		flag = 602
	mugshotShow
		mugshot = Higsby
	msgOpen
	"""
	さいきょうコンビ
	ふっかつの ようでマスな
	なによりでマス!!
	"""
	keyWait
	clearMsg
	"""
	それは そうと、さっきは
	とりみだして スマンかったでマス・・・
	これは おわびと あと おみまいでマス
	"""
	keyWait
	clearMsg
	jump
		target = 31
}
script 31 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 43
		code = W
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 43
	" "
	printCode
		buffer = 0
		code = W
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
	itemGiveChip
		chip = 20
		code = *
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 20
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
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 40
		code = I
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 40
	" "
	printCode
		buffer = 0
		code = I
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
		target = 32
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"さあ いくのだ! でマス!!"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"アヤヤヤー・・・「"
	printChip
		buffer = 0
		chip = 111
	" "
	printCode
		buffer = 0
		code = *
	"""
	」は
	レアで ないでマスー
	"""
	waitSkip
		frames = 15
	"\nもってないでマスー・・・"
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"そろそろ アッシは たびだつでマス・・・"
	waitSkip
		frames = 20
	"\nまた あいましょう! "
	waitSkip
		frames = 20
	"でマス!"
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1820
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"グッモーニン! ボーイ!!"
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"まぶしい・・・"
	keyWait
	clearMsg
	"""
	でも、
	この キラキラさしこむ あさのひざし
	アタシ すきだな
	"""
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ソーリー! いそがないと
	オフィスに まにあわないんだ
	"""
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	アメロッパは
	あさから かっきが あるわねぇ~
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	すみまセーン
	きょうも ミーは いそいでおりマース!
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"また あったね"
	keyWait
	clearMsg
	"""
	ひょっとして ユーとミー
	えんが あるのかもね!
	"""
	keyWait
	clearMsg
	"""
	ユー、
	ガールフレンドは いるの?
	"""
	keyWait
	end
}
script 45 mmbn2 {
	checkItem
		item = 29
		amount = 1
		jumpIfEqual = 55
		jumpIfGreater = 55
		jumpIfLess = continue
	checkItem
		item = 28
		amount = 1
		jumpIfEqual = 52
		jumpIfGreater = 52
		jumpIfLess = continue
	checkItem
		item = 27
		amount = 1
		jumpIfEqual = 49
		jumpIfGreater = 49
		jumpIfLess = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"ハーイ! ボーイ!"
	keyWait
	clearMsg
	"""
	アメロッパの おみやげ
	かっていかない?
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
	"うん! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いらない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 46,
			jump = continue,
			jump = continue
		]
	"""
	オー せめて、しょうひんだけでも
	みていってよ!
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"まずは、コイツだ!"
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 27
	"」"
	keyWait
	clearMsg
	"""
	むかし アメロッパの おひめさまが
	つけていたという おタカラだぜ!
	"""
	keyWait
	clearMsg
	"""
	つうじょう かかく
	10まんゼニーのトコロ、
	こんかい かぎり
	"""
	keyWait
	clearMsg
	"""
	1000ゼニーで だい ごほうしだ!
	かうかい?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"うん! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いらない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 47,
			jump = continue,
			jump = continue
		]
	"また、コエをかけてくれよ"
	keyWait
	end
}
script 47 mmbn2 {
	checkZenny
		amount = 1000
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 56
	checkTakeZenny
		amount = 1000
		jumpIfSurplus = continue
		jumpIfExact = continue
		jumpIfDeficit = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 27
	"""
	」 おかいあげー!
	サーンキュー! ボーイ!
	"""
	keyWait
	clearMsg
	"""
	しょうひんは、まだ あるから
	ほしかったら コエをかけてくれよ!
	"""
	keyWait
	clearMsg
	jump
		target = 48
}
script 48 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 27
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 27
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 49 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	つづいての しょうひんはコレだ!
	アメロッパじゅうの おこさまが
	"""
	keyWait
	clearMsg
	"みんな ほしがる にんきロボ!"
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 28
	"」"
	keyWait
	clearMsg
	"""
	これは、なかなか てに はいらない
	にんき しょうひんだぜ
	"""
	keyWait
	clearMsg
	"""
	これも、ごほうし かかくの
	1000ゼニーだ!
	"""
	keyWait
	clearMsg
	"かうかい?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"うん! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いらない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 50,
			jump = continue,
			jump = continue
		]
	"また、コエをかけてくれよ"
	keyWait
	end
}
script 50 mmbn2 {
	checkZenny
		amount = 1000
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 56
	checkTakeZenny
		amount = 1000
		jumpIfSurplus = continue
		jumpIfExact = continue
		jumpIfDeficit = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"はっはーー!"
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 28
	"""
	」 おかいあげー!
	サンキュー ふとっぱらボーイ!
	"""
	keyWait
	clearMsg
	"""
	でも、しょうひんは、もう ひとつ
	あるんだ よかったら
	また コエをかけてくれよ
	"""
	keyWait
	clearMsg
	jump
		target = 51
}
script 51 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 28
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 28
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	そして、ほんじつ おとどけする
	さいごの しょうひんは・・・
	コチラ!!
	"""
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 29
	"」"
	keyWait
	clearMsg
	"""
	かのじょへの プレゼントには、
	さいてきだぜ!!
	"""
	keyWait
	clearMsg
	"""
	これも、おおばんぶるまいで、
	1000ゼニーだ!!
	"""
	keyWait
	clearMsg
	"かうかい!?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"うん! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いらない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 53,
			jump = continue,
			jump = continue
		]
	"また、コエをかけてくれよ"
	keyWait
	end
}
script 53 mmbn2 {
	checkZenny
		amount = 1000
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 56
	checkTakeZenny
		amount = 1000
		jumpIfSurplus = continue
		jumpIfExact = continue
		jumpIfDeficit = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 29
	"」 おかいあげー!"
	keyWait
	clearMsg
	"""
	これにて、すべての しょうひんが
	うりきれましたーーー!
	"""
	keyWait
	clearMsg
	"サンキュー! サンキュー"
	keyWait
	clearMsg
	jump
		target = 54
}
script 54 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 29
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 29
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"ヘーイ! マジ サンキューな!"
	keyWait
	clearMsg
	"ニホンのヒトたちに ヨロシクな!"
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ボーイ、すまねえが おカネが
	たりないみたいだぜ
	"""
	keyWait
	clearMsg
	"おカネを よういしてからきな"
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	あら? きょう、ニホンに
	かえっちゃうの?
	"""
	keyWait
	clearMsg
	"""
	アメロッパは、どうだった?
	そんなに ワルいトコロじゃ
	なかったでしょ?
	"""
	keyWait
	clearMsg
	"よかったら、また あそびにおいで"
	keyWait
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ソーリー、やっぱりボクは
	いそがしいんだよ
	"""
	keyWait
	clearMsg
	"ビジー! ビジー!"
	keyWait
	end
}
script 59 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"わるいな、いそがしいんだよ!"
	keyWait
	clearMsg
	"ふう~"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	なんでも、おしろで タイヘンな
	じけんが おきたそうじゃないか
	"""
	keyWait
	clearMsg
	"""
	え? ボウヤが かいけつしたのかい?
	そりゃ たまげた!
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"ソーリー ソーリー いそいでるんだ!"
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	このあいだ、あのヘンな きかいに
	チップを10まい いれてみたんだ
	"""
	keyWait
	clearMsg
	"""
	したらよ! なんと ちょう レアチップの
	「
	"""
	printChip
		buffer = 0
		chip = 167
	" "
	printCode
		buffer = 0
		code = *
	"」が 出たんだ!"
	keyWait
	clearMsg
	"もう、うれしくってさ!"
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	もう、ニホンに かえっちゃうの?
	あなた ワリと このみ なのに
	ザンネンね
	"""
	keyWait
	end
}
script 66 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 72
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"今日は ヒトが すくないわね・・・"
	keyWait
	clearMsg
	"""
	まあ この日ざしじゃ ムリないわね、
	日にあたってると ハダが ヒリヒリ
	してくるもの
	"""
	keyWait
	end
}
script 67 mmbn2 {
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 73
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ビジー ビジーで、
	ハリー ハリー! なんですけど、
	今日は うごけませーーん
	"""
	keyWait
	clearMsg
	"""
	なんで こんなに あついんですか?
	ハァハァ・・・
	"""
	keyWait
	end
}
script 68 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 84
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 74
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	なんか
	オモテが さわがしいと おもって
	見にきたけど、
	"""
	keyWait
	clearMsg
	"""
	さすがに この 日ざしは
	じんじょうじゃ ないな!
	"""
	keyWait
	end
}
script 69 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 86
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	オモテどおりは 日が あたりすぎるわ
	ウラどおりにでも ひなんしたいけど、
	"""
	keyWait
	clearMsg
	"ウラどおりは コワいし・・・"
	waitSkip
		frames = 20
	"\nどうしよう・・・"
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	この、ひざしのせいで
	まちのきのうが ほとんどマヒしてるわ
	"""
	keyWait
	clearMsg
	"""
	このままでは、アメロッパじゅうの
	けいざいが、メチャクチャに
	なってしまうわ
	"""
	keyWait
	end
}
script 73 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ハーーーァ!!
	もう、シゴトどころじゃないデース!!
	きょうは、りんじきゅうぎょうデース!
	"""
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	まいにち、アクセクはたらく
	オモテどおりの ヤツらが
	へばってやがる
	"""
	keyWait
	clearMsg
	"""
	コイツは、ちょっと
	ヤバいかもしれないぜ
	"""
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	やっぱり、ウラどおりに
	ひなん しよう・・・
	"""
	keyWait
	clearMsg
	"このままじゃ、ヤバいきが するわ"
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	どうやら、いつものひざしに
	もどったみたいね
	"""
	keyWait
	clearMsg
	"""
	これで、アメロッパも かっきを
	とりもどすコトが できるわ
	"""
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	さぁ、シゴト さいかいだ!
	やすんでいた ぶんを
	とりもどすぞー!!
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ハハーーッ!!
	シゴト、シゴトデース!
	"""
	keyWait
	clearMsg
	"がんばりマース!"
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"やっと、そとに でるコトができるわ"
	keyWait
	clearMsg
	"""
	やっぱり、いえの なかに
	とじこもっておると
	カラダが なまってしまうわ
	"""
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	これからは、オモテどおりと
	ウラどおりの こうりゅうを
	ふかめて いかねえとな
	"""
	keyWait
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	さぁ、チップあつめに
	せいを だすぜ!
	"""
	keyWait
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	やっぱ、ろしゅつどが たかいと、
	にっこうが、キビシいわ
	"""
	keyWait
	clearMsg
	"""
	ひやけどめを、たくさん
	かいこまなきゃ
	"""
	keyWait
	end
}
script 95 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	今こそ
	だんけつが ひつようだぜ エブリワン!!
	"""
	keyWait
	clearMsg
	"ワンツー!"
	keyWait
	clearMsg
	"アメロッパ! "
	waitSkip
		frames = 15
	"アメロッパ!"
	keyWait
	end
}
script 96 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"アメロッパ! "
	waitSkip
		frames = 15
	"アメロッパ!"
	keyWait
	end
}
script 97 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"アメロッパ! "
	waitSkip
		frames = 15
	"アメロッパ!"
	keyWait
	end
}
script 98 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"アメロッパ! "
	waitSkip
		frames = 15
	"アメロッパ!"
	keyWait
	end
}
script 99 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	むこうで
	みんな だんけつ してたでしょ?
	"""
	keyWait
	clearMsg
	"""
	ニホンでは
	あんまりない こうけい かもしれないけど
	あれが わたしたちの でんとうなの
	"""
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	オフィスが
	ゴスペルの ウイルスに おそわれたんだ!
	"""
	keyWait
	clearMsg
	"ソーリー! そこを どいてくれ!"
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	すみまセーン
	サキを いそぎマース!
	"""
	keyWait
	clearMsg
	"""
	りゆうを おはなししている
	タイムは ありまセーン!
	"""
	keyWait
	end
}
script 102 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	みんな クニを まもることに
	すべてのエネルギーを そそいでるんだ
	"""
	keyWait
	clearMsg
	"""
	あんまり あいて できないけど
	わるく おもわないで くれよな!
	"""
	keyWait
	end
}
script 103 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	ニホンの オトコのコ って
	あいかわらず ワイルドで ステキね
	"""
	keyWait
	clearMsg
	"""
	でもナウは それどころじゃない、
	ワタシも ワイルドで ゴーね!
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 3214
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 163
		jumpIfTrue = 195
		jumpIfFalse = continue
	flagSet
		flag = 163
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"ワタシが いらいしゃよ!"
	keyWait
	clearMsg
	"""
	けいじばんにも かいたけど、
	「チンピラしてんのう」を
	こらしめて ほしいの
	"""
	keyWait
	clearMsg
	"""
	ヤツらは いまごろ
	アメロッパスクエアの 入り口で
	しゅうかいを ひらいてるはずよ
	"""
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	ヤツらには みんな メイワクしてるの、
	はやく やっつけてやって!
	アメロッパスクエア 入り口よ!
	"""
	keyWait
	end
}
script 192 mmbn2 {
	flagSet
		flag = 3214
	flagClear
		flag = 82
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	やっつけてきて くれたんだ!
	あなた いがいと つよいのね、
	ワタシ つよいヒト すきよ
	"""
	keyWait
	clearMsg
	"""
	フフ、なんてね!
	コレ おれいね
	"""
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 32
		code = M
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 32
	" "
	printCode
		buffer = 0
		code = M
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	これで すこしは へいわになるわ
	ありがとね
	"""
	keyWait
	end
}
script 195 mmbn2 {
	checkFlag
		flag = 252
		jumpIfTrue = continue
		jumpIfFalse = 191
	checkFlag
		flag = 253
		jumpIfTrue = continue
		jumpIfFalse = 191
	checkFlag
		flag = 254
		jumpIfTrue = continue
		jumpIfFalse = 191
	checkFlag
		flag = 317
		jumpIfTrue = continue
		jumpIfFalse = 191
	flagSet
		flag = 164
	jump
		target = 192
}
script 196 mmbn2 {
	checkFlag
		flag = 270
		jumpIfTrue = 199
		jumpIfFalse = continue
	checkFlag
		flag = 269
		jumpIfTrue = 200
		jumpIfFalse = continue
	flagSet
		flag = 269
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"ボウヤや「"
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = V
	"""
	」
	ってチップを もってないかねえ
	"""
	keyWait
	clearMsg
	"""
	まごがの どうしても、そのチップが
	ほしいというんじゃ
	"""
	keyWait
	clearMsg
	"""
	できたら、ワシのもっておる
	「
	"""
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = *
	"""
	」と
	こうかんして ほしいんじゃが
	"""
	keyWait
	clearMsg
	"どうかの?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"いいですよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ダメです"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 197,
			jump = continue,
			jump = continue
		]
	"""
	そうかい、もし どこかで
	みつけたら ゆずってもらえないかの
	"""
	keyWait
	clearMsg
	"""
	としよりの ねがい、
	きいてもらえんかの~?
	"""
	keyWait
	end
}
script 197 mmbn2 {
	checkPackChipCode
		chip = 119
		code = V
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 201
	flagSet
		flag = 270
	itemTakeChip
		chip = 119
		code = V
		amount = 1
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	ゆずって もらえるのかい?
	ありがたいねぇ
	これで、まごも よろこぶよ
	"""
	keyWait
	clearMsg
	"""
	あ、そうそう
	コレと こうかんだったねえ
	"""
	keyWait
	clearMsg
	jump
		target = 198
}
script 198 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 19
		code = *
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 19
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
	end
}
script 199 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	ぼうや、ありがとうねえ
	きっとまごも、よろこんで
	くれるだろうさ
	"""
	keyWait
	end
}
script 200 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"おや、どうしたんだい ぼうや?"
	keyWait
	clearMsg
	"ボウヤの「"
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = V
	"""
	」と、
	ワシの「
	"""
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = *
	"""
	」を
	こうかんしてくれるのかい?
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
	"ハイ "
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
			jump = 197,
			jump = continue,
			jump = continue
		]
	"""
	また、きが むいたら、
	こえを かけておくれ
	"""
	keyWait
	end
}
script 201 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"ボウヤの「"
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = V
	"""
	」は、
	ドコにあるんじゃ?
	"""
	keyWait
	clearMsg
	"ちいと、みあたらんのじゃが・・・"
	keyWait
	clearMsg
	"フォルダのなかに あったりしないかい?"
	keyWait
	clearMsg
	"""
	フォルダのなかに はいっていたら
	こうかんが、できないからねえ
	"""
	keyWait
	clearMsg
	"いちど、しらべてみておくれ"
	keyWait
	clearMsg
	"""
	こうかんする チップは、
	リュックのなかに いれておいておくれよ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	アメロッパで イチバン大きな
	ぎんこうだ
	"""
	keyWait
	clearMsg
	"""
	まいにち なんおくゼニー もの
	ゼニーが うごいている
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	レストランの てんない からは、
	とろけて しまいそうなくらい
	いいニオイが ただよってくる
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	レディース アンド ジェントルメンの
	ための レストラン
	"""
	keyWait
	clearMsg
	"キッズ おことわり"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	きらびやかな ほうせきたちが
	トコロせましと ならべられていて、
	おもわず 立ちどまってしまう
	"""
	keyWait
	end
}
