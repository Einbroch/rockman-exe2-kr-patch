@archive 0758CD4
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 56
		upper = 72
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	checkFlag
		flag = 523
		jumpIfTrue = 10
		jumpIfFalse = continue
	checkFlag
		flag = 571
		jumpIfTrue = 2
		jumpIfFalse = continue
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	mugshotAnimate
		animation = 2
	"@♥♪←↓→↑?"
	mugshotAnimate
		animation = 0
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、
	ほんやくシステムを きどうする?
	
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
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 2,
			jump = continue,
			jump = continue
		]
	"""
	アメロッパご しゃべれるの?
	だいじょうぶ?
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 2 mmbn2 {
	flagSet
		flag = 571
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ハロー! ガイ!
	パスポートを 見せてくれ!
	
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
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 3,
			jump = continue,
			jump = continue
		]
	"""
	オゥ ノー!
	じゃ ここは とおせないぜ!!
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"アメロッパには なにしに きたんだい?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"んーと、かいぎ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"???"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 4,
			jump = continue,
			jump = continue
		]
	"""
	オゥ ノー!
	こたえなきゃ ここは とおせないぜ!!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ユア クール ガイ!!
	かっこいいゼ! ボーイ!!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	flagSet
		flag = 523
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	これで てつづきは おわりだね、
	さ いこ!!
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	mugshotAnimate
		animation = 2
	"@♥♪←↓→↑?"
	mugshotAnimate
		animation = 0
	"\n"
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
			jump = 7,
			jump = continue,
			jump = continue
		]
	mugshotAnimate
		animation = 2
	"@♥♪←↓→↑!!"
	mugshotAnimate
		animation = 0
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	mugshotAnimate
		animation = 2
	"@♥♪←↓→↑?"
	mugshotAnimate
		animation = 0
	"\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"んーと、かいぎ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"???"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 8,
			jump = continue,
			jump = continue
		]
	mugshotAnimate
		animation = 2
	"@♥♪←↓→↑!!"
	mugshotAnimate
		animation = 0
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	mugshotAnimate
		animation = 2
	"""
	@♥♪←↓→↑
	@♥♪←↓→↑!!
	"""
	mugshotAnimate
		animation = 0
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	flagSet
		flag = 571
	flagSet
		flag = 523
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん すごいね!
	アメロッパご しゃべれるんだ!
	"""
	keyWait
	clearMsg
	"""
	でも、いちおう
	ほんやくシステムを きどうしておくね
	"""
	keyWait
	clearMsg
	"じゃ いこ!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"ウェルカム、ようこそ アメロッパへ!"
	keyWait
	end
}
script 11 mmbn2 {
	wait
		frames = 1
	end
}
script 12 mmbn2 {
	checkChapter
		lower = 37
		upper = 72
		jumpIfInRange = 13
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	ここは とうちゃくゲート!!
	もう 中へは リターン できないわ!
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	ここは とうちゃくゲート!!
	ここから 中へは ゴー できないわ!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	msgOpen
	"""
	コウクウケンノ ヒヅケガ チガイマス!
	マダ カエル日ニ ナッテイマセン・・・
	"""
	keyWait
	end
}
script 17 mmbn2 {
	checkFlag
		flag = 571
		jumpIfTrue = continue
		jumpIfFalse = 18
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ヘイ ガイ!!
	かってに とおっちゃ ダメだぜ!
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	mugshotAnimate
		animation = 2
	"@♥♪←↓→↑!!"
	mugshotAnimate
		animation = 0
	keyWait
	end
}
script 19 mmbn2 {
	checkChapter
		lower = 38
		upper = 38
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkFlag
		flag = 60
		jumpIfTrue = 25
		jumpIfFalse = continue
	checkFlag
		flag = 526
		jumpIfTrue = 21
		jumpIfFalse = continue
	checkFlag
		flag = 525
		jumpIfTrue = 20
		jumpIfFalse = continue
	flagSet
		flag = 525
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	へへ あのキッド
	けっこう もってやがったな・・・
	"""
	keyWait
	clearMsg
	"やっぱ ニホンジンは カネもちだぜ"
	keyWait
	end
}
script 20 mmbn2 {
	flagSet
		flag = 526
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"ホワット!? なんだよ!?"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	・・・オー さっきの ボーイ!
	なんか よう ですかー?
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
	"カネかえせ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"なんでもない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 22,
			jump = continue,
			jump = continue
		]
	"""
	オー ニホンジン
	なにが いいたいのか ハッキリしまセーン
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"ち! バレたか! "
	waitSkip
		frames = 30
	"これでも くらいな!"
	keyWait
	clearMsg
	flagSet
		flag = 59
	msgClose
	waitHold
}
script 23 mmbn2 {
	flagSet
		flag = 60
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	アイアンダスタン わっかりましたー
	おカネ かえしマース
	"""
	keyWait
	clearMsg
	jump
		target = 24
}
script 24 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	熱斗は、
	おカネを とりもどした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	clearMsg
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	アイムソーリィ・・・
	もう しまセーン
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"ニホンジン よわいネー!"
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	ここは
	とくべつな人しか とおれないの!!
	"""
	keyWait
	end
}
script 28 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 110
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 91
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 86
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	わたし ちょっとは
	ニホンごを しゃべれるのよ
	"""
	keyWait
	clearMsg
	"ヨウ ボウズ、ゲンキニ ヤットルカ?"
	keyWait
	clearMsg
	"どうかしら?"
	keyWait
	end
}
script 29 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 122
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 61
		jumpIfInRange = 87
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"ながたび おつかれさまでした"
	keyWait
	clearMsg
	"""
	出口から
	アメロッパーク行きの バスが出てるわ
	"""
	keyWait
	end
}
script 30 mmbn2 {
	checkFlag
		flag = 52
		jumpIfTrue = 31
		jumpIfFalse = continue
	flagSet
		flag = 52
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	こんにちは!
	「デンサンニュースネットワーク」の
	みどりかわケロ です!
	"""
	keyWait
	clearMsg
	"""
	「ケロのとつげき! レポート」
	今日は アメロッパくうこうから
	おおくり いたします!
	"""
	keyWait
	clearMsg
	"""
	・・・なんてネ!
	今日も ぜっこうちょうよ!
	"""
	keyWait
	clearMsg
	"""
	ところで、しょうねん!
	あたしと ネットバトルなんか
	してみるってのは どうかな?
	"""
	keyWait
	clearMsg
	jump
		target = 32
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	めざせ! こくさいジャーナリスト!
	でも アメロッパごは
	ノー サンキュー だけどネ!
	"""
	keyWait
	clearMsg
	jump
		target = 32
}
script 32 mmbn2 {
	checkChapter
		lower = 38
		upper = 38
		jumpIfInRange = 37
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ケロさんに
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
			jump = 33,
			jump = 34,
			jump = continue
		]
	end
}
script 33 mmbn2 {
	checkFlag
		flag = 48
		jumpIfTrue = 35
		jumpIfFalse = continue
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"じゃ、ホンバン かいしでーす!!"
	keyWait
	clearMsg
	jump
		target = 41
}
script 34 mmbn2 {
	flagClear
		flag = 49
	flagClear
		flag = 50
	flagClear
		flag = 51
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"あら、それってCM?"
	keyWait
	end
}
script 35 mmbn2 {
	flagClear
		flag = 49
	flagClear
		flag = 50
	flagClear
		flag = 51
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	きぶんは リハーサル・・・
	ケロまち ってことで おねがいできる?
	"""
	keyWait
	end
}
script 36 mmbn2 {
	checkFlag
		flag = 49
		jumpIfTrue = 46
		jumpIfFalse = continue
	checkFlag
		flag = 50
		jumpIfTrue = 47
		jumpIfFalse = continue
	checkFlag
		flag = 51
		jumpIfTrue = 48
		jumpIfFalse = 48
}
script 37 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ケロさんに
	ネットバトルを もうしこむ?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	"""
	・・・て ふだんなら
	ロックマンが いうんだよな・・・
	"""
	waitSkip
		frames = 15
	"\nチェッ・・・"
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	キミなら ゴールデンの レギュラーも
	ユメじゃないわ!!
	"""
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"また NGだしちゃった・・・"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	この キモチを
	せかい中に オンエア したいの!
	"""
	keyWait
	end
}
script 41 mmbn2 {
	flagSet
		flag = 48
	msgClose
	waitHold
}
script 42 mmbn2 {
	flagSet
		flag = 53
	flagClear
		flag = 49
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 83
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 83
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
		target = 38
}
script 43 mmbn2 {
	flagSet
		flag = 54
	flagClear
		flag = 50
	end
}
script 44 mmbn2 {
	flagSet
		flag = 55
	flagClear
		flag = 51
	end
}
script 46 mmbn2 {
	checkFlag
		flag = 53
		jumpIfTrue = 39
		jumpIfFalse = continue
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"これが きょくアナの げんかい・・・"
	waitSkip
		frames = 15
	"?"
	keyWait
	clearMsg
	"これは キミへのギャラ、"
	waitSkip
		frames = 30
	"\nうけとってね"
	keyWait
	clearMsg
	jump
		target = 42
}
script 47 mmbn2 {
	checkFlag
		flag = 54
		jumpIfTrue = 39
		jumpIfFalse = continue
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	これって・・・
	ニュースそくほう うつべき?
	"""
	keyWait
	clearMsg
	jump
		target = 43
}
script 48 mmbn2 {
	checkFlag
		flag = 55
		jumpIfTrue = 39
		jumpIfFalse = continue
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"しょうねん・・・"
	waitSkip
		frames = 15
	"\nキミ、もしかして プロデューサー?"
	keyWait
	clearMsg
	jump
		target = 44
}
script 49 mmbn2 {
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"""
	がいこくで いきなり
	きょかナシ さつえい だなんて・・・
	"""
	keyWait
	clearMsg
	"うたれたりしたら どうしよう・・・"
	keyWait
	end
}
script 50 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 121
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 111
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 92
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 88
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ボーイの かえりの ひこうきは
	わがAALの さいしんえいきの はずだ
	きたい してなよ!!
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"ナンデスカー? キーコエマセーン!"
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	つぎの フライトまで
	どうやって すごそうかしらね?
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	今回の アメロッパりょこうは
	サイコー だったなー!
	"""
	keyWait
	clearMsg
	"""
	ちょっと こわいおもいも したけど
	今となっては いいみやげばなしが
	できたって かんじかな
	"""
	keyWait
	clearMsg
	"""
	キミも
	きっと そうおもうんじゃ ないかな?
	"""
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"あれ?"
	keyWait
	clearMsg
	"""
	キミ アメロッパに
	ついたばかり じゃなかったっけ?
	もう かえっちゃうのかい?
	"""
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"しってるかい?"
	keyWait
	clearMsg
	"""
	おなじ ひこうきでも
	ファーストクラスと エコノミークラスでは
	きないしょくが ぜんぜん ちがうのさ
	"""
	keyWait
	clearMsg
	"ボーイも いつかは たべてみるといいよ"
	keyWait
	end
}
script 60 mmbn2 {
	checkItem
		item = 64
		amount = 1
		jumpIfEqual = 63
		jumpIfGreater = 63
		jumpIfLess = continue
	checkFlag
		flag = 514
		jumpIfTrue = 61
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ねぇ、熱斗くん
	フライトボードのまえに
	たってるヒト
	"""
	keyWait
	clearMsg
	"なんか、あやしくない?"
	keyWait
	end
}
script 61 mmbn2 {
	checkItem
		item = 22
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 63
	itemTake
		item = 22
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 22
	"""
	」
	を きかいにとおした!!
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 285
	"シューン!! "
	waitSkip
		frames = 30
	soundPlay
		track = 273
	"ガチャ!!"
	soundEnableTextSFX
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 22
	"」は うけつけられた!"
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	いちど 中に入ったら
	もう 出たらダメだよ
	"""
	keyWait
	end
}
script 63 mmbn2 {
	msgOpen
	"""
	熱斗は、
	「フリーパス」
	を きかいにとおした!!
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 285
	"シューン!! "
	waitSkip
		frames = 30
	soundPlay
		track = 273
	"ガチャ!!"
	soundEnableTextSFX
	keyWait
	clearMsg
	"「フリーパス」は うけつけられた!"
	keyWait
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"VIPいがい とおれませんよ!"
	keyWait
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	この つうろは、VIPしか
	とおれないんだよ
	"""
	keyWait
	end
}
script 69 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	いちど入ったら
	もう外には出れませんよ
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんだかドキドキするね"
	keyWait
	end
}
script 71 mmbn2 {
	checkItem
		item = 64
		amount = 1
		jumpIfEqual = 90
		jumpIfGreater = 90
		jumpIfLess = continue
	checkFlag
		flag = 513
		jumpIfTrue = 79
		jumpIfFalse = continue
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ハイ ボーイ!
	パスポート、見せてくれるよな?
	
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
	"ノー!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 72,
			jump = continue,
			jump = continue
		]
	"""
	リァリィ? マジで?
	じゃあ ボーイは ここを とおれない
	・・・
	"""
	keyWait
	end
}
script 72 mmbn2 {
	flagSet
		flag = 513
	flagClear
		flag = 2163
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ヒカリ・・ネット・・・OK!
	で、どこへ 行くんだ?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ニホン "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ヒミツ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 73,
			jump = continue,
			jump = continue
		]
	"""
	でも、こうくうけん ニホン行きだよ?
	ほんとは ニホンに かえるんだろ?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"そうだった "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ヒミツ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 74,
			jump = continue,
			jump = continue
		]
	"""
	キミは ニホンに かえるはずさ!
	こうくうけんに かいてあるからね!
	プロの目は ごまかせないよ!
	"""
	keyWait
	clearMsg
	"""
	じゃ、ここを とおって!
	・・・よい たびを!!
	"""
	keyWait
	end
}
script 73 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ビンゴ! まちがいないね
	OK! よい たびを!
	"""
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	そうだろう? そうだと おもったよ
	はい じゃOK! よい たびを!
	"""
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	おいおい あらての ジョークかい?
	ボーイが すすむのは はんたいのほうさ
	"""
	keyWait
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ヘイ ボーイ! スタプヒヤ!
	ここで チェックを うけて!
	"""
	keyWait
	end
}
script 77 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	そっちは
	かんけいしゃや VIPオンリーさ、
	とおっちゃ ダメだよ
	"""
	keyWait
	end
}
script 78 mmbn2 {
	flagSet
		flag = 514
	mugshotShow
		mugshot = Scientist
	msgOpen
	"・・・ブツブツ・・・"
	keyWait
	clearMsg
	"""
	ほんとに ひこうきなんかにのせて
	だいじょうぶなのかな?
	"""
	keyWait
	clearMsg
	"""
	ドクもあるし・・・
	もし とちゅうでにげだしたら・・・
	"""
	keyWait
	clearMsg
	"""
	でも、もう ひこうきでちゃうしなぁ・・・
	うーん・・・ブツブツ・・・
	"""
	keyWait
	end
}
script 79 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"まだここに いたのかい ボーイ?"
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	いつまで
	そんなカオで 人のことを 見る気だ?
	"""
	keyWait
	clearMsg
	"""
	ブルースなら すでに ふっかつしている
	・・・それだけでなく いぜんよりも
	かくじつに・・・
	"""
	waitSkip
		frames = 20
	"つよい!"
	keyWait
	clearMsg
	jump
		target = 161
}
script 81 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ニホンは、とっても いいトコロだよ!"
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	たのしみだな~!
	はやく、ニホンに いきたいな!
	"""
	keyWait
	end
}
script 83 mmbn2 {
	checkItem
		item = 86
		amount = 1
		jumpIfEqual = 84
		jumpIfGreater = 84
		jumpIfLess = continue
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	やあ、光くん
	せんじつの じけんのときは
	ほんとうに、たすかったよ
	"""
	keyWait
	clearMsg
	"""
	ボクのなかまが、キミにぜひ
	おれいが したいと いっていたよ
	"""
	keyWait
	clearMsg
	"""
	カレは、いま アメロッパじょうの
	バンサンの間にいるよ
	"""
	keyWait
	clearMsg
	"よかったら いってやっておくれ"
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	また あそびに きてくれよ!
	それじゃあ、よい そらのたびを!
	"""
	keyWait
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"ぜひ、また いらしてくださいね!"
	keyWait
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	また あたらしい ニホンごを
	おぼえたの
	"""
	keyWait
	clearMsg
	"オトトイ キヤガレ!!"
	keyWait
	clearMsg
	"どうかしら?"
	keyWait
	end
}
script 87 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	こちらは、とうちゃくフロアです
	ここから ひこうきにのるコトは
	できません
	"""
	keyWait
	clearMsg
	"""
	ひこうきに のられるのなら、
	とうじょうフロアへ、
	おまわりください
	"""
	keyWait
	end
}
script 88 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ヘイ、ボーイ
	わがAALの さいしんえいきが
	おまちかねだぜ!!
	"""
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	フリーパスを おもちですね
	どうぞ おとおりください
	"""
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	せかいかくちの さいがいの おかげで
	おきゃくさんが、ぜんぜんこないわ
	これは、だいそんがいよ!!
	"""
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ボーイ、いま アメロッパじゃ
	ひざしが、とんでもなく つよいんだ
	にっしゃびょうには 気をつけなよ
	"""
	keyWait
	end
}
script 93 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	せっかく モウチョウが なおって
	やっと、ニホンに かえれるってときに
	"""
	keyWait
	clearMsg
	"""
	ニホンでは、だいじしんが
	ひんぱつしてると いうし・・・
	"""
	keyWait
	clearMsg
	"""
	でも、さきに ニホンにかえした
	こどもたちのコトが シンパイだ
	つぎの びんでかえろう!!
	"""
	keyWait
	end
}
script 94 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 112
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 102
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	オー! せっかくたのしみニ していた
	アジーナりょこうが、ちゅうしになりましタ
	"""
	keyWait
	clearMsg
	"ベリー ショック!!"
	keyWait
	end
}
script 95 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 113
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 103
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	アジーナから かえってきた
	ばかり なんだけど
	"""
	keyWait
	clearMsg
	"""
	アジーナは、ものすごい
	だいこうずい だったぜ
	"""
	keyWait
	clearMsg
	"""
	かなりの ひがいが、
	でてたんじゃないか?
	"""
	keyWait
	end
}
script 96 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 114
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 104
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	あまりに、ニホンのじしんが
	ひどいから、アメロッパに
	ひなんしてきたんだが、
	"""
	keyWait
	clearMsg
	"""
	やはり ここも、しぜんさいがい が
	まきおこっている ようだな
	"""
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	今は、ドコのクニにいっても
	なにかしらの さいがいが
	まっているだけよ
	"""
	keyWait
	clearMsg
	"""
	こんなときは、じっと さいがいが
	おさまるのを、まつだけ・・・
	"""
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ボーイの そこくは、
	ダイジョウブなのかい?
	"""
	keyWait
	clearMsg
	"""
	ニュースでは、タイヘンなさわぎに
	なってるみたいだけどさ
	"""
	keyWait
	end
}
script 102 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"りょこうは、ちゅうしに なりました"
	keyWait
	clearMsg
	"""
	でも、この ひざしの なかを
	ホームまで リターンするのは、
	かなりヘビーです
	"""
	keyWait
	end
}
script 103 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	さぁ、うちにかえるか・・・
	でも、どうやってかえろうかな
	"""
	keyWait
	clearMsg
	"ひが しずむまでまつか・・・"
	keyWait
	end
}
script 104 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	ニホンの じしんよりは
	マシだとおもって ココまできたが
	"""
	keyWait
	clearMsg
	"アメロッパも やばいんじゃないか?"
	keyWait
	clearMsg
	"""
	となると、つぎは ドコに
	にげようかな・・・
	"""
	keyWait
	end
}
script 110 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	せかいじゅうの さいがいが
	おさまったようね
	"""
	keyWait
	clearMsg
	"""
	かんこうきゃくは、
	もどってきてくれるかしら
	"""
	keyWait
	clearMsg
	"""
	ニホンじんの おきゃくがきたら
	ワタシの トクイな ニホンごで
	かんげいするのにな
	"""
	keyWait
	clearMsg
	"オトトイキヤガレ!!"
	keyWait
	clearMsg
	"ってね"
	keyWait
	end
}
script 111 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	さぁ、ビジネスさいかいだ!
	ガンバるぜぃ!!
	"""
	keyWait
	end
}
script 112 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	せかいじゅうの さいがいが、
	いっぺんに やんだらしいですネー
	"""
	keyWait
	clearMsg
	"""
	これで、アジーナにいけるって
	もんですねー!!
	"""
	keyWait
	end
}
script 113 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	ひざしが もとに
	もどったみたいだな
	"""
	keyWait
	clearMsg
	"""
	それじゃあ、ゆっくりと
	いえじに つくとするか・・・
	"""
	keyWait
	end
}
script 114 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	そうか、じしんは おさまったのか
	しばらく かんこうでもしてから
	ニホンに かえるとするか
	"""
	keyWait
	end
}
script 120 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	DEXPの ひこうきは とんでないけど
	ニホンごが しゃべれる スタッフが
	いると あんしんでしょ
	"""
	keyWait
	clearMsg
	"""
	だから こまりごとが ありそうな人には
	こう こえを かけてあげるのよ
	"""
	keyWait
	clearMsg
	"""
	ナンヤ ワレ?
	ワシノ カオニ ナンカ ツイトンカ?
	"""
	keyWait
	clearMsg
	"どうかしら?"
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"ドンウォーリィ! ごあんしんを!"
	keyWait
	clearMsg
	"""
	アメロッパの いしんに かけても
	AALのひこうきは うんこうを
	やめないからさ!
	"""
	keyWait
	clearMsg
	"またいつでも アメロッパに おいで!"
	keyWait
	end
}
script 122 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"ながたび おつかれさま!"
	keyWait
	clearMsg
	"""
	アメロッパも ウイルスの ひがいで
	こんらん してるけど
	すこしでも たのしんで いってね
	"""
	keyWait
	end
}
script 123 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	マイ ハニーーーー!!
	あいたかったぜ!!
	"""
	keyWait
	end
}
script 124 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	オー マイ ダーリン!
	かみさま かれを ネットはんざいから
	まもってくれて かんしゃシマース!
	"""
	keyWait
	end
}
script 125 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"むこうの カップル・・・うらやましいよ"
	keyWait
	clearMsg
	"オレも はやく ニホンへ・・・"
	keyWait
	end
}
script 126 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	キケンな グッズは
	ぜったい もちこませないね!!
	"""
	keyWait
	clearMsg
	"""
	・・・でも このテンションを
	いつまで つづけられるか・・・
	"""
	keyWait
	clearMsg
	"""
	1日も はやく
	ゴスペルが このよから きえることを
	いのってるよ
	"""
	keyWait
	end
}
script 160 mmbn2 {
	checkChapter
		lower = 48
		upper = 54
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	end
}
script 161 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、炎山くんに
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
		flag = 186
		jumpIfTrue = 165
		jumpIfFalse = continue
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	いいだろう・・・
	じっけんだい くらいには なりそうだ
	"""
	keyWait
	clearMsg
	jump
		target = 163
}
script 163 mmbn2 {
	flagSet
		flag = 186
	msgClose
	waitHold
}
script 164 mmbn2 {
	flagClear
		flag = 187
	flagClear
		flag = 188
	flagClear
		flag = 189
	mugshotShow
		mugshot = Chaud
	msgOpen
	"おくびょうかぜに ふかれたか・・・"
	keyWait
	end
}
script 165 mmbn2 {
	flagClear
		flag = 187
	flagClear
		flag = 188
	flagClear
		flag = 189
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	やめておくんだな・・・
	さっきの しょうりが フロックだった
	ことを おもいしるだけだ・・・
	"""
	keyWait
	end
}
script 166 mmbn2 {
	checkFlag
		flag = 187
		jumpIfTrue = 167
		jumpIfFalse = continue
	checkFlag
		flag = 188
		jumpIfTrue = 169
		jumpIfFalse = continue
	checkFlag
		flag = 189
		jumpIfTrue = 171
		jumpIfFalse = 171
}
script 169 mmbn2 {
	checkFlag
		flag = 192
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	・・・りろんてきには
	ありえない けっかだが・・・
	"""
	keyWait
	clearMsg
	jump
		target = 170
}
script 170 mmbn2 {
	flagSet
		flag = 192
	flagClear
		flag = 188
	end
}
script 175 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	マグレは
	そう つづくものでは ない・・・
	"""
	waitSkip
		frames = 15
	"\nそれを しょうめいしたに すぎん・・・"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"フライトボードだ!"
	keyWait
	clearMsg
	"""
	ひこうきの しゅっぱつじこくが
	かかれている
	"""
	keyWait
	clearMsg
	"""
	どうやら、ここには プラグイン
	できないようだ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	こうくうけんを いれる
	かいさつき だ!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"DEXPカウンターだ!"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"AALカウンターだ!"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"「キケンぶつ もちこみキンシの\n おねがい」"
	keyWait
	clearMsg
	"と、アメロッパごで かかれているようだ"
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	にもつの中に キケンぶつなどが
	はいっていないか チェックするトコロだ
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"「かんけいしゃいがい 立ち入りキンシ!」"
	keyWait
	clearMsg
	"と、アメロッパごで かかれているようだ"
	keyWait
	end
}
script 227 mmbn2 {
	jump
		target = 71
}
