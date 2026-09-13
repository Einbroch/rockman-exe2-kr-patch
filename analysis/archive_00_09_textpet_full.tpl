@archive 074A484
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 1
		upper = 1
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"おっす! デカオ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"おぅ、熱斗!"
	keyWait
	clearMsg
	"""
	今日 学校おわったら
	みんなで インターネット しようぜ!
	"""
	keyWait
	clearMsg
	"""
	くわしいことは またあとで はなすから
	たのしみに してろよな!
	"""
	keyWait
	clearMsg
	"・・・おっ "
	waitSkip
		frames = 30
	"先生が くるぜ!"
	keyWait
	msgClose
	flagSet
		flag = 514
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 1
		upper = 1
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Mayl
	msgOpen
	"おはよう、熱斗"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あーメイル、おはよ!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	さっき デカオくんが、
	熱斗のことを よんでたよ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 1
		upper = 1
		jumpIfInRange = 27
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"よ! やいと!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"あら 光くん、おはよ"
	keyWait
	clearMsg
	"""
	どう、あなた アタシの
	コレクションのハナシ ききたいでしょ?
	
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
			jump = 7,
			jump = continue
		]
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"そういわずに ききなさいよね!\n"
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
			jump = 7,
			jump = continue
		]
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	今 アタシが ハマってるのは
	「せんす」あつめ ってわけ、
	"""
	keyWait
	clearMsg
	"""
	おうぎのカタチに こめられた アート
	って 言うのかしら、
	"""
	keyWait
	clearMsg
	"""
	じょうりゅうかいきゅう だけに
	ゆるされた、ワビサビの せかい
	って やつなのよ・・・
	"""
	keyWait
	clearMsg
	"""
	じょうりゅうかいきゅう でない
	あなたにも わかるかしら?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"わかる "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"わからない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = continue,
			jump = 9,
			jump = continue
		]
	mugshotShow
		mugshot = Yai
	"あら? ムリしなくても いいのに"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"ふふん・・・でしょうね"
	waitSkip
		frames = 30
	"""
	
	とにかく 「せんす」は
	サイコーな わけよ!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	このタナに、ボクたちが つかってる
	けいたいたんまつ、「PET」に ついて
	かいてある 本が あるよ
	"""
	keyWait
	clearMsg
	"""
	ボク おぼえちゃったし、
	ボクから おしえてあげようか?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"おしえて "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"べつにいい"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 16,
			jump = continue,
			jump = continue
		]
	mugshotShow
		mugshot = OrangeShirtBoy
	"""
	タナの本は いつでも よめるから
	熱斗も よんでみると いいかもね!
	"""
	keyWait
	end
}
script 11 mmbn2 {
	checkChapter
		lower = 4
		upper = 255
		jumpIfInRange = 36
		jumpIfOutOfRange = continue
	checkChapter
		lower = 1
		upper = 3
		jumpIfInRange = 28
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	おはよー
	今日も、熱斗と ロックマン
	なかよさげだねー
	"""
	keyWait
	clearMsg
	"""
	ボクも そんなふうに
	じぶんのナビと なかよく したいなー
	"""
	keyWait
	end
}
script 12 mmbn2 {
	checkChapter
		lower = 1
		upper = 5
		jumpIfInRange = 29
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	あしたから お休みねー
	どこ 行こっかなー ワクワク
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	えっと・・・
	PETの STARTを おして
	サブがめんに 入ると・・・
	"""
	keyWait
	clearMsg
	"""
	Eメールを よんだり、
	チップフォルダの せいりを したり
	できるのよね
	"""
	keyWait
	clearMsg
	"""
	それと、Lボタンを おすと
	PETの 中にいる ナビと
	おはなし できるんだよね
	"""
	keyWait
	clearMsg
	"""
	あたし、ドンだから
	すぐに わすれちゃうんだー
	"""
	keyWait
	flagSet
		flag = 526
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	せっかく 学校に きたのに
	かえっちゃ ダメだよ!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、
	なにか ようじわすれてない・・・?
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	じゃあ おしえてあげる
	ちょっと ながいけど いいよね?
	"""
	keyWait
	clearMsg
	mugshotHide
	msgOpen
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいよ\n"
	option
		left = 0
		right = 0
		up = 0
		down = 0
	space
		count = 2
	"やめとく"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 17,
			jump = continue,
			jump = continue
		]
	end
}
script 17 mmbn2 {
	msgOpen
	"""
	こじん用の
	「けいたいじょうほうたんまつ」、
	それが 「PET」です
	"""
	keyWait
	clearMsg
	"""
	「PErsonal Terminal」
	を ちぢめて「PET」とよんでいます
	"""
	keyWait
	clearMsg
	"""
	「PET」は、「けいたいでんわ」が
	しんかして もっと いろんなきのうが
	ついたものです
	"""
	keyWait
	clearMsg
	"""
	電子メールは もちろん、
	電子マネーで かいものができたり、
	きょうかしょのデータも 入っています
	"""
	keyWait
	clearMsg
	"""
	でも ややこしいそうさは いりません
	中に入っている ナビゲーションプログラム
	と話せば、なんでも やってくれるのです
	"""
	keyWait
	clearMsg
	"""
	たとえば、5年A組 光熱斗くんの
	PETには、「ロックマン」という ナビが
	入っています
	"""
	keyWait
	end
}
script 22 mmbn2 {
	checkFlag
		flag = 315
		jumpIfTrue = 23
		jumpIfFalse = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	きょうしつとかを スミズミまで
	しらべると、バトルチップ なんかが
	おちてることが あるよ
	"""
	keyWait
	clearMsg
	"・・・でも ここには ないなー"
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"ひょっとして・・・"
	waitSkip
		frames = 30
	"""
	ボクが
	つくえの中に かくしてた バトルチップ
	見つけられちゃった?
	"""
	keyWait
	clearMsg
	"・・・いいや、"
	waitSkip
		frames = 10
	"""
	
	さいきん つかってなかったから
	熱斗に あげる
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1792
	"熱斗くん、メールが とどいたよ!!"
	keyWait
	end
}
script 25 mmbn2 {
	flagClear
		flag = 2160
	flagClear
		flag = 2161
	flagSet
		flag = 543
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	お! きたな
	じゃ、あさの話の つづきをするぜ!
	"""
	keyWait
	clearMsg
	"""
	この前さ、インターネットに
	「オフィシャルスクエア」 ってのが
	できただろ?
	"""
	keyWait
	clearMsg
	"""
	あそこで 今、
	「しみんネットバトラー」の
	ぼしゅうを してるらしいんだ
	"""
	keyWait
	clearMsg
	"「しみんネットバトラー」・・・"
	waitSkip
		frames = 30
	"""
	
	よく わかんないけど
	なんか かっこよさそうだろ!
	"""
	keyWait
	clearMsg
	"""
	メイルと やいとも さそったから
	みんなで 行ってみようぜ!
	"""
	keyWait
	clearMsg
	"""
	まちあわせは インターネットの中、
	「オフィシャルスクエア」の 入口な!
	"""
	keyWait
	clearMsg
	"""
	かえったら すぐ
	ロックマンを インターネットに
	おくりこむんだぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 31
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	熱斗ったら もうちょっとだけ
	べんきょうも すればいいのに・・・
	"""
	waitSkip
		frames = 30
	"\nそれより、ね、"
	keyWait
	clearMsg
	"""
	デカオくんの話、おもしろそうね!
	わたしも かえったら
	ロールを インターネットにおくりこむね!
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	デカオが 言ってた
	インターネットの話 だけど
	アタシは えんりょしとくわ・・・
	"""
	keyWait
	clearMsg
	"""
	いつも ひるさがりは
	ゆうがに アフタヌーンバス、
	って きまってるの
	"""
	keyWait
	clearMsg
	"""
	バスって言っても のりもの じゃないわよ
	オフロに 入ることだからね、わかってる?
	"""
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"やったー! これでお休みだー!"
	keyWait
	end
}
script 29 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"お休み どこ行こうかしら・・・"
	waitSkip
		frames = 30
	"\nちっとも きまんないの・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	keyWait
	end
}
script 30 mmbn2 {
	checkChapter
		lower = 2
		upper = 255
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	光くんは ウイルスバスティングの
	せいせきは クラスで トップなんだけど
	ほかの かもくが ねぇ・・・
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"きいた? 熱斗くん?"
	keyWait
	clearMsg
	"""
	「オフィシャルスクエア」って いうのは
	ボクたち ネットナビが つどう
	電脳世界のまち みたいなもの なんだ
	"""
	keyWait
	clearMsg
	"""
	かいもの したり
	ほかのナビと はなしを したり・・・
	"""
	waitSkip
		frames = 15
	"\nボク、行ってみたいな~"
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	さくらいさんとか デカオくんたちなら
	もう かえったわよ
	"""
	keyWait
	clearMsg
	"""
	光くん、
	やくそくしてたんじゃ なかったの?
	"""
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	メイルちゃんたち?
	ここには きてないよ
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"みんな もうかえっちゃったよ"
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	きょうは ここで えいごの
	しゅくだいを やっちゃおうと おもって
	"""
	waitSkip
		frames = 30
	"\n・・・ゴメンね"
	keyWait
	flagSet
		flag = 593
	end
}
script 46 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 88
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 65
		jumpIfOutOfRange = continue
	checkChapter
		lower = 10
		upper = 15
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ボク じゆうけんきゅうの しゅくだい
	やってんだ
	テーマは 「イキモノの かんさつ」だよ
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	え~と、
	「カエルは 今日も しんどそうです」
	"""
	keyWait
	clearMsg
	"これで よし、と!"
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"あら 見つかっちゃったわね"
	keyWait
	clearMsg
	"""
	わたし ここの そつぎょうせいなの
	たまたま ちかくに きたから
	ひさしぶりに 中に入ってみたのよ
	"""
	keyWait
	clearMsg
	"あ~ なつかしいなぁ・・・"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	こうして つくえを 見ていると
	みんな ひとりひとりの カオが
	おもいうかんで くるのよ
	"""
	keyWait
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ボクの じゆうけんきゅう
	ちゃくちゃくと すすんでるよ!
	"""
	waitSkip
		frames = 30
	"\n熱斗は?"
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	やすみのあいだに こっそりと
	そだてて いるのさ・・・
	"""
	keyWait
	clearMsg
	"""
	なにを そだててるかって?
	ソレは、いえないな
	"""
	keyWait
	clearMsg
	"""
	でも、だっぴをくりかえして
	ちゃくじつに おおきくなっているよ
	"""
	keyWait
	clearMsg
	"フフフフフフ"
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	おおきな、じしんが つづいてるね
	ボクのそだてている アレが
	しんぱいで きちゃったよ
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"こ、こわいよう"
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	にんげんは、どうあがいても
	しぜんに かつコトは、できんのじゃ
	"""
	keyWait
	clearMsg
	"""
	あとは、なりゆきに
	まかせるしかないの
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	ワシは、そのむかし
	とてつもなく おおきな じしんを
	けいけんしておるから
	"""
	keyWait
	clearMsg
	"これくらい なんともないわ"
	keyWait
	clearMsg
	"と、いいたいトコロ じゃが"
	keyWait
	clearMsg
	"""
	あのときのコトを おもいだして
	コワくて しかたないんじゃ・・・
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	いつも、つかっている きょうしつが
	まさか、ひなんじょにかわるなんて、
	おもってもみなかったわ
	"""
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	もし、ナニかあったばあいは、
	みなさん、おちついて
	ワタシのしじに したがって くださいね
	"""
	keyWait
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	まったく、おそろしいね
	ひなん なんてしたの、
	うまれて はじめてだよ
	"""
	keyWait
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ひなんしなきゃ ならないだなんて
	じたいは、そうとう しんこくよね
	"""
	keyWait
	end
}
script 87 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ボクのおくさんが、
	おくデンだにに、いってるんだよ
	"""
	keyWait
	clearMsg
	"""
	あそこは、デンワも
	つながらないから
	"""
	keyWait
	clearMsg
	"""
	もう、しんぱいで しんぱいで
	たまらないよ~
	"""
	keyWait
	end
}
script 88 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	もう、じしんは
	おさまったんだよね
	"""
	keyWait
	clearMsg
	"ホントこわかったよ"
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"じゆうけんきゅう かんせいしたよ!"
	keyWait
	clearMsg
	"""
	でも データが
	ウイルスに けされたら どうしよう・・・
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 3203
		jumpIfTrue = 195
		jumpIfFalse = continue
	checkFlag
		flag = 141
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 140
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 140
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	いらいをうけてくれるのは
	光くんだったの?
	オドロキ!!
	"""
	keyWait
	clearMsg
	"""
	さっそくなんだけどね
	アタシのイトコの おんなのコが
	あそびにきてたんだけど、
	"""
	keyWait
	clearMsg
	"""
	かってに どこかあそびに
	行っちゃったみたいなの
	"""
	keyWait
	clearMsg
	"""
	それで、シンパイだから
	さがしてきてほしいの
	"""
	keyWait
	clearMsg
	"""
	ドンなアタシとちがって
	そのコはすんごい こうどうりょくがあって
	"""
	keyWait
	clearMsg
	"""
	へいきで メトロラインにのって
	どこかに、行ったりするの
	"""
	keyWait
	clearMsg
	"""
	ほおっておいたら
	ドコ行くか わからないのよ
	"""
	keyWait
	clearMsg
	"""
	どこにいるかだけ わかったらいいから
	みつけたら おしえてちょうだい
	"""
	keyWait
	clearMsg
	"ヨロシクね"
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	え? いらいの かくにん?
	うん いいよ
	"""
	keyWait
	clearMsg
	"""
	アタシのイトコの おんなのコが
	どこか行っちゃったから
	さがしてきてほしいの
	"""
	keyWait
	clearMsg
	"""
	ドンなアタシとちがって
	そのコはすんごい こうどうりょくがあって
	"""
	keyWait
	clearMsg
	"""
	へいきで メトロラインにのって
	どこかに、行ったりするの
	"""
	keyWait
	clearMsg
	"""
	ハァ~、そうとおくにいってるとは
	おもわないけど・・・
	"""
	keyWait
	clearMsg
	"ドコいっちゃったんだろ"
	keyWait
	end
}
script 192 mmbn2 {
	flagSet
		flag = 3203
	flagClear
		flag = 82
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	え? マリンハーバーに いたの?
	ひとりでメトロにのっていくなんて
	すえおそろしい ムスメだわ
	"""
	keyWait
	clearMsg
	"""
	光くん、アリガトね
	それじゃ、コレおれいね
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
	playerUnlock
	keyWait
	clearMsg
	"""
	レギュラーメモリの ようりょうが、
	1メガ ふえた!!
	"""
	keyWait
	clearMsg
	jump
		target = 194
}
script 194 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"やっぱり、光くんは たよりになるのね"
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	アリガトね
	さすが光くんだね!!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 0
		upper = 1
		jumpIfInRange = 233
		jumpIfOutOfRange = continue
	msgOpen
	"ブラックボードだ"
	keyWait
	clearMsg
	"""
	休み中も
	プラグイン できるように なっている
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"じかんわりひょうだ"
	keyWait
	clearMsg
	"""
	しかし、休み中は
	このひょうに こうそく されることはない
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	本だなだ
	PETについて かかれた 本がある
	よみますか?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"よむ\n"
	option
		left = 0
		right = 0
		up = 0
		down = 0
	space
		count = 2
	"やめとく"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 235,
			jump = continue,
			jump = continue
		]
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	休みあけには、このあたりの 本は
	日にあたって パリパリに
	なっているだろう
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	なにかが かわれている
	しいくバコだ・・・
	"""
	keyWait
	clearMsg
	"・・・!!"
	keyWait
	clearMsg
	"""
	土の ひょうめんが
	モゾモゾと うごいた!
	"""
	keyWait
	clearMsg
	"""
	いったい、ナニが
	しいく されているのだろうか
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	カエルが キビシいカオで
	こちらを みている・・・
	"""
	keyWait
	clearMsg
	"「こんな、アツいトコロに とじこめて\n オレを ヒモノに するキか!」"
	keyWait
	clearMsg
	"と、いわんばかりの ぎょうそうだ"
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"ナニも かわれては いない・・・"
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
	"たぶん"
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"熱斗の つくえだ"
	keyWait
	clearMsg
	"""
	大そうじで ピカピカに みがいたので
	とても キレイだ
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"メイルの つくえだ"
	keyWait
	clearMsg
	"""
	おそろしく きあいを 入れて
	そうじ したのか、
	カオが うつりそうだ
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"デカオの つくえだ"
	keyWait
	clearMsg
	"ラクガキが きえずに のこっている"
	keyWait
	clearMsg
	"「ガッツマンだいすき」"
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"やいとの つくえだ"
	keyWait
	clearMsg
	"""
	このつくえは、やいとには
	まだ 大きいようだ
	"""
	keyWait
	end
}
script 231 mmbn2 {
	msgOpen
	"""
	つぎの しぎょうしきまで
	つくえやイスも、しばしの お休みだ
	"""
	keyWait
	checkFlag
		flag = 315
		jumpIfTrue = 240
		jumpIfFalse = continue
	clearMsg
	"ん・・・つくえの中に なにかがある!"
	keyWait
	clearMsg
	flagSet
		flag = 315
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 130
		code = P
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 130
	" "
	printCode
		buffer = 0
		code = P
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	end
}
script 232 mmbn2 {
	msgOpen
	"せんせいの つくえだ"
	keyWait
	clearMsg
	"これも、ピカピカに みがいてある"
	keyWait
	end
}
script 233 mmbn2 {
	msgOpen
	"""
	ブラックボードだ
	プラグイン できるつくりだが
	今は そんなきぶん じゃなかった・・・
	"""
	keyWait
	end
}
script 235 mmbn2 {
	msgOpen
	"""
	こじん用の
	「けいたいじょうほうたんまつ」、
	それが 「PET」です
	"""
	keyWait
	clearMsg
	"""
	「PErsonal Terminal」
	を ちぢめて「PET」とよんでいます
	"""
	keyWait
	clearMsg
	"""
	「PET」は、「けいたいでんわ」が
	しんかして もっと いろんなきのうが
	ついたものです
	"""
	keyWait
	clearMsg
	"""
	電子メールは もちろん、
	電子マネーで かいものができたり、
	きょうかしょのデータも 入っています
	"""
	keyWait
	clearMsg
	"""
	でも ややこしいそうさは いりません
	中に入っている ナビゲーションプログラム
	と話せば、なんでも やってくれるのです
	"""
	keyWait
	clearMsg
	"""
	たとえば、5年A組 光熱斗くんの
	PETには、「ロックマン」という ナビが
	入っています
	"""
	keyWait
	end
}
script 240 mmbn2s {
	end
}
