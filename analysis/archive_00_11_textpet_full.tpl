@archive 074BBC8
@size 255

script 0 mmbn2 {
	checkFlag
		flag = 52
		jumpIfTrue = 1
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
	今日は マリンハーバーから
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
		target = 2
}
script 1 mmbn2 {
	checkChapter
		lower = 64
		upper = 71
		jumpIfInRange = 106
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 93
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 98
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 85
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 31
		jumpIfInRange = 54
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 44
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	しょうねん、しってる?
	ニュースは いきている! 
	"""
	waitSkip
		frames = 10
	"なんてネ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
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
			jump = 3,
			jump = 4,
			jump = continue
		]
	end
}
script 3 mmbn2 {
	checkFlag
		flag = 48
		jumpIfTrue = 5
		jumpIfFalse = continue
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"じゃ、ホンバン かいしでーす!!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 4 mmbn2 {
	flagClear
		flag = 49
	flagClear
		flag = 50
	flagClear
		flag = 51
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"あら、それって CM?"
	keyWait
	end
}
script 5 mmbn2 {
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
script 6 mmbn2 {
	checkFlag
		flag = 49
		jumpIfTrue = 16
		jumpIfFalse = continue
	checkFlag
		flag = 50
		jumpIfTrue = 17
		jumpIfFalse = continue
	checkFlag
		flag = 51
		jumpIfTrue = 18
		jumpIfFalse = 18
}
script 8 mmbn2 {
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
script 9 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"また NGだしちゃった・・・"
	keyWait
	end
}
script 10 mmbn2 {
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
script 11 mmbn2 {
	flagSet
		flag = 48
	msgClose
	waitHold
}
script 12 mmbn2 {
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
		target = 8
}
script 13 mmbn2 {
	flagSet
		flag = 54
	flagClear
		flag = 50
	end
}
script 14 mmbn2 {
	flagSet
		flag = 55
	flagClear
		flag = 51
	end
}
script 16 mmbn2 {
	checkFlag
		flag = 53
		jumpIfTrue = 9
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
	"これは キミへの ギャラ、"
	waitSkip
		frames = 30
	"\nうけとってね"
	keyWait
	clearMsg
	jump
		target = 12
}
script 17 mmbn2 {
	checkFlag
		flag = 54
		jumpIfTrue = 9
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
		target = 13
}
script 18 mmbn2 {
	checkFlag
		flag = 55
		jumpIfTrue = 9
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
		target = 14
}
script 20 mmbn2 {
	checkFlag
		flag = 52
		jumpIfTrue = 28
		jumpIfFalse = continue
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"ハイ! カメラ まわりましたー!!"
	keyWait
	end
}
script 22 mmbn2 {
	checkFlag
		flag = 604
		jumpIfTrue = 35
		jumpIfFalse = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ここは じんこうのシマ、
	マリンハーバーだ
	"""
	keyWait
	clearMsg
	"""
	そして
	オクに そびえる 大きな たてものが
	オフィシャルセンターだ!
	"""
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ここが ぜんこくの ネットバトラーの
	そうほんざん、
	オフィシャルセンターの 入口です
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 604
		jumpIfTrue = 36
		jumpIfFalse = continue
	end
}
script 24 mmbn2 {
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 48
		jumpIfOutOfRange = continue
	checkFlag
		flag = 604
		jumpIfTrue = 37
		jumpIfFalse = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"え、えっと・・・あの・・・"
	keyWait
	end
}
script 25 mmbn2 {
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 49
		jumpIfOutOfRange = continue
	checkFlag
		flag = 604
		jumpIfTrue = 38
		jumpIfFalse = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"なによ? なにが いいたいわけ?"
	keyWait
	end
}
script 26 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 103
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 83
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkFlag
		flag = 604
		jumpIfTrue = 39
		jumpIfFalse = continue
	mugshotShow
		mugshot = Maid
	msgOpen
	"いらっしゃいませ!"
	keyWait
	clearMsg
	"""
	・・・あら おきゃくさんじゃないの?
	な~んだ・・・
	"""
	keyWait
	end
}
script 27 mmbn2 {
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkFlag
		flag = 604
		jumpIfTrue = 40
		jumpIfFalse = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ハーァ・・・
	おハナを見てると
	ココロが やすまるよ
	"""
	keyWait
	clearMsg
	"""
	おじさんたちのような
	けんきゅうの しごとには
	ココロの うるおいが ひつようなんだ
	"""
	keyWait
	end
}
script 28 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 108
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 94
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 99
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 86
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 31
		jumpIfInRange = 79
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"""
	ケロさんの ゲンキさは
	アナウンサーの 中でも いちりゅうだね!
	"""
	keyWait
	clearMsg
	"""
	これで あとちょっと
	しゃべるのが うまかったらなぁ・・・
	"""
	keyWait
	end
}
script 29 mmbn2 {
	checkFlag
		flag = 604
		jumpIfTrue = 41
		jumpIfFalse = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"オー! ニホンは ハイテクですねー!"
	keyWait
	clearMsg
	"""
	しかし ワタシの クニは
	ウイルスたいこく デース!
	"""
	keyWait
	clearMsg
	"""
	バスティングの テクニックは
	みんな スゴいんですヨー!
	"""
	keyWait
	end
}
script 30 mmbn2 {
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkFlag
		flag = 604
		jumpIfTrue = 42
		jumpIfFalse = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ボク ケロさんの ファンなんだ~!
	かわいい おねえさんって かんじでしょ?
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	どうだった オフィシャルセンターは?
	ネットバトルの めいじんには
	あったかい?
	"""
	keyWait
	clearMsg
	"""
	・・・あ、そういえば
	今日は 休みって いってたな・・・
	"""
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ふぁ~ぁ、
	ポカポカして ねむくなっちゃうわ
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	きょ・・きょうは そのあの・・・
	だ・だいじな はなしが・・・
	"""
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	わかってるわよ! だから
	わざわざ こうして あってるんでしょ!
	"""
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"たいくつ~~"
	waitSkip
		frames = 30
	"だナ"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	さてと
	そろそろ しごとに もどるか・・・
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	オー! ニホンは こんなボーイでも
	Bライセンスを もってマスかー!
	ハイテクでーすねー!
	"""
	keyWait
	end
}
script 42 mmbn2 {
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ケロさんの おうえんか つくったんだ
	じゃあ うたうよ
	"""
	keyWait
	clearMsg
	"キューティ "
	waitSkip
		frames = 10
	"キューティ "
	waitSkip
		frames = 20
	"ケロ! "
	waitSkip
		frames = 20
	"ケロ!"
	waitSkip
		frames = 20
	"\nK・"
	waitSkip
		frames = 10
	"E・"
	waitSkip
		frames = 10
	"R・"
	waitSkip
		frames = 10
	"O "
	waitSkip
		frames = 10
	"ケロ! "
	waitSkip
		frames = 20
	"ケロ!"
	waitSkip
		frames = 30
	"\n"
	textSpeed
		delay = 8
	"ゲコゲコゲコゲコ・・・"
	waitSkip
		frames = 30
	textSpeed
		delay = 4
	"ぅ~~~~"
	waitSkip
		frames = 20
	"ケロッ!"
	keyWait
	clearMsg
	"どう?"
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	あ! おてがらの しょうねん!
	ケロも あのスクープで
	きょくちょうしょう よ!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 45 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	キミは、「プログラムアドバンス」と いう
	げんしょうを しっているかい?
	"""
	keyWait
	clearMsg
	"""
	ある きまった くみあわせで
	チップを くみあわせると、
	"""
	keyWait
	clearMsg
	"""
	そのチップが しんかして、
	すごいパワーの チップに なるらしいんだ
	"""
	keyWait
	clearMsg
	"ん? どういう くみあわせ かって?"
	waitSkip
		frames = 30
	"\nそれが わかりゃあ くろうしないさ"
	keyWait
	clearMsg
	"でも きいたハナシに よると、"
	keyWait
	clearMsg
	"""
	チップコードが ABCDE みたいに
	じゅんばんに なっている チップには、
	なにか ヒミツが あるらしいよ
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	この たてものは、
	オフィシャルネットバトラーきょうかいの
	ほんぶです
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	この うみの むこうには
	なにが あるんだろう?
	"""
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	つ、つまり・・・その・・・
	キ、キミが・・・ス、ス・・・
	"""
	keyWait
	end
}
script 49 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"もー! ハッキリしないわね!!"
	keyWait
	clearMsg
	"""
	スキなら スキって・・・
	ちゃんと いってよ!
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"""
	ワタシ、まえは レストランで
	バイトしてたんだけど、
	じきゅうが、やすいから やめたの
	"""
	keyWait
	clearMsg
	"""
	このカフェは、じきゅうも いいし
	ながめも いいから
	けっこう きに いってるんだ
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ふうっ ハナたちのおかげで、
	ずいぶんココロが うるおったよ
	"""
	keyWait
	clearMsg
	"""
	これで、シゴトにも チカラが
	はいるってもんだよ
	"""
	keyWait
	clearMsg
	"さ、ガンバるかなー"
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"このまえの ニュース 見たよ!"
	keyWait
	clearMsg
	"""
	ケロさんに
	インタビュー してもらえるなんて
	いいな~
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"""
	ケロさん とちらずに レポートできたの、
	このまえの キャンプのときが
	はじめて だったんだ
	"""
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	ただいま入った じょうほうです!
	オフィシャルセンターで なにか
	じけんが おきている もようです!!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 55 mmbn2 {
	checkChapter
		lower = 27
		upper = 31
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	ふしんしゃは・・・
	いないな・・・
	"""
	keyWait
	clearMsg
	"ヨシ!"
	keyWait
	end
}
script 56 mmbn2 {
	checkChapter
		lower = 27
		upper = 31
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"みんかんじんの かたですね"
	keyWait
	clearMsg
	"""
	いま、インターネットで
	じけんが、おきています
	"""
	keyWait
	clearMsg
	"""
	キケンなので、プラグインは、
	ひかえてください
	"""
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	なんか、インターネットで
	じけんがおきてるんだって
	"""
	keyWait
	clearMsg
	"""
	でも、オフィシャルのヒトたちが
	なんとか してくれるはずさ!
	"""
	keyWait
	end
}
script 58 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 84
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 31
		jumpIfInRange = 63
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	うーーーん、アジーナが・・・
	ブツブツ・・・
	"""
	keyWait
	clearMsg
	"""
	と いうコトは・・・
	ブツブツ・・・・
	"""
	keyWait
	clearMsg
	"""
	今の オフィシャルじゃ・・・
	・・・うーーん・・・
	"""
	keyWait
	end
}
script 59 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	しんけんな ひょうじょうの
	ケロさんも かわいいなぁ・・・
	"""
	keyWait
	clearMsg
	"""
	それにしても ナニが あったんだろ?
	オフィシャルの ひとも
	なんにも おしえてくれないけど・・・
	"""
	keyWait
	end
}
script 60 mmbn2 {
	checkChapter
		lower = 27
		upper = 31
		jumpIfInRange = 64
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	ちょっとした じけんが あってね、
	ふしんしゃが いないか
	ここで チェック しているんだ
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	オフィシャルスクエアが、
	やられてしまった・・・
	"""
	keyWait
	clearMsg
	"""
	しかし、オフィシャルのナビは
	もう ほとんどデリートされてしまい
	うつてがないのだ・・・
	"""
	keyWait
	clearMsg
	"伊集院くんは、いったいどこに・・・"
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	オフィシャルスクエアに
	のりこんできた ナビは、
	いったい なにものなの?
	"""
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"やはり、ダメだったか・・・"
	keyWait
	clearMsg
	"""
	ニホンのオフィシャルは、
	ゆうしゅうなんだが、
	にんずうが すくないんだ
	"""
	keyWait
	clearMsg
	"""
	もっと、ひろく みんかんから
	ネットバトラーを ぼしゅうしたり、
	ようせい がっこうを、つくるべきだ
	"""
	keyWait
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	じぶんの ナビが、いなければ
	いくら、オフィシャルといっても、
	なにも できないんだ・・・
	"""
	keyWait
	clearMsg
	"くそうっ!"
	keyWait
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ケロさん 今日は みかけないなー
	どこで ロケ やってんのかなぁ?
	"""
	keyWait
	end
}
script 66 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	checkFlag
		flag = 598
		jumpIfTrue = 68
		jumpIfFalse = continue
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	あ! ニホンのききを すくった
	おにいちゃん でしょ! ボクしってるよ!
	"""
	keyWait
	end
}
script 67 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 102
		jumpIfOutOfRange = continue
	checkFlag
		flag = 598
		jumpIfTrue = 69
		jumpIfFalse = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	こらこら、ヘンなこと いって
	おにいちゃんを こまらせちゃ ダメだぞ!
	"""
	keyWait
	end
}
script 68 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	ほら! ボクの いったとおりだい!
	ちゃんと ネットニュースで
	しらべたんだい!
	"""
	keyWait
	end
}
script 69 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	なんと!
	このコの いうとおり だったんだね
	これは しつれい しちゃったね
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"いらっしゃいませ!"
	waitSkip
		frames = 30
	"""
	
	・・・ふ~ん、キミ アメロッパに
	行くんだ~
	"""
	keyWait
	clearMsg
	"""
	ほんばの オープンカフェって
	やっぱり おしゃれ なのかしら・・・
	"""
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"おお! キミは!"
	keyWait
	clearMsg
	"""
	ワタシが
	こうして けんきゅうを つづけられるのも
	キミの おかげだよ
	"""
	keyWait
	end
}
script 72 mmbn2 {
	checkFlag
		flag = 329
		jumpIfTrue = 74
		jumpIfFalse = continue
	flagSet
		flag = 329
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"あ! みつかっちゃった!!"
	keyWait
	clearMsg
	"じゃ コレあげる"
	keyWait
	clearMsg
	jump
		target = 73
}
script 73 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 135
		code = Y
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 135
	" "
	printCode
		buffer = 0
		code = Y
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"もう ないの・・・"
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	じけんから だいぶ 日もたったし
	ここらあたりも いつもの ようすに
	もどりつつあるわ
	"""
	keyWait
	clearMsg
	"""
	・・・でもまた ネットマフィアが
	おそってきたら ヤバいんじゃない?
	ちょっと ふあん~
	"""
	keyWait
	end
}
script 79 mmbn2 {
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"""
	きんきゅうとくばん なんだ!
	さがって、さがって!
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"ケロさんが かえってきたー"
	keyWait
	clearMsg
	"""
	やっぱり、ケロさんは、
	マリンハーバーが、よくにあうなー
	"""
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	ワオ! これが、ウワサに なだかい
	オフィシャルセンターね!!
	"""
	keyWait
	clearMsg
	"とっても、いいトコロ!!"
	keyWait
	clearMsg
	"""
	アメロッパから みにきたかいが
	あったってモノよ!
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	あ、ニホンの ききを すくった
	おにいちゃんだ!
	"""
	keyWait
	clearMsg
	"いつも ごくろーさまです!"
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"アメロッパは、どうだった?"
	keyWait
	clearMsg
	"・・・へぇ~ そんなコトが あったの?"
	keyWait
	clearMsg
	"""
	たびさきで、であう トラブル・・・
	うつくしい おしろ、
	はくばに のった おうじさま~
	"""
	keyWait
	clearMsg
	"おとめの げんそうはひろがるわ"
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"かいがいでも、ゴスペルの ひがいか・・・"
	keyWait
	clearMsg
	"""
	ひとつの しゅうだんが、これほど
	こうはんいを しゅうげき するとは
	"""
	keyWait
	clearMsg
	"そこしれぬ、おそろしさだ・・・"
	keyWait
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	しょうねん!
	キミって トラブルメーカー?
	いつも ニュースのかおりが ぷんぷんよ?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 86 mmbn2 {
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"""
	ケロさん
	今日も いいえがお してるよ
	"""
	keyWait
	clearMsg
	"""
	きこくして すぐなのに
	つかれを 見せないのは プロだよね
	"""
	keyWait
	end
}
script 87 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"ここは、キケンです!"
	keyWait
	clearMsg
	"""
	じしんの えいきょうにより
	ツナミが はっせいする
	おそれがあります!!
	"""
	keyWait
	clearMsg
	"マリンハーバーから はなれてください!"
	keyWait
	end
}
script 88 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 91
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	せかいじゅうで、だいさいがい が
	まきおこっているんだ!
	"""
	keyWait
	clearMsg
	"""
	アメロッパじゃ オゾンそうが
	きゅうに うすくなって
	"""
	keyWait
	clearMsg
	"""
	きょうりょくな しがいせんが
	ひとびとや、のうさくもつを
	おそっているし・・・
	"""
	keyWait
	clearMsg
	"""
	アジーナじゃ だいきぼな
	こうずい・・・
	"""
	keyWait
	clearMsg
	"せかいは、どうなってしまうんだ?"
	keyWait
	end
}
script 89 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 92
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	さきの、マザーコンピュータ
	しゅうげきじけんで
	"""
	keyWait
	clearMsg
	"""
	しゅような、オフィシャルナビが
	ほとんどやられて
	"""
	keyWait
	clearMsg
	"まだ、ふっきゅう さぎょうちゅうなのよ"
	keyWait
	clearMsg
	"""
	だから、いまのオフィシャルに
	できるコトは、こうやって
	"""
	keyWait
	clearMsg
	"""
	みんかんの かたに、ちゅういを
	よびかける くらいなの
	"""
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"もう あんしんしても いいよ"
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	かんきょういじシステムが
	フリーズすると、
	あんな おそろしいコトになるなんて・・・
	"""
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ひなん かんこくは、かいじょされたわ
	もう、だいじょうぶよ
	"""
	keyWait
	end
}
script 93 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"みなさん こんにちは!"
	keyWait
	clearMsg
	"""
	今日は ネットバトルこうざ
	「めいじんにきけ!」 を
	おおくり いたしま~す!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 94 mmbn2 {
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"""
	じしんが おさまったら すぐ
	つぎのばんぐみの しゅうろく だなんて
	ウチのかいしゃも 人づかいが あらいよ
	"""
	keyWait
	clearMsg
	"""
	・・・ケロさんは
	ぜんぜん こたえてない みたいだけどね
	"""
	keyWait
	end
}
script 98 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	さきほどの じしんの
	しんどなど くわしいじょうほうは
	まだ 入ってきて いません
	"""
	keyWait
	clearMsg
	"くわしいじょうほうが 入りしだい・・・"
	keyWait
	clearMsg
	"キャッ!"
	keyWait
	clearMsg
	"いま、ゆれたよね? ね?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 99 mmbn2 {
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"また きんきゅうとくばん だよ!"
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ケロさん?
	ケロさんなら もう いいんだ
	"""
	keyWait
	clearMsg
	"""
	だって ボク
	かのじょを まもらなきゃ!!
	"""
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	ゴスペルって
	まだ つぶれてないんでしょ?
	"""
	keyWait
	clearMsg
	"""
	だから
	ボクが ぶっつぶしてやるんだい!!
	"""
	keyWait
	end
}
script 102 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ムスコのような 小さな こどもが
	オトナあいてに かてるわけ ないのに
	・・・
	"""
	keyWait
	clearMsg
	"""
	でも ゆうきを もっていることが
	ちちおやとしては うれしいんだ
	"""
	keyWait
	end
}
script 103 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"""
	バイトだい PETに 入れてたんだけど
	なくなっちゃったんだ・・・
	"""
	keyWait
	clearMsg
	"""
	ナビに きいたら
	「ウイルスに とられちゃったの~」
	だって
	"""
	keyWait
	clearMsg
	"しょっく~~~~~~"
	keyWait
	end
}
script 104 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ココロを いやし
	すこしでも アイデアが 出やすくする
	・・・
	"""
	keyWait
	clearMsg
	"""
	そうすることで すこしでも
	光さんの おやくに 立てれば、
	"""
	waitSkip
		frames = 30
	"と"
	keyWait
	end
}
script 105 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"ウフフ・・・"
	keyWait
	clearMsg
	"でも ちょっぴり ふあん・・・"
	keyWait
	end
}
script 106 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	ケロの しゅざいに よるとね、
	ゴスペルの ほんぶは ニホンに・・・
	"""
	waitSkip
		frames = 30
	"\nおっと これいじょうは オフレコなの!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 107 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	しみんネットバトラーとして
	オフィシャルセンターに
	なにか てつだいに 行くべきか・・・
	"""
	keyWait
	clearMsg
	"""
	・・・でも
	わたしには かぞくが・・・
	"""
	keyWait
	clearMsg
	"""
	・・・いや
	でもやっぱり 行くべきか・・・
	"""
	keyWait
	end
}
script 108 mmbn2 {
	mugshotShow
		mugshot = Cameraman
	msgOpen
	"""
	いっぱんしみんの しらないところで
	なにか 大きなじけんが
	おきようと している
	"""
	keyWait
	clearMsg
	"""
	それを つたえるのが
	ボクたちの しめいなんだ
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 141
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 141
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	おねえちゃんが、ワタシのコト
	さがしてるの?
	"""
	keyWait
	clearMsg
	"""
	もう、おねえちゃんは
	しんぱいしょうだな
	"""
	keyWait
	clearMsg
	"""
	ワタシはひとりでも
	だいじょうぶなのに
	"""
	keyWait
	clearMsg
	"""
	ひととおりかんこうしたら
	かえるって、おねえちゃんに
	いっておいて
	"""
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	あ~ウミはきもちいいな~
	かえりたくなくなってきちゃった
	"""
	keyWait
	end
}
script 192 mmbn2 {
	checkFlag
		flag = 3204
		jumpIfTrue = 197
		jumpIfFalse = continue
	checkFlag
		flag = 143
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 142
		jumpIfTrue = 193
		jumpIfFalse = continue
	flagSet
		flag = 142
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	ボクがいらいしゃだよ
	キミがボクの いらいを
	きいてくれるんだね
	"""
	keyWait
	clearMsg
	"""
	ひとめみてわかったよ
	「このしょうねんは タダものじゃない」
	ってね
	"""
	keyWait
	clearMsg
	"""
	ボクからの いらいなんだけどね
	あるナビをデリートしてほしい
	"""
	keyWait
	clearMsg
	"""
	そのナビは、おそらくインターネットの
	デンサンエリアにひそんでいるはずなんだ
	"""
	keyWait
	clearMsg
	"""
	あちこちの プログラムに
	ウイルスを まきちらしている
	コマったヤツなんだ
	"""
	keyWait
	clearMsg
	"""
	ぶじ、ナビをデリートできれば
	れんらくしにきてくれ
	"""
	keyWait
	clearMsg
	"""
	にんそうのワルいナビだから
	ひとめでわかるとおもう
	たのんだよ
	"""
	keyWait
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"いらいの かくにん かい?"
	keyWait
	clearMsg
	"あるナビを デリートしてほしいんだ"
	keyWait
	clearMsg
	"""
	そのナビは、おそらくインターネットの
	デンサンエリアにひそんでいるはずなんだ
	"""
	keyWait
	clearMsg
	"""
	あちこちの プログラムに
	ウイルスを まきちらしている
	コマったヤツなんだ
	"""
	keyWait
	clearMsg
	"""
	ぶじ、ナビをデリートできれば
	れんらくしにきてくれ
	"""
	keyWait
	clearMsg
	"""
	かなり、きょうぼうなヤツだから
	気をつけてくれよ
	"""
	keyWait
	end
}
script 194 mmbn2 {
	flagSet
		flag = 3204
	flagClear
		flag = 82
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	おおっ、やってくれたのか!!
	かんしゃするぜ!
	"""
	keyWait
	clearMsg
	"""
	じつは、ボクはオフィシャルなんだが
	オフィシャルは、あくにんにカオが
	バレているコトがおおいんだ
	"""
	keyWait
	clearMsg
	"""
	だから、しみんネットバトラーの
	キミに いらいしたんだ
	よくやってくれたね!!
	"""
	keyWait
	clearMsg
	"""
	コレはキミへの ほうしゅうだよ
	うけとってくれ
	"""
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
	clearMsg
	jump
		target = 196
}
script 196 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	キミはセンスがよさそうだな
	炎山くんと どっちがうえかな?
	"""
	keyWait
	end
}
script 197 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"がんばって、ウデをみがけよ!"
	keyWait
	end
}
script 198 mmbn2 {
	checkFlag
		flag = 3209
		jumpIfTrue = 202
		jumpIfFalse = continue
	checkFlag
		flag = 153
		jumpIfTrue = 201
		jumpIfFalse = continue
	flagSet
		flag = 153
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	ん? 「ひまわりちゃん」を
	さがしているとな?
	"""
	keyWait
	clearMsg
	"""
	そりゃアタシのコトじゃよ
	なにか ようかの?
	"""
	keyWait
	clearMsg
	"ん? このてがみをアタシに?"
	keyWait
	clearMsg
	jump
		target = 199
}
script 199 mmbn2 {
	mugshotHide
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 52
	"""
	」を
	てわたした!!
	"""
	itemTake
		item = 52
		amount = 1
	keyWait
	clearMsg
	jump
		target = 200
}
script 200 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"どれどれ、よんでみるとするかの"
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	keyWait
	clearMsg
	"""
	んまっ!! これは、
	ラヴレターでないかい!
	"""
	keyWait
	clearMsg
	"""
	このトシで こんなもんもらうなんて
	おもうてもみんだわ!
	"""
	keyWait
	clearMsg
	"""
	それに、なんて じょうねつてきな
	ぶんしょうじゃ、
	とろけてしまいそうじゃの!
	"""
	keyWait
	clearMsg
	"""
	このてがみをくれた とのがたは、
	きっと ステキなヒトなんじゃろうな
	"""
	keyWait
	clearMsg
	"""
	わすれかけていた
	アツいかんじょうが
	よみがえってきたわい!!
	"""
	keyWait
	clearMsg
	"""
	へんじをきかせろ?
	また せっかちなハナシじゃのう
	"""
	keyWait
	clearMsg
	"""
	でも、こんな てがみがかけるヒトじゃ
	ワルいヒトでは、ないじゃろう
	"""
	keyWait
	clearMsg
	"""
	ぼうや、このてがみのヌシに
	つたえておくれ
	"""
	keyWait
	clearMsg
	"「まずは、おともだち から」とな"
	keyWait
	clearMsg
	"よろしゅう たのんだよ"
	keyWait
	end
}
script 201 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	あの てがみ、どんなヒトからなんじゃろ
	トキメクのう
	"""
	keyWait
	end
}
script 202 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	あのじいさんと、
	こんど、いっしょにおんせんに
	いくんじゃ
	"""
	keyWait
	clearMsg
	"ええじゃろ"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ここから おくじょうに いる人の
	ようすが 見える!
	"""
	keyWait
	end
}
script 221 mmbn2 {
	checkFlag
		flag = 243
		jumpIfTrue = 227
		jumpIfFalse = continue
	msgOpen
	"""
	カフェの カンバンだ!
	メニューが かいてある!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	カフェの テーブルだ!
	ざんねんながら たべものは ない
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	さまざまな、おハナが さきみだれる
	きれいな おハナばたけ だ
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	ネットバトラー もしくは
	ライセンスしけんの じゅけんひょうを
	おもちのかた いがい たちいりキンシ!
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	オフィシャルセンターの
	こうしきマーク だ
	"""
	keyWait
	end
}
script 226 mmbn2 {
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
script 227 mmbn2 {
	flagSet
		flag = 304
	msgOpen
	"ナニか かかれている・・・"
	keyWait
	clearMsg
	"「大いなる みずがめ\n 4本スギの おくに立つもの」"
	keyWait
	end
}
