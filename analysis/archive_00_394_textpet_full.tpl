@archive 07442FC
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 16
		upper = 17
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	checkChapter
		lower = 7
		upper = 7
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 5
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	まえ ここに
	おみせが あったんだけど
	つぶれちゃった みたいだね
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 7
		upper = 7
		jumpIfInRange = 31
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 5
		jumpIfInRange = 27
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	このとおりを まっすぐ 行った
	あおいヤネが 光さんの いえ、
	"""
	waitSkip
		frames = 30
	"\nたしか 熱斗くんという子が いるはずだ"
	keyWait
	clearMsg
	"""
	そのむこうの ピンクのいえが
	さくらいさんの いえ、
	"""
	waitSkip
		frames = 30
	"\nここには メイルちゃんという子が いたな"
	keyWait
	clearMsg
	"""
	おじさんは セールスマン だからね、
	いえを おぼえるのも しごとなんだ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 7
		upper = 7
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 5
		jumpIfInRange = 23
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ここの おウチは
	この 秋原町(あきはらちょう)
	イチバンの 大きさだねえ
	"""
	keyWait
	clearMsg
	"""
	ひょっとしたら 秋原町だけじゃ
	なくて、デンサンシティ ぜんたいの
	中でも イチバン 大きいかもねえ
	"""
	keyWait
	clearMsg
	"""
	お金もちは うらやましいけど、
	わたしらには わからない くろうが
	きっと あるんだろうねえ
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 7
		upper = 7
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"PETって べんりっぽいー"
	waitSkip
		frames = 30
	"""
	
	PETのない くらしなんて
	ちょっと かんがえらんないってゆっかー
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	どうだい、ボクの チップフォルダ!
	いっぱい いい バトルチップが
	入ってるだろー
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	いいなー、ボクも
	もっと バトルチップが ほしいなー
	"""
	keyWait
	end
}
script 6 mmbn2 {
	checkChapter
		lower = 7
		upper = 255
		jumpIfInRange = 36
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 5
		jumpIfInRange = 24
		jumpIfOutOfRange = continue
	checkChapter
		lower = 2
		upper = 3
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	メイルちゃんも デカオくんも
	まだ おウチにかえってない みたいだね
	"""
	keyWait
	end
}
script 7 mmbn2 {
	checkChapter
		lower = 7
		upper = 255
		jumpIfInRange = 37
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	きみ、「ウイルスバスティング」って
	しってるかい?
	
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
			jump = 8,
			jump = continue,
			jump = continue
		]
	"""
	「ウイルスバスティング」 ってのは、
	ウイルスに おかされた きかいに
	PETを プラグインして、
	"""
	keyWait
	clearMsg
	"""
	ナビを ウイルスと たたかわせて
	デリート(しょうきょ) することを
	いうんだよ
	"""
	keyWait
	clearMsg
	"""
	今の よのなか、
	「ウイルスバスティング」が できなきゃ
	生きていけないね
	"""
	keyWait
	end
}
script 8 mmbn2 {
	checkChapter
		lower = 4
		upper = 7
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	「ウイルスバスティング」の ウデが
	よければ オフィシャルセンターから
	ライセンスを もらえるらしいよ
	"""
	keyWait
	clearMsg
	"""
	そのしけんを 今
	インターネットの オフィシャルスクエアで
	やってるんだってさ
	"""
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"""
	あ、ワタシは
	「デンサンガス」の モノですが・・・
	"""
	keyWait
	clearMsg
	"""
	ごちゅうもんの ガスこうじの
	ごそうだんに きたのですが・・・
	"""
	keyWait
	clearMsg
	"""
	え?
	あやのこうじさんの おウチじゃない?
	これは シツレイしました・・・
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"ここですね・・・"
	waitSkip
		frames = 30
	"\nあやのこうじさんの いえは・・・"
	keyWait
	end
}
script 11 mmbn2 {
	checkChapter
		lower = 7
		upper = 255
		jumpIfInRange = 38
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	PETの コードを
	でんしのきかいに さしこむことを
	「プラグイン」と いいますじゃ
	"""
	keyWait
	clearMsg
	"""
	「プラグイン」すると ナビを
	でんのう世界に おくりこむことが
	できますじゃ
	"""
	keyWait
	clearMsg
	"""
	やりかたは、でんしのきかいの まえで
	Rボタンを おすだけですじゃ
	としよりにも かんたんで ええですじゃよ
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	PETの サブ画面で 見れる
	「データライブラリ」は
	バトルチップの ずかん みたいなものさ
	"""
	keyWait
	clearMsg
	"""
	ゲットした
	チップの じょうほうが とうろくされて
	いつでも 見ることが できるぞ
	"""
	keyWait
	clearMsg
	"""
	オレの データライブラリには
	もう 100しゅるい いじょうの
	チップが とうろく されてるんだ!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	メイルちゃんや デカオくん、
	さっき おウチにかえってきた みたいだよ
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"これで だい1だんかい OK!"
	waitSkip
		frames = 30
	"\nって わけさ!"
	keyWait
	clearMsg
	"あとは・・・"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ねっと! わたしも!"
	waitSkip
		frames = 30
	"\n・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"わかった・・・"
	waitSkip
		frames = 30
	"まってる"
	keyWait
	clearMsg
	"""
	でも、ぜったい 2人をたすけて
	ぶじに もどってきてね
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"すべては じゅんちょうだぜ・・・"
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	メイルちゃん、今 いそいで出てったよ
	なにかあったの?
	"""
	keyWait
	clearMsg
	"""
	え、やいとちゃんが!!
	そりゃ たいへんだ!
	"""
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	こちらの おウチ、さっきから
	ひっそり しずまりかえってるよ
	"""
	keyWait
	clearMsg
	"""
	なんだか やなよかんが するのは
	アタシ だけかい?
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	どうしたの 光くん?
	しんこくな カオしてる・・・
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	「ウイルスバスティング」の ウデが
	よければ オフィシャルセンターから
	ライセンスを もらえるらしいよ
	"""
	keyWait
	clearMsg
	"え? "
	printItem
		buffer = 0
		item = 58
	"""
	 とってきたの?
	へぇー やるなー!
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	なんだか
	大きいおウチの ほうが クサいんだよ
	気のせい かな?
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"ふぅ・・・ふぅ・・・"
	keyWait
	clearMsg
	"""
	おじさん ちょっと あるきつかれたかな?
	アタマが クラクラ するよ
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ここにあった おみせの てんちょうさんと
	おにいちゃん しりあいだったんでしょ?
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	おともだちの いえは
	おぼえておくと いいよ
	"""
	keyWait
	clearMsg
	"""
	おじゃまして インターネットに
	アクセス できたときに、おもわぬ
	ちかみちが できたりするからね
	"""
	keyWait
	clearMsg
	"""
	それには
	おともだちの でんしききの パスコードを
	おしえてもらって おかないとね
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	こちらの おウチ、さっきから
	ひっそり しずまりかえってるよ
	"""
	keyWait
	clearMsg
	"・・・"
	waitSkip
		frames = 30
	"""
	まあ!
	そんなことが あったのかい!?
	それで おともだちを たすけてあげて?
	"""
	keyWait
	clearMsg
	"そりゃ えらかったねぇー"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	バーゲンのチェックも デートのやくそくも
	PETがあれば なんだって できるんだー
	"""
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	あのコ あんまり クレクレ っていうから
	にげてきちゃったよ・・・
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	さっきの チップ いっぱい もってた
	おにいちゃん どこいったか しらない?
	"""
	keyWait
	clearMsg
	"ウェ~~~~ン!!"
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	シンパイごと なくなったんだネ
	だって あかるいかおに なったもん
	ふふっ
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	どうだい?
	ウイルスバスティング がんばってるかい?
	"""
	keyWait
	clearMsg
	"""
	オレだって ウイルスバスティングは
	けっこう やるほうなんだけどさ、
	"""
	keyWait
	clearMsg
	"""
	あの メットール ってヤツだけは
	ダイの ニガテなんだ
	"""
	keyWait
	clearMsg
	"""
	だから、オレは レギュラーチップに
	パネルアウト1を 入れてる
	"""
	keyWait
	clearMsg
	"""
	キミも ニガテな ウイルスがいたら
	そいつに ゆうこうな チップを
	レギュラーに してみるといいぞ!
	"""
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	おたくさまの おうちの いぬごや
	あれは プラグイン できますじゃの
	"""
	keyWait
	clearMsg
	"""
	おもわぬところが
	プラグイン できますもんで
	いろいろ ためしてみることですじゃの
	"""
	keyWait
	clearMsg
	"""
	そりゃ! プラグイン!
	・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"ここじゃ ダメですじゃの"
	keyWait
	end
}
script 45 mmbn2 {
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 150
		jumpIfOutOfRange = continue
	checkChapter
		lower = 10
		upper = 15
		jumpIfInRange = 63
		jumpIfOutOfRange = continue
	checkFlag
		flag = 602
		jumpIfTrue = 56
		jumpIfFalse = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	メイルちゃん、おべんきょうどうぐ もって
	どこか 出かけていったよ
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	熱斗、オフィシャルネットバトラーって
	しってる?
	
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
			jump = 47,
			jump = continue,
			jump = continue
		]
	"""
	オフィシャルネットバトラー ってのはさ
	クニが せいしきに みとめた
	ネットバトラーの ことだよ
	"""
	keyWait
	clearMsg
	"""
	ネットはんざいが おきたとき、じけんを
	かいけつ するために ネットバトル
	することを きょか されてるんだって
	"""
	keyWait
	clearMsg
	"""
	そのためなら 立ち入りキンシの ばしょに
	入ったり、ふつうの人が できないところに
	プラグインしても いいみたい
	"""
	keyWait
	clearMsg
	"""
	オフィシャルネットバトラーは
	とくべつな そんざい なんだよね
	カッコいい なぁ・・・
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"んじゃ しみんネットバトラーは?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"しってる "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"しらない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 48,
			jump = continue,
			jump = continue
		]
	"""
	しみんネットバトラーは ネットはんざいを
	かいけつ するために ネットバトル
	することを ゆるされてるけど、
	"""
	keyWait
	clearMsg
	"""
	オフィシャルネットバトラー みたいな
	とっけんは ないんだよね
	"""
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ふーん、でも いちおう いっとくと
	Bライセンス いじょうを もってる人が
	しみんネットバトラー なんだ
	"""
	keyWait
	end
}
script 49 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"オレは オフィシャルネットバトラー!"
	keyWait
	clearMsg
	"""
	ネットはんざいが おきていないか
	こうして まちを パトロールすることも
	にんむの うちさ!
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"このクニは まだ へいわだが・・・"
	keyWait
	clearMsg
	"""
	がいこくでは ネットマフィアの せいで
	大きなじけんが つぎつぎに
	おきているらしい
	"""
	keyWait
	clearMsg
	"""
	そのやりかたは まえの WWWなんかとは
	くらべものに ならないくらい
	ざんにんと いわれている・・・
	"""
	keyWait
	clearMsg
	"""
	もし そいつらが
	ニホンで かつどうを はじめたら
	おそろしいことに なるだろう・・・
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	PETの つかいかたを おぼえるのは
	ワシら としよりには たいへんな
	くろうじゃった
	"""
	keyWait
	clearMsg
	"""
	じゃが いまや PETのおかげで
	かなり べんりに くらしとるぞ
	"""
	keyWait
	clearMsg
	"・・・どれ、"
	waitSkip
		frames = 30
	"""
	
	あしたの びょういんの よやくでも
	してみると するかの・・・
	"""
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	アタチの メットガード
	だいじに ちてね
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ボクの ブイガン
	こうかん ちてあげる~
	"""
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	先生って おやすみでも
	たまに 学校に きてるのよ
	しってた?
	"""
	keyWait
	clearMsg
	"""
	ついでだから ここで
	ナビの レベルアップに ついて
	ほしゅう してあげるね・・・
	"""
	keyWait
	clearMsg
	"""
	ナビの レベルアップは
	「きょうかプログラム」を そうび
	することで 行うの
	"""
	keyWait
	clearMsg
	"""
	「HPメモリ」は
	ナビのHPの MAXを あげるプログラム
	ゲットしただけで こうかがあるわ
	"""
	keyWait
	clearMsg
	"""
	「バスターUP」は
	バスターを きょうかする プログラム、
	"""
	keyWait
	clearMsg
	"""
	サブ画面の 「ロックマン」に 入って
	きょうかしたい パラメータを
	えらぶ ひつようがあるわ
	"""
	keyWait
	clearMsg
	"""
	「きょうかプログラム」は
	ミステリーデータの 中に入ってたり
	ネットショウニンが うってたりするわね
	"""
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	秋原町 いがいへ おいでのさいは
	こちらから ちかてつ メトロラインで
	どうぞ
	"""
	keyWait
	clearMsg
	"""
	今は マリンハーバー行き を
	ごりよう いただけますよ
	"""
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"メイルちゃん、さっき かえってきたよ"
	keyWait
	end
}
script 57 mmbn2 {
	checkFlag
		flag = 590
		jumpIfTrue = 58
		jumpIfFalse = continue
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"キャンプ いくの? "
	waitSkip
		frames = 15
	"いいなー!"
	keyWait
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	しみんネットバトラーの しけん?
	ヘー かっこいいなー!
	"""
	keyWait
	end
}
script 59 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1798
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"もー! おそいよ!"
	keyWait
	clearMsg
	"""
	キャンプじょう・・・おくデンだに へは
	バスで 行こうって もう きめちゃったよ
	"""
	keyWait
	flagSet
		flag = 614
	flagSet
		flag = 661
	flagClear
		flag = 662
	flagClear
		flag = 663
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"やっときたか 熱斗! おせぇぞっ!!"
	keyWait
	clearMsg
	"ま、いいや とにかくよ!"
	keyWait
	clearMsg
	"""
	キャンプ だぜーーー!!
	なんか ワクワク するぜーーーー!!
	"""
	keyWait
	flagSet
		flag = 615
	flagSet
		flag = 662
	flagClear
		flag = 661
	flagClear
		flag = 663
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	土に まみれるのって
	この やいとちゃんの
	キャラじゃ ないのよね
	"""
	keyWait
	clearMsg
	"でも たまには いいけどね、ふふん"
	keyWait
	flagSet
		flag = 616
	flagSet
		flag = 663
	flagClear
		flag = 661
	flagClear
		flag = 662
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"メイルちゃんたちと キャンプ 行くんだー"
	keyWait
	clearMsg
	"いいナー"
	keyWait
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ワハハハハ!"
	keyWait
	clearMsg
	"""
	ボクは ネットマフィアだゾーーー!!
	ウイルスを まきちらしてやるゾーー!!
	"""
	keyWait
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ネットマフィア こわい~~~~~~
	わ~~~~~ん!!!!
	"""
	keyWait
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	マネをする こどもに
	ツミは ないけれど・・・
	"""
	keyWait
	clearMsg
	"""
	こんな わるいあそびが はやらないよう
	ネットマフィアの じょうほうを
	いっこくも はやく あつめなければ・・・
	"""
	keyWait
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"先生も キャンプに 行こうって?"
	keyWait
	clearMsg
	"""
	さそってくれるのは うれしいけど
	先生 スカート だしなぁ・・・
	"""
	keyWait
	end
}
script 68 mmbn2 {
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 156
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	キャンプへ 行くのかい?
	そりゃ いいことだよ
	"""
	keyWait
	clearMsg
	"""
	さいきんの こどもたちは
	うんどうぶそくに なりがち だからね
	"""
	keyWait
	clearMsg
	"""
	でも PETは もっていきなよ
	なんかあったときに PETが ないと
	なにかと ふべんだからね
	"""
	keyWait
	end
}
script 69 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"今日も あついなぁー"
	keyWait
	clearMsg
	"""
	いえで すずしくして
	インターネットでも やるか・・・
	"""
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	このみせの てんちょうさん
	ドコ いっちゃったんだろうね?
	"""
	keyWait
	clearMsg
	"はやく かえってきてほしいな"
	keyWait
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	こんなアツい なか
	そとまわりの シゴトは、
	かなりツラいよ・・・
	"""
	keyWait
	clearMsg
	"おじさん、たってるのが やっとだよ"
	keyWait
	clearMsg
	"""
	え? アジーナにいくのかい?
	あそこの アツさは、ハンパじゃないよ
	"""
	keyWait
	clearMsg
	"""
	インターネットで?
	あぁ、それなら アツくないよ
	"""
	keyWait
	end
}
script 77 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	おばさん、ちょきん を
	はじめたんだよ
	"""
	keyWait
	clearMsg
	"""
	いつかは こんな おおきないえを
	たてようと おもってね
	"""
	keyWait
	clearMsg
	"""
	「せんりのミチも、いっぽから」
	って いうだろ?
	"""
	keyWait
	end
}
script 78 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	この あいだ インターネットで
	メルとも みつけたの
	"""
	keyWait
	clearMsg
	"""
	コレって あたらしい、
	であいの カタチよね~
	"""
	keyWait
	clearMsg
	"キミにも、メルとも いる?"
	keyWait
	end
}
script 79 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"やだよ~"
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"そのチップ ボクにちょうだいよ~"
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	光くんは、じゆうけんきゅうの
	テーマきめた?
	"""
	keyWait
	clearMsg
	"""
	ワタシ、ゆうじゅうふだん だから、
	なかなか きまらないの
	"""
	keyWait
	end
}
script 82 mmbn2 {
	checkChapter
		lower = 18
		upper = 21
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"きいておくれ!"
	keyWait
	clearMsg
	"""
	オレ、このあいだ
	けっこんしたんだよ~
	"""
	keyWait
	clearMsg
	"""
	けっこんしきは、アメロッパで
	あげたんだよ
	"""
	keyWait
	end
}
script 90 mmbn2 {
	checkFlag
		flag = 528
		jumpIfTrue = 92
		jumpIfFalse = continue
	checkFlag
		flag = 525
		jumpIfTrue = 91
		jumpIfFalse = continue
	flagSet
		flag = 525
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ボクの いらいを
	うけてくれるのはキミか
	"""
	keyWait
	clearMsg
	"""
	いまから、いらいないようを
	せつめいするけど・・・
	"""
	keyWait
	clearMsg
	"ぜったい ダレにも いわないでくれよ"
	keyWait
	clearMsg
	"""
	じつは じっけん中のナビを
	にがしちゃったんだよ
	"""
	keyWait
	clearMsg
	"""
	そのナビは ぜんぶで 3たい
	この秋原町のどこかの 電脳世界に
	かくれているみたいなんだ
	"""
	keyWait
	clearMsg
	"""
	インターネットには、行っていないのは、
	わかっているんだが・・・
	"""
	keyWait
	clearMsg
	"""
	キミへのいらいは、にげたナビを
	さがして デリートしてほしいんだ
	"""
	keyWait
	clearMsg
	"""
	気を つけてほしいのは
	そのナビは、ウイルスを
	はっせい させることが できる
	"""
	keyWait
	clearMsg
	"""
	ナビが はっせいさせた
	ウイルスを たおすと
	ナビをデリートすることができるんだ
	"""
	keyWait
	clearMsg
	"それじゃ よろしくたのんだよ"
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"いらいないようの かくにんだよ"
	keyWait
	clearMsg
	"""
	じつは じっけん中のナビを
	にがしちゃったんだよ
	"""
	keyWait
	clearMsg
	"""
	そのナビは ぜんぶで 3たい
	この秋原町のどこかの 電脳世界に
	かくれている みたいなんだ
	"""
	keyWait
	clearMsg
	"""
	インターネットには、行っていないのは、
	わかっているんだが・・・
	"""
	keyWait
	clearMsg
	"""
	キミへのいらいは、にげたナビを
	さがして デリートしてほしいんだ
	"""
	keyWait
	clearMsg
	"""
	気を つけてほしいのは
	そのナビは、ウイルスを
	はっせい させることが できる
	"""
	keyWait
	clearMsg
	"""
	ぜったい 秋原町の中に
	いるはずだから
	ガンバってさがしておくれ!
	"""
	keyWait
	end
}
script 92 mmbn2 {
	checkFlag
		flag = 3200
		jumpIfTrue = 103
		jumpIfFalse = continue
	flagSet
		flag = 3200
	flagClear
		flag = 82
	mugshotShow
		mugshot = Scientist
	msgOpen
	"コングラチュレーション!"
	keyWait
	clearMsg
	"""
	キミ、いがいと やるね!
	ワタシの テストをクリアするとは
	"""
	keyWait
	clearMsg
	"""
	ワタシは、ライセンスしけんの
	しけんかん
	"""
	keyWait
	clearMsg
	"""
	キミの バスティングテクニックを
	ためさせてもらった
	"""
	keyWait
	clearMsg
	"""
	そのウデを もっとみがけば、
	しょうらい、オフィシャルにも
	なれるんじゃないか?
	"""
	keyWait
	clearMsg
	jump
		target = 101
}
script 93 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 115
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 105
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ボク、おおきくなったら、
	ぜったい オフィシャルネットバトラーに
	なるんだ!
	"""
	keyWait
	clearMsg
	"""
	でも、オフィシャルに なるには、
	しけんを うけなきゃ なんないんだって
	"""
	keyWait
	clearMsg
	"しけんは、イヤだな~"
	keyWait
	end
}
script 94 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 116
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 106
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	このじき、みんな りょこうに
	いったりしてるから、
	るすの いえがおおくて
	"""
	keyWait
	clearMsg
	"おじさん、しごとが すすまないよ"
	keyWait
	clearMsg
	"""
	しかし、このアツさは シャレにならんよ
	どこか、すずめる トコロは ないかな?
	"""
	keyWait
	end
}
script 95 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 117
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 107
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"いつもここで なにをしてるのかって?"
	keyWait
	clearMsg
	"""
	そりゃアンタ、おかねがおちてないか
	さがしているんだよ
	"""
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
	"じょうだんだよ、じょうだん!"
	keyWait
	clearMsg
	"""
	いつかは、こんないえを たてようと
	けついを あらためにきてるんだよ!
	"""
	keyWait
	end
}
script 96 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 118
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 108
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	この あいだ メルともにー
	あったんだけどーー
	チョーたのしかったよ
	"""
	keyWait
	clearMsg
	"たくさん メルとも つっくろ!!"
	keyWait
	end
}
script 97 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 119
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 109
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	へへ~ん
	くやしかったらとってみろ~
	"""
	keyWait
	end
}
script 98 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 110
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ケチ~"
	keyWait
	clearMsg
	"""
	チップ いちまい くらい
	ちょうだいよ~
	"""
	keyWait
	end
}
script 99 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 121
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 111
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	このハナにね、チョウチョの
	ようちゅうがいるの
	"""
	keyWait
	clearMsg
	"""
	じゆうけんきゅうのテーマに
	しようとおもってるんだ
	"""
	keyWait
	end
}
script 100 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 122
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 20
		jumpIfInRange = 112
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	いや~、アメロッパでの
	けっこんしき・・・
	"""
	keyWait
	clearMsg
	"わすれられないなぁ"
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	しょうらい ゆうぼうなキミに
	ボクからのプレゼントだ
	"""
	keyWait
	clearMsg
	jump
		target = 102
}
script 102 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 98
		amount = 1
	"""
	熱斗は、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 98
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	"""
	レギュラーメモリの ようりょうが、
	1メガ ふえた!!
	"""
	keyWait
	end
}
script 103 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	げんじょうに、
	まんぞくしちゃ いけないよ
	"""
	keyWait
	clearMsg
	"いつでも、うえを めざすんだ!"
	keyWait
	end
}
script 105 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"おにいちゃん\n"
	printItem
		buffer = 0
		item = 60
	"""
	 もってるんだ!
	すっごーーい!!
	"""
	keyWait
	clearMsg
	"みせて みせて!"
	keyWait
	end
}
script 106 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	おじさんは、シゴトで いろんなトコロに
	いくんだけど、
	"""
	keyWait
	clearMsg
	"""
	あちこちで、チップを ほしがってる
	ヒトが いるようだね
	"""
	keyWait
	clearMsg
	"""
	おじさんは、あんまり
	きょうみがないから
	よく わからないんだけどね
	"""
	keyWait
	clearMsg
	"あ~、それにしても アツい!"
	keyWait
	end
}
script 107 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	あたしも、しみんネットバトラーの
	しかくを とろうかね
	"""
	keyWait
	clearMsg
	"""
	いらいを いっぱいうけたら、
	すぐに おカネが たまるかもしれないし
	"""
	keyWait
	clearMsg
	"""
	いらいも けっこう、こまめに
	かきこまれてる みたいだからね
	"""
	keyWait
	clearMsg
	"こんど、のぞきにいってみるかね~"
	keyWait
	end
}
script 108 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	インターネットにはー、いろんな ヒトの
	ホームページからアクセスするコトが
	できるのよー
	"""
	keyWait
	clearMsg
	"""
	もくてきちに、いちばん ちかい
	ホームページからプラグインすると
	"""
	keyWait
	clearMsg
	"""
	こうりつてきに、
	いどうするコトが できるしー
	"""
	keyWait
	clearMsg
	"""
	メルともに すぐあえる ってゆーかー
	いいカンジ じゃない?
	"""
	keyWait
	end
}
script 109 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ホラ、ホラ!
	おいついてみな~!!
	"""
	keyWait
	clearMsg
	"まだまだ、はしれるぞーーー"
	keyWait
	end
}
script 110 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	チップちょうだいよ~!!
	ねーーーってばーーー!
	"""
	keyWait
	clearMsg
	"わーーーーーーーっ!!"
	keyWait
	end
}
script 111 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	チョウチョの ようちゅうがね、
	サナギに なろうとしてるの
	ホラ、ぜんぜん うごかないでしょ?
	"""
	keyWait
	clearMsg
	"はやく、チョウチョに ならないかな?"
	keyWait
	end
}
script 112 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	しんこん なのに、なんで
	いつも ひとりかって?
	"""
	keyWait
	clearMsg
	"""
	オレの おくさんは、アウトドアは で
	いつも、かってに ドコかにいっちゃうんだ
	"""
	keyWait
	clearMsg
	"""
	けっこう、さみしいんだけど
	ソコが かのじょの みりょくでも
	あるんだ!
	"""
	keyWait
	end
}
script 115 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	オフィシャルに なるために
	カラダを きたえているんだ!
	"""
	keyWait
	clearMsg
	"イチ、ニ! イチ、ニ!"
	keyWait
	end
}
script 116 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	うーーん・・・きぶんがワルい・・・
	にっしゃびょう かな・・・
	"""
	keyWait
	clearMsg
	"どこか、ひかげを さがさないと・・・"
	keyWait
	end
}
script 117 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	しみんネットバトラーしけんを
	うけてきたんだけど、
	"""
	keyWait
	clearMsg
	"""
	どうやら、アタシには むいてなかった
	みたいだね・・・
	"""
	keyWait
	clearMsg
	printItem
		buffer = 0
		item = 1
	"""
	は、いったい
	ドコに あったんだろうねえ?
	"""
	keyWait
	end
}
script 118 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	え? アジーナスクエアを
	しってるかって?
	"""
	keyWait
	clearMsg
	"いったコトないけどー、"
	keyWait
	clearMsg
	"""
	セキュリティぎじゅつ が
	すごく たかくて ゆうめいなトコロよねー
	"""
	keyWait
	clearMsg
	"""
	いちどは、いってみたいけどー
	ライセンスもってないしー
	"""
	keyWait
	end
}
script 119 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ハァ、ハァ・・・
	おいついてみろ! ハァハァ・・・
	"""
	keyWait
	end
}
script 120 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	ま、まてーーー・・・
	ゼエゼエ・・・
	"""
	keyWait
	clearMsg
	"チップ、ちょうだい~・・・"
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	チョウチョの ようちゅう、
	かんぜんに、サナギになっちゃった
	"""
	keyWait
	clearMsg
	"""
	うごかないから、あんまり
	おもしろくないの・・・
	"""
	keyWait
	end
}
script 122 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"こどもは むじゃきで、いいなあ"
	keyWait
	clearMsg
	"""
	それにしても、すごいたいりょくだな
	ずっと はしりつづけてるよ
	あの ふたり
	"""
	keyWait
	end
}
script 125 mmbn2 {
	checkChapter
		lower = 24
		upper = 31
		jumpIfInRange = 135
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	あたらしい チップが ほしいな~
	やっぱり ウイルスバスティング しないと
	ダメなのかな?
	"""
	keyWait
	end
}
script 126 mmbn2 {
	checkChapter
		lower = 24
		upper = 31
		jumpIfInRange = 136
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"ふ~、ここなら すこしは すずしいぞ"
	keyWait
	clearMsg
	"どうだい? キミも 入っていくかい?"
	keyWait
	clearMsg
	"""
	え? ココは キミの ともだちのいえ?
	まあ、かたいコトは いいっこなしだよ
	"""
	keyWait
	end
}
script 127 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 146
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 144
		jumpIfOutOfRange = continue
	checkChapter
		lower = 26
		upper = 26
		jumpIfInRange = 143
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 25
		jumpIfInRange = 137
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"さいきん インターネットでー"
	keyWait
	clearMsg
	"""
	オフィシャルの ナビを
	よく みかけるんだけどー
	"""
	keyWait
	clearMsg
	"""
	ナニか じゅうだいじけん でも
	あったのかな?
	"""
	keyWait
	clearMsg
	"""
	はなしを きこうと おもっても
	なんにも おしえてくれないしー
	"""
	keyWait
	clearMsg
	"ちょっと しんぱいー"
	keyWait
	end
}
script 128 mmbn2 {
	checkChapter
		lower = 24
		upper = 31
		jumpIfInRange = 138
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"しゅくだい はかどってる?"
	keyWait
	clearMsg
	"""
	ワタシ、ドンだから
	まだ ぜんぜん すすんでないんだ
	"""
	keyWait
	end
}
script 129 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 147
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 145
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 26
		jumpIfInRange = 139
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	いつもここで あそんでた こどもたち、
	ケンカしたらしくて いえに
	かえっちゃったんだ
	"""
	keyWait
	end
}
script 135 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	おにいちゃん、
	しみんネットバトラーなの?
	"""
	keyWait
	clearMsg
	"すっげー!"
	keyWait
	end
}
script 136 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	いやぁ、
	ここで、すずませてもらって
	だいぶ アセがひいたよ
	"""
	keyWait
	end
}
script 137 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	さっきー、インターネットでー
	オフィシャルのナビと はなしたんだけどー
	"""
	keyWait
	clearMsg
	"""
	「プラグアウト しなさい」って
	いわれたの
	"""
	keyWait
	clearMsg
	"""
	これは、やっぱり ナニかあったに
	ちがいないわねー
	"""
	keyWait
	end
}
script 138 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	やいとちゃん、
	しゅくだい みせてくれないかな?
	"""
	keyWait
	clearMsg
	"""
	でも しゅくだいは、
	じぶんで やらないと、いけないよね
	"""
	keyWait
	clearMsg
	"""
	ヒトにあまえちゃ、じぶんのタメに
	ならないもの
	"""
	keyWait
	end
}
script 139 mmbn2 {
	checkFlag
		flag = 605
		jumpIfTrue = 142
		jumpIfFalse = continue
	checkItem
		item = 18
		amount = 1
		jumpIfEqual = 141
		jumpIfGreater = 141
		jumpIfLess = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	えっ? オレと、
	よく いっしょに いるじょせい?
	"""
	keyWait
	clearMsg
	"オレの おくさんのコトかい?"
	keyWait
	clearMsg
	"""
	あぁ かのじょなら、
	キャンプじょう にいったよ
	"""
	keyWait
	clearMsg
	"""
	しんこん なのに、ダンナをおいて
	ひとりで、キャンプにいっちゃうんだもんな
	"""
	keyWait
	clearMsg
	"""
	キミ、かのじょに ようじがあるんだろ?
	それだったら、
	コレ、かのじょにわたしておいてくれない?
	"""
	keyWait
	clearMsg
	"""
	かのじょの、PETの
	じゅうでんでんちなんだ
	"""
	keyWait
	clearMsg
	"""
	やまのナカで、でんちぎれなんかおこしたら
	タイヘンだからね!
	"""
	keyWait
	clearMsg
	"そいじゃ、おねがいしたよ"
	keyWait
	clearMsg
	jump
		target = 140
}
script 140 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 18
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 18
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
script 141 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	かくにんのために いっておくけど
	ボクのおくさんは、キャンプじょうに
	いるからね
	"""
	keyWait
	clearMsg
	"よろしくたのんだよ"
	keyWait
	end
}
script 142 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ボクのおくさん、キレイだったろ
	へへッ
	"""
	keyWait
	end
}
script 143 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	じつは、またまた インターネットを
	こっそり たんさく してたんだけどー
	"""
	keyWait
	clearMsg
	"""
	みるからに、ワルそうなナビが
	オフィシャルスクエアに
	はいっていくのを みたわ
	"""
	keyWait
	end
}
script 144 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	こうきしんで、インターネットに
	はいったんだけどー
	"""
	keyWait
	clearMsg
	"""
	オフィシャルの ナビがー
	ひとりも、いなくなってたのー
	"""
	keyWait
	clearMsg
	"もう、じけんは かいけつしたのかな?"
	keyWait
	end
}
script 145 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ひとりで、タイクツだったから、
	インターネットに いったんだけど、
	"""
	keyWait
	clearMsg
	"""
	ダレも いなかったよ・・・
	いつもなら、ダレかと ぜったいあうはず
	なんだけどな・・・
	"""
	keyWait
	end
}
script 146 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	インターネットにー
	ナビが ほとんどいなかったわよ
	"""
	keyWait
	clearMsg
	"めずらしいコトも あるもんねー"
	keyWait
	end
}
script 147 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"はぁ~、タイクツだな~"
	keyWait
	end
}
script 150 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	メイルちゃん
	今日も おでかけみたい・・・
	"""
	keyWait
	clearMsg
	"ざんねんだな・・・"
	keyWait
	end
}
script 151 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	こどもひとりで アメロッパへ 行くの?
	そりゃ すごいな!
	"""
	keyWait
	clearMsg
	"""
	けど かいがいりょこうは
	キケンが いっぱいだぞ
	じゅうぶん 気を つけることだな
	"""
	keyWait
	end
}
script 152 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"え!? 熱斗 がいこくに 行くの!?"
	keyWait
	clearMsg
	"カァーーーー! かっきぃナーーー!"
	keyWait
	end
}
script 153 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	このまえ しゅっちょうで アメロッパに
	行ったとき、ここの てんちょうさん
	だった人に よくにた人を みたよ
	"""
	keyWait
	clearMsg
	"あの人・・・"
	waitSkip
		frames = 30
	"""
	
	たしか 日暮(ひぐれ)って
	名前 だったっけ?
	"""
	keyWait
	end
}
script 154 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	ふるき よき でんとうと
	さいしんの ぶんめいが ゆうごうする
	クニ・・・
	"""
	waitSkip
		frames = 30
	"それが アメロッパじゃよ"
	keyWait
	clearMsg
	"""
	おもいでを
	たくさん こさえてくるが ええて
	"""
	keyWait
	end
}
script 155 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	アメロッパと いえば
	やっぱ ブランドひん よねぇ~
	"""
	keyWait
	end
}
script 156 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	オフィシャルセンターが ネットマフィアに
	ねらわれるなんてねぇ・・・
	"""
	keyWait
	clearMsg
	"""
	まちは
	いつもどおり へいわに見えるけど、
	"""
	keyWait
	clearMsg
	"""
	ネットマフィアの まの手が
	すぐそこまで せまっているかと おもうと
	せすじが さむいよ
	"""
	keyWait
	end
}
script 157 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	このまえね、
	はじめて ひとりで メットールを
	やっつけたよ!
	"""
	keyWait
	clearMsg
	"""
	もう ママやパパに
	てつだって もらわなくても
	だいじょうぶだもん!
	"""
	keyWait
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
	とつぜん なんだけど、
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
	もし もってたら、オイラの
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
	こうかん してほしいんだ
	"""
	keyWait
	clearMsg
	"""
	オイラの ニィちゃんの
	たんじょうびいわいに あげたいんだけど
	どこにも ないんだよ
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
	ほかを あたってみるよ
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
	もつべきものは、トモダチだね!
	そんじゃあ、コレ こうかんだったね
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
	たのむよ~ オイラの
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
	もしかして
	フォルダの 中に 入ってたりしない?
	"""
	keyWait
	clearMsg
	"""
	ちゃんと
	リュックの 中に 入れとかないと
	チップが ちゃんとあるか わからないよ
	"""
	keyWait
	clearMsg
	"""
	もし もってるんだったら、
	リュックに 入れといてね
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
