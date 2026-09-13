@archive 0754A38
@size 255

script 0 mmbn2 {
	checkFlag
		flag = 635
		jumpIfTrue = 2
		jumpIfFalse = continue
	checkItem
		item = 11
		amount = 1
		jumpIfEqual = 1
		jumpIfGreater = 1
		jumpIfLess = continue
	flagSet
		flag = 632
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	ヤサイを きりたいんだけど
	ほうちょう もってくるの
	わすれちゃった みたい・・・
	"""
	keyWait
	clearMsg
	"""
	熱斗、どこかで
	かりてきて くれないかな?
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	ほうちょう かりてきて くれたんだ!
	ありがと 熱斗!
	"""
	keyWait
	clearMsg
	mugshotHide
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 11
	"""
	」
	を メイルに わたした!!
	"""
	keyWait
	itemTake
		item = 11
		amount = 1
	flagClear
		flag = 632
	flagSet
		flag = 635
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	すぐに したくが できるわ
	デカオくんと やいとちゃんのほうは
	どう?
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkFlag
		flag = 637
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkItem
		item = 12
		amount = 1
		jumpIfEqual = 4
		jumpIfGreater = 4
		jumpIfLess = continue
	flagSet
		flag = 634
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	コンロの 火が よわくってよ
	まきを さがしてんだ
	"""
	keyWait
	clearMsg
	"""
	おい! 熱斗! おまえも どっかで
	まきに つかえそうな木を ひろってこい!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"お! すまねえな!"
	keyWait
	clearMsg
	mugshotHide
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 12
	"""
	」
	を デカオに わたした!!
	"""
	keyWait
	flagClear
		flag = 634
	itemTake
		item = 12
		amount = 1
	flagSet
		flag = 637
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"これで うまいメシが できるぜ!"
	keyWait
	end
}
script 6 mmbn2 {
	checkFlag
		flag = 636
		jumpIfTrue = 8
		jumpIfFalse = continue
	checkItem
		item = 13
		amount = 1
		jumpIfEqual = 7
		jumpIfGreater = 7
		jumpIfLess = continue
	flagSet
		flag = 633
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	ニクも まあ いいんだけど
	アタシ サカナが すきなのよ!
	"""
	keyWait
	clearMsg
	"光くん あなた なんとか しなさいよね!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	あら サカナ!
	あんた やるじゃない!
	これは いただいて おくわよ
	"""
	keyWait
	clearMsg
	mugshotHide
	"""
	やいとは、
	「
	"""
	printItem
		buffer = 0
		item = 13
	"""
	」
	を 熱斗から とった!!
	"""
	keyWait
	flagClear
		flag = 633
	itemTake
		item = 13
		amount = 1
	flagSet
		flag = 636
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	もう ちょっと まちなさいよね
	ガツガツ するんじゃないの!
	"""
	keyWait
	end
}
script 9 mmbn2 {
	checkItem
		item = 11
		amount = 1
		jumpIfEqual = 12
		jumpIfGreater = 12
		jumpIfLess = continue
	checkFlag
		flag = 632
		jumpIfTrue = 10
		jumpIfFalse = continue
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"山って やっぱり いいよね"
	waitSkip
		frames = 30
	"\nせーの、ヤッホーーーーー!!!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"え ほうちょう わすれて きちゃったの?"
	waitSkip
		frames = 30
	"\nいいわ ワタシのを かしてあげる"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 11
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 11
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
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"どうぞ、えんりょしないで つかってね"
	keyWait
	end
}
script 13 mmbn2 {
	checkItem
		item = 13
		amount = 1
		jumpIfEqual = 16
		jumpIfGreater = 16
		jumpIfLess = continue
	checkFlag
		flag = 633
		jumpIfTrue = 14
		jumpIfFalse = continue
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	このサカナたちは
	もう オレから にげられんナ
	"""
	keyWait
	clearMsg
	"""
	ハッハッハッ
	ウロコの いちまい いちまい まで
	クッキリと 見えるワ!
	"""
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"オマエも サカナを つかまえたいのか?"
	keyWait
	clearMsg
	"""
	・・・いいだろう
	じゃ オレの いうとおりに やってみな!
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotHide
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"""
	・
	なんと! 手で サカナが すくえた!!
	"""
	keyWait
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 13
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 13
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
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"どうだ オレの コーチは?"
	keyWait
	end
}
script 17 mmbn2 {
	checkItem
		item = 12
		amount = 1
		jumpIfEqual = 20
		jumpIfGreater = 20
		jumpIfLess = continue
	checkFlag
		flag = 634
		jumpIfTrue = 18
		jumpIfFalse = continue
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	いまでこそ ヨボヨボじゃが
	こう見えても ワシャ
	木こり だったんじゃぞ
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	textSpeed
		delay = 4
	"まきぃ木が ほしいぃ とな~?"
	waitSkip
		frames = 30
	"\nトントントーン "
	waitSkip
		frames = 30
	"トントントーン!"
	waitSkip
		frames = 30
	"\n"
	textSpeed
		delay = 1
	"そりゃー!!"
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotHide
	msgOpen
	"""
	みるみるうちに
	まきが うずたかく つみ上げられていく!
	"""
	textSpeed
		delay = 2
	keyWait
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 12
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 12
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
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"フォッ フォッ・・・"
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	この先は
	いっぱんの人は 立ち入りキンシです
	"""
	keyWait
	clearMsg
	"""
	まあ 行っても ダムしかないから
	おもしろくないと おもいますけどね
	"""
	keyWait
	end
}
script 22 mmbn2 {
	checkChapter
		lower = 14
		upper = 15
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"""
	ケロさんに うんてん してもらったのが
	しっぱい だったな・・・
	"""
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"おねえちゃんと キャンプ たのしいな"
	keyWait
	clearMsg
	"え、ノドが かわいたの?"
	keyWait
	clearMsg
	"""
	ダメよ
	この水とう ワタシたちの じゃないの
	ここに ずっと おいてあるんだよ
	"""
	keyWait
	clearMsg
	"""
	オマケに中は カラッポなんだよ
	ヘンなの
	"""
	keyWait
	clearMsg
	"""
	でも
	おねえちゃんと キャンプ たのしいな
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	textSpeed
		delay = 4
	"""
	ドンドコ ドンドコ ドンドコ ドンドコ
	・・・
	"""
	textSpeed
		delay = 2
	keyWait
	clearMsg
	"なに してるのって?"
	keyWait
	clearMsg
	"""
	川に オフネを うかべて
	あそんでるんだよ
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"フワワワワ・・・"
	keyWait
	clearMsg
	"""
	テントで ねてたら
	こんな じかんに なっちゃった
	もう おヒルまえ なんだね
	"""
	keyWait
	end
}
script 26 mmbn2 {
	checkChapter
		lower = 14
		upper = 14
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	みな
	キャンプを たのしんで いるようだな
	"""
	keyWait
	clearMsg
	"ええ こうけい じゃのぅ・・・"
	keyWait
	end
}
script 27 mmbn2 {
	flagSet
		flag = 664
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	・・・これ あげるから
	ここは なっとく して下さい
	"""
	keyWait
	clearMsg
	jump
		target = 28
}
script 28 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 8
		code = G
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 8
	" "
	printCode
		buffer = 0
		code = G
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 29 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	この先は
	いっぱんの人は 立ち入りキンシです
	"""
	keyWait
	clearMsg
	"""
	まあ 行っても ダムしかないから
	おもしろくないと おもいますけどね
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 664
		jumpIfTrue = continue
		jumpIfFalse = 27
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	さっきの バクハツは
	やはり ダムらしいぞ!
	"""
	keyWait
	clearMsg
	"""
	まだ もちこたえてる みたいだけど、
	もし もういちど
	バクハツが おきたら・
	"""
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"・"
	keyWait
	clearMsg
	"キミも はやく にげるんだ!"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	とつぜん
	ダムが バクハツした もようです!
	"""
	keyWait
	clearMsg
	"""
	げんばから
	きんきゅうレポートを おとどけします!
	"""
	keyWait
	clearMsg
	jump
		target = 82
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"これは スクープえいぞう だよ!"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	みんな もう ヒナンしたぞ!
	なにを グズグズ しとるんじゃ!
	"""
	keyWait
	end
}
script 35 mmbn2 {
	checkFlag
		flag = 655
		jumpIfTrue = 36
		jumpIfFalse = continue
	flagSet
		flag = 658
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こんなところに
	PETが おちてるなんて あやしい・・・
	プラグイン してみようよ!
	"""
	keyWait
	end
}
script 36 mmbn2 {
	msgOpen
	"""
	きばくそうちが しこまれていた PETだ
	きしゅは よくある タイプだ・・・
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	先ほどから すこし 水かさが
	ふえてきたような 気も します!
	"""
	keyWait
	clearMsg
	"""
	はたして
	ダムは だいじょうぶ なのでしょうか!?
	"""
	keyWait
	clearMsg
	jump
		target = 82
}
script 39 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1799
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 40 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 57
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 19
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ここにいると
	まちに かえるのが ヤになっちゃうな
	"""
	keyWait
	end
}
script 41 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 58
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 19
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"えとね、"
	waitSkip
		frames = 15
	"アタシね、"
	waitSkip
		frames = 15
	"\nさっきね、"
	waitSkip
		frames = 15
	"ころんでもね、"
	keyWait
	clearMsg
	"なかなかったよ、"
	waitSkip
		frames = 30
	"エライ?"
	keyWait
	end
}
script 42 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 59
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 19
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	今日は、たのしいキャンプの日
	ブーーーーーン!!
	たのしーな!!
	"""
	keyWait
	end
}
script 45 mmbn2 {
	checkFlag
		flag = 530
		jumpIfTrue = 47
		jumpIfFalse = continue
	checkFlag
		flag = 527
		jumpIfTrue = 46
		jumpIfFalse = continue
	flagSet
		flag = 527
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	ワシの いらいをうけてくれるのは
	キミかね
	"""
	keyWait
	clearMsg
	"ワシの いらいなんだが"
	keyWait
	clearMsg
	"""
	じつは ワシのムスコが もっている
	プログラムが インターネットで
	まいごに なってるみたいなんだよ
	"""
	keyWait
	clearMsg
	"""
	たぶん、デンサンエリアの
	ドコかに いるとおもうんだが・・・
	"""
	keyWait
	clearMsg
	"""
	ムスコは まだ ちいさいし
	ワシはアウトドアは だから
	インターネットは、ぜんぜんわからない
	"""
	keyWait
	clearMsg
	"""
	そこで、キミにおねがいしたんだよ
	インターネットで、
	まいごのプログラムをみつけたら
	"""
	keyWait
	clearMsg
	"""
	ワシのところまで、おしえにきてくれ
	それじゃ たのんだよ
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	いらいの かくにん?
	ああ、いいよ
	"""
	keyWait
	clearMsg
	"""
	ワシのムスコが もっている
	プログラムが インターネットで
	まいごに なってるみたいなんだよ
	"""
	keyWait
	clearMsg
	"""
	たぶん、デンサンエリアの
	ドコかに いるとおもうんだが・・・
	"""
	keyWait
	clearMsg
	"""
	ムスコは まだ ちいさいし
	ワシはアウトドアは だから
	インターネットは、ぜんぜんわからない
	"""
	keyWait
	clearMsg
	"""
	なので、まいごのプログラムを
	キミに さがしてきてほしい
	"""
	keyWait
	clearMsg
	"""
	なるべく はやくみつけておくれよ!
	ムスコが まってるからな!
	"""
	keyWait
	end
}
script 47 mmbn2 {
	checkFlag
		flag = 3202
		jumpIfTrue = 50
		jumpIfFalse = continue
	flagSet
		flag = 3202
	flagClear
		flag = 82
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	おお、プログラムを
	みつけてきてくれたか!
	"""
	keyWait
	clearMsg
	"なかなか やるじゃないか"
	keyWait
	clearMsg
	"よし、ごうかくだ!"
	keyWait
	clearMsg
	"""
	じつは、ワタシは ライセンスしけんの
	しけんかん なんだよ
	"""
	keyWait
	clearMsg
	"""
	キミの かんさつりょくを
	しけんさせてもらった
	"""
	keyWait
	clearMsg
	"よくがんばったね!"
	keyWait
	clearMsg
	jump
		target = 48
}
script 48 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	コレは、つまらないモノだが、
	ワタシからの おいわいだ
	うけとりたまえ!
	"""
	keyWait
	clearMsg
	jump
		target = 49
}
script 49 mmbn2 {
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
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	もっと、けいけんをつんで
	みんなの やくにたてるように
	ガンバレよ!
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	もう、おとうとたちが
	はしゃぎすぎて コマっちゃうよ
	"""
	keyWait
	clearMsg
	"""
	でも、ワンパクでも いいから
	たくましく せいちょうしてほしいな
	"""
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	えっとね、キャンプじょうはね、
	みちがね、デコボコなんだよ
	"""
	keyWait
	clearMsg
	"""
	まちみたいにね、たいらなね、
	みちじゃね ないんだよ
	"""
	keyWait
	clearMsg
	"""
	いろんなカタチの いしが
	おちてるんだよ
	"""
	keyWait
	clearMsg
	"キャッ、キャッ"
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	アハハ、たのしーーな!
	ブイーーーーン!!
	"""
	keyWait
	clearMsg
	"ひこうきだぞ~"
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	うーーん!
	だいしぜん サイコーーー!!
	"""
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	そろそろ、かえろうかな
	あんまり おそくなって
	"""
	keyWait
	clearMsg
	"""
	パパやママが、シンパイすると
	いけないし
	"""
	keyWait
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"アタシまだ かえりたくなーーーい!"
	keyWait
	end
}
script 59 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"ボクも、まだまだ あそびたーい!"
	keyWait
	clearMsg
	"ブイーーン、ブイーーン!"
	keyWait
	clearMsg
	"""
	おにいちゃんが、かえったって
	ボクは、ここにいるんだい!
	"""
	keyWait
	clearMsg
	"ブイーーン、ブイーーン!!"
	keyWait
	end
}
script 60 mmbn2 {
	checkItem
		item = 65
		amount = 1
		jumpIfEqual = 66
		jumpIfGreater = 66
		jumpIfLess = continue
	checkItem
		item = 19
		amount = 1
		jumpIfEqual = 63
		jumpIfGreater = 63
		jumpIfLess = continue
	checkItem
		item = 20
		amount = 1
		jumpIfEqual = 62
		jumpIfGreater = 62
		jumpIfLess = continue
	checkItem
		item = 18
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 65
	itemTake
		item = 18
		amount = 1
	flagSet
		flag = 605
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	アレ、あたしのPETの
	じゅうでんでんちじゃない
	わざわざもってきてくれたの?
	"""
	keyWait
	clearMsg
	"""
	ん? ききたいコトがあるって?
	なにかしら?
	"""
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 21
	"""
	」かあ・・・
	きいたコトあるなあ・・・
	ドコできいたんだっけ・・・?
	"""
	keyWait
	clearMsg
	"あ! おもいだした!!"
	keyWait
	clearMsg
	"""
	ワタシの メルともが、
	たしか、そんな なまえのプログラムが
	あるとか なんとかいってたわ!
	"""
	keyWait
	clearMsg
	"""
	そのヒトは どこにいるかって?
	コトブキスクエアに いってごらん
	たぶん、いるとおもうわ
	"""
	keyWait
	clearMsg
	"ムラサキいろした ナビだからね"
	keyWait
	clearMsg
	"""
	あ そうそう、そのメルともに
	たのまれてたコトが あったんだ!
	"""
	keyWait
	clearMsg
	"""
	わるいけど、コレもいっしょに
	わたしてきてくれない?
	"""
	keyWait
	clearMsg
	jump
		target = 61
}
script 61 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 20
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 20
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	コトブキスクエアにいる
	ムラサキいろのナビよ
	ヨロシクね!!
	"""
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 20
	"""
	」わたしてくれたの?
	ありがとう
	"""
	keyWait
	clearMsg
	"コレはおれいよ!"
	keyWait
	clearMsg
	jump
		target = 64
}
script 64 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 65
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 65
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	ああ~ マチより
	やっぱ、ヤマよね~
	"""
	keyWait
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"つぎは、どこのヤマにいこうかしら"
	keyWait
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	まだまだ、わかいもんには、
	まけんぞい!!
	"""
	keyWait
	clearMsg
	"ホレ! あるけ! あるけ!"
	keyWait
	end
}
script 68 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	ひぃ、ひぃ、ひぃ・・・
	わたしは、もうこれくらいに
	しておきます
	"""
	keyWait
	clearMsg
	"""
	「すぎたるは、およばざるがごとし」
	なにごとも、やりすぎは
	よくありませんからね
	"""
	keyWait
	end
}
script 69 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	かいちょう! ハァ、ハァ・・・
	あんまり・・・ハァ、ハァ・・・
	ムリなさらないでください
	"""
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	ふぉー! あるくぞい
	あるくぞい!
	"""
	keyWait
	clearMsg
	"""
	あるくコトは まさに、
	けんこうの だいいっぽじゃ!
	"""
	keyWait
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	ワタシも まけて
	いられませんねぇ
	"""
	keyWait
	clearMsg
	"あるきましょ、あるきましょ"
	keyWait
	end
}
script 77 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	この おふたりは、
	「ニホン あるきまくろう かい」の
	"""
	keyWait
	clearMsg
	"""
	かいちょうさんと、
	ふくかいちょうさんなんだ
	"""
	keyWait
	clearMsg
	"""
	でも、もう おとしだから
	あんまりムリしてもらっちゃ
	コマるんだけどなぁ
	"""
	keyWait
	end
}
script 80 mmbn2 {
	checkFlag
		flag = 52
		jumpIfTrue = 81
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
	今日は サッカーの
	キャンプレポートを おとどけします!
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
		target = 82
}
script 81 mmbn2 {
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 37
		jumpIfOutOfRange = continue
	checkChapter
		lower = 14
		upper = 14
		jumpIfInRange = 31
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	今日は サッカーの
	キャンプレポートを おとどけします!
	"""
	keyWait
	clearMsg
	"""
	え?
	ここじゃ サッカー やってないの!?
	"""
	keyWait
	clearMsg
	jump
		target = 82
}
script 82 mmbn2 {
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
			jump = 83,
			jump = 84,
			jump = continue
		]
	end
}
script 83 mmbn2 {
	checkFlag
		flag = 48
		jumpIfTrue = 85
		jumpIfFalse = continue
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"じゃ、ホンバン かいしでーす!!"
	keyWait
	clearMsg
	jump
		target = 91
}
script 84 mmbn2 {
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
script 85 mmbn2 {
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
script 86 mmbn2 {
	checkFlag
		flag = 49
		jumpIfTrue = 96
		jumpIfFalse = continue
	checkFlag
		flag = 50
		jumpIfTrue = 97
		jumpIfFalse = continue
	checkFlag
		flag = 51
		jumpIfTrue = 98
		jumpIfFalse = 98
}
script 88 mmbn2 {
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
script 89 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"また NGだしちゃった・・・"
	keyWait
	end
}
script 90 mmbn2 {
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
script 91 mmbn2 {
	flagSet
		flag = 48
	msgClose
	waitHold
}
script 92 mmbn2 {
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
		target = 88
}
script 93 mmbn2 {
	flagSet
		flag = 54
	flagClear
		flag = 50
	end
}
script 94 mmbn2 {
	flagSet
		flag = 55
	flagClear
		flag = 51
	end
}
script 96 mmbn2 {
	checkFlag
		flag = 53
		jumpIfTrue = 89
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
		target = 92
}
script 97 mmbn2 {
	checkFlag
		flag = 54
		jumpIfTrue = 89
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
		target = 93
}
script 98 mmbn2 {
	checkFlag
		flag = 55
		jumpIfTrue = 89
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
		target = 94
}
script 120 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	おじさん、コドモのころは、
	べんきょうばかり していたから
	"""
	keyWait
	clearMsg
	"""
	キャンプした おもいでなんて
	ぜんぜんないんだ
	"""
	keyWait
	clearMsg
	"""
	せめて、じぶんの こどもには、
	そんな おもいを してほしくないから
	"""
	keyWait
	clearMsg
	"""
	できるだけ、いろんなトコロに
	つれていくように しているんだ
	"""
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	キャンプじょうだー!
	たーのしーなー!!
	"""
	keyWait
	clearMsg
	"おとうさんも はやくおいでよ!"
	keyWait
	end
}
script 130 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 140
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 135
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	じしんに よって、この かわかみにある
	ダムが、けっかいしたら
	キャンプじょうは、水にのみこまれるから
	"""
	keyWait
	clearMsg
	"""
	キャンプを しているヒトたちに
	けいかいを よびかけにきたんだ
	"""
	keyWait
	clearMsg
	"""
	キミも、あぶないから
	はやく ひなんしたほうがいい!
	"""
	keyWait
	end
}
script 135 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	ニホンは、もともと じしんの
	おこりやすい ばしょなんだ
	"""
	keyWait
	clearMsg
	"""
	でも、かんきょういじシステムの
	チカラにより、じしんは
	ふうじられていたんだ
	"""
	keyWait
	clearMsg
	"""
	だから、さいきんの しゃかいは、
	じしんに たいする ききかんりが
	よわくなっているんだ
	"""
	keyWait
	clearMsg
	"""
	このまま じしんが つづくような
	コトがあれば、
	"""
	keyWait
	clearMsg
	"""
	ニホンしゃかいのキノウは
	かんぜんに、マヒしてしまうぞ
	"""
	keyWait
	end
}
script 140 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	じしんは、おさまったようだね・・・
	ニホンしゃかいの ほうかいは
	まぬがれたようだね
	"""
	keyWait
	clearMsg
	"""
	こんかいばかりは、ホントに
	ビビったよ
	"""
	keyWait
	end
}
script 150 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	しぜんと ふれあうのに
	ウイルスを おそれることなど あるか!!
	"""
	keyWait
	clearMsg
	"""
	いつでも どこでも ひとりでも
	キャンプ!!
	オレこそが キャンプマスターだ!!
	"""
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"さびしぃのぅ"
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 3216
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 168
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 167
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 167
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	おや、キミは ひこうきにのってた・・・
	そうか、こんかいの いらいは
	キミが うけてくれるのか
	"""
	keyWait
	clearMsg
	"それは、ココロづよいな!"
	keyWait
	clearMsg
	"""
	それじゃあ、さっそくだけど、
	「デンサン オオゲンゴロウ」を
	さがして ほしいんだ
	"""
	keyWait
	clearMsg
	"""
	おそらく、このキャンプじょう
	しゅうへんに いるはずなんだ
	"""
	keyWait
	clearMsg
	"""
	ゲンゴロウは、みずのながれが
	おだやかなトコロを このむんだ
	"""
	keyWait
	clearMsg
	"それじゃ、よろしくたのんだよ"
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	「デンサン オオゲンゴロウ」を
	さがすコツ?
	"""
	keyWait
	clearMsg
	"さっきも、いったけど"
	keyWait
	clearMsg
	"""
	みずのながれが おだやかなトコロを
	じゅうてんてきに さがしてみては
	どうかな?
	"""
	keyWait
	end
}
script 192 mmbn2 {
	flagSet
		flag = 3216
	flagClear
		flag = 82
	itemTake
		item = 53
		amount = 1
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	をを! コレはまさに
	「デンサン オオゲンゴロウ」!
	"""
	keyWait
	clearMsg
	"""
	やっぱり、キミはできるオトコだね
	それじゃあ、コレはほうしゅうだよ
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
		chip = 128
		code = M
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 128
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
		mugshot = Entomologist
	msgOpen
	"""
	どうだ? ムシがっかいに
	はいらないか?
	"""
	keyWait
	clearMsg
	"""
	キミなら ゆうしゅうな
	ムシはかせに なれるぞ!!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	おおきなテントだ
	これなら、こども10にんくらいなら
	はいれそうだ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"ファミリーようの、おおがたテントだ"
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	テントをみると、
	キャンプにきたじっかんがわく
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	なかにはナニがはいっているのか
	なかみがぎっしりつまった
	リュックサックだ
	"""
	keyWait
	end
}
script 224 mmbn2 {
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 230
		jumpIfOutOfRange = continue
	msgOpen
	"""
	水とうの ようだが
	のみものは 入っていないようだ・・・
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	でんしコンロだ
	コンピュータせいぎょの、
	きょうりょくな ひで
	"""
	keyWait
	clearMsg
	"バーベキューにもってこいだ"
	keyWait
	clearMsg
	"なんと、プラグインできるようだ"
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	ひとむかしまえの
	ふつうのコンロだ
	"""
	keyWait
	clearMsg
	"プラグインはできない"
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	このなかには、キンキンにひえた
	ジュースがはいっている
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	いかにもキャンプじょうらしい
	木の テーブルと、イスだ
	"""
	keyWait
	clearMsg
	"もくめが うつくしい"
	keyWait
	end
}
script 230 mmbn2 {
	checkFlag
		flag = 656
		jumpIfTrue = 231
		jumpIfFalse = continue
	flagSet
		flag = 659
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! これ 水とうの かたちをした
	きばくそうち みたい!
	プラグイン しよう!
	"""
	keyWait
	end
}
script 231 mmbn2 {
	msgOpen
	"""
	水とうガタの きばくそうち だ
	プラグイン できる
	"""
	keyWait
	end
}
script 232 mmbn2 {
	msgOpen
	"""
	水とうだ
	中には コーヒーが 入っているようだ
	"""
	keyWait
	end
}
script 234 mmbn2 {
	msgOpen
	"""
	テレビの ちゅうけいしゃ だ
	ほうそうに つかう きざいが
	ところせましと つみこまれている
	"""
	keyWait
	clearMsg
	"これは プラグイン できそうだ!"
	keyWait
	end
}
