@archive 076FFB0
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 3
		upper = 3
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 7
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	「シミンネットバトラー」を ボシュウする
	ダイ1ダンカイとして、タダイマ
	
	"""
	printItem
		buffer = 0
		item = 58
	"の シケンを やっています"
	keyWait
	clearMsg
	"あなたも ウけてみませんか?"
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"うけます!\n"
	option
		left = 0
		right = 0
		up = 0
		down = 2
	space
		count = 2
	printItem
		buffer = 0
		item = 58
	"?\n"
	option
		left = 0
		right = 0
		up = 1
		down = 0
	space
		count = 2
	"やめておきます・・・"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 3,
			jump = 2,
			jump = continue
		]
	end
}
script 1 mmbn2 {
	flagSet
		flag = 538
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"そうですか・・・"
	keyWait
	clearMsg
	"""
	タダイマ ゴウカクした みなさんに、
	「レギュラーチップシステム」を ゲンテイ
	プレゼントチュウ なのですが・・・
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	printItem
		buffer = 0
		item = 58
	"""
	を モっていると
	ライセンスの ホンシケンを
	ウけるコトが デキます
	"""
	keyWait
	clearMsg
	"""
	ホンシケンに ウかると
	「シミンネットバトラー」として
	ミトめられた コトになります
	"""
	keyWait
	clearMsg
	"""
	そうしたら イッパンのナビでは イけない
	インターネットの イロんなエリアに
	イけたり、
	"""
	keyWait
	clearMsg
	"ホカにも イロイロ いいコトが あります"
	keyWait
	clearMsg
	"さあ、まずは "
	printItem
		buffer = 0
		item = 58
	"""
	から
	ハジめましょう!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 190
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 8
		upper = 10
		jumpIfInRange = 64
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ヨウコソ!
	「オフィシャルスクエア」ヘ!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 7
		upper = 255
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 6
		jumpIfInRange = 29
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	へー!
	これは ニギやかな トコロですね!
	"""
	keyWait
	clearMsg
	"""
	ウイルスだって デないし
	これは いいや!
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"""
	けいじばんが できたら
	きっと いろんな じょうほうが
	ここに あつまってくるよ
	"""
	keyWait
	clearMsg
	"べんりに つかわなきゃネ!"
	keyWait
	end
}
script 7 mmbn2 {
	checkChapter
		lower = 7
		upper = 255
		jumpIfInRange = 34
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 6
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"イヤー、スクエアは タノしいですねー!"
	keyWait
	clearMsg
	"""
	ついつい サイフのヒモが
	ユルく なっちゃいマス!
	"""
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	printItem
		buffer = 0
		item = 58
	"""
	の しけんを
	うけることに したでガス!
	"""
	keyWait
	clearMsg
	"きあいが入るで ガッツ!!"
	keyWait
	end
}
script 9 mmbn2 {
	checkChapter
		lower = 4
		upper = 255
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	checkChapter
		lower = 3
		upper = 3
		jumpIfInRange = 17
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	おヤスみになると コドモさんの ナビを
	よくミるように なりますね
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	オフィシャルセンターノ サーバーカラ
	プラグイン シテクルト、
	ココニ デテキマス
	"""
	keyWait
	clearMsg
	"""
	アナタハ イマ、ソレイガイノ バショカラ
	プラグイン シテキタデショ?
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	サブチップ ッテイウノハ、バトルデ
	ツカウンジャナクテ サブガメンデ ツカウ
	チップデータノ コトデス
	"""
	keyWait
	clearMsg
	"""
	HPヲ カイフクシタリ
	ヨワイ ウイルスト アワナイヨウニシタリ
	イロンナ サブチップガ アリマス
	"""
	keyWait
	clearMsg
	"""
	タダシ イチド ツカウト
	ナクナッチャウ モノ ダカラ
	ソコハ チュウイデスヨ!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	checkItem
		item = 1
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 16
	checkItem
		item = 2
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 16
	flagSet
		flag = 541
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 1
	"」と 「"
	printItem
		buffer = 0
		item = 2
	"""
	」、
	ガンバッテ さがしてミてください
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	そこにいた オオきいヒトなら
	もう モンダイを やりにイきましたよ
	"""
	keyWait
	clearMsg
	"""
	さっき キてた オンナのコの ナビも
	モンダイを やりにイっている
	コロじゃ ないでしょうか
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ケイジバンガ オープン シタヨ!!"
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"オメデトう ございマス!"
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 58
	"""
	」を モっていると
	ライセンスシケンの アンナイが
	オフィシャルセンターから キます
	"""
	keyWait
	clearMsg
	"""
	ガンバって、ツギは
	Bライセンスを ゲットしてクダさい!
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	じゃあ レギュラーチップの
	セツメイを するわね
	"""
	keyWait
	clearMsg
	"ちょっと ナガいけど ジカンいい?\n"
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
			jump = 31,
			jump = continue,
			jump = continue
		]
	"""
	デキれば イチドは
	キいておいて ホしいんだけどな・・・
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"わたしたちも "
	printItem
		buffer = 0
		item = 58
	"\nゲットできたんだよ"
	keyWait
	clearMsg
	"""
	また いっしょに
	ウイルスバスティング しようねっ
	"""
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"なんとか "
	printItem
		buffer = 0
		item = 58
	"""
	を
	ゲットできたで ガッツ!
	"""
	keyWait
	clearMsg
	"デカオさま やりました!"
	waitSkip
		frames = 30
	"\nで ガッツ!!"
	keyWait
	end
}
script 29 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	おっと、
	もう こんなジカンだ
	"""
	keyWait
	clearMsg
	"""
	ハヤく プラグアウトしなきゃ
	ゴシュジンサマに オコられちゃうや
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ズイブン タクサン
	チップを カいましたよ!
	"""
	keyWait
	clearMsg
	"""
	WWWのウイルスでも なんでも
	かかってこい ってんだ!
	"""
	keyWait
	clearMsg
	"・・・へへ、"
	waitSkip
		frames = 30
	"""
	
	WWWの ジケンが カイケツしたから
	イえるんですけどね・・・
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"じゃあ セツメイするね"
	keyWait
	clearMsg
	"""
	レギュラーチップって イうのは
	カスタムガメンで マイカイ
	デてキてくれる バトルチップのコトよ
	"""
	keyWait
	clearMsg
	"""
	ヤキューとかで いつもデる センシュを
	レギュラーって イうでしょ?
	それと オナじ イミかな
	"""
	keyWait
	clearMsg
	"""
	やりかたは チップフォルダガメンで
	レギュラーにしたい チップに
	カーソルを あわせて セレクト!
	"""
	keyWait
	clearMsg
	"""
	これで アカいワクが ツいたら OK、
	イれた チップが レギュラーになって
	マイカイ デるように なるの
	"""
	keyWait
	clearMsg
	"ただしっ!"
	waitSkip
		frames = 30
	"・・・"
	keyWait
	clearMsg
	"""
	データのサイズ・・・「ヨウリョウ」が
	オオきスぎる バトルチップは
	レギュラーチップには デキません!
	"""
	keyWait
	clearMsg
	"""
	レギュラーに デキる ヨウリョウは
	フォルダを ヘンシュウチュウ、ガメンの
	イチバンウエに カいてあるわ
	"""
	keyWait
	clearMsg
	"""
	それぞれの チップの ミギにカいてある
	ヨウリョウが それより チイさいのを
	エラんでね
	"""
	keyWait
	clearMsg
	"""
	アト、ヨウリョウは 「レギュラーUP」
	とイう アイテムで フやしていけるから
	ガンバって アツめてみて
	"""
	keyWait
	clearMsg
	"そんなに ナガくなかった?"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワタシ・・・イチド カエったんですが
	ゴシュジンサマに ナイショで
	マタ キちゃいました・・・
	"""
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	とうとう
	ゼニー ツカい ハたしちゃいました
	"""
	keyWait
	clearMsg
	"""
	で、でも まだ!
	アレも ホしいなー!
	コレだって ホしいなー!
	"""
	keyWait
	end
}
script 35 mmbn2 {
	checkChapter
		lower = 55
		upper = 255
		jumpIfInRange = 165
		jumpIfOutOfRange = continue
	checkItem
		item = 59
		amount = 1
		jumpIfEqual = 56
		jumpIfGreater = 56
		jumpIfLess = continue
	flagSet
		flag = 527
	wait
		frames = 1
	end
}
script 36 mmbn2 {
	checkChapter
		lower = 66
		upper = 255
		jumpIfInRange = continue
		jumpIfOutOfRange = 37
	checkItem
		item = 62
		amount = 1
		jumpIfEqual = 39
		jumpIfGreater = 39
		jumpIfLess = continue
	checkItem
		item = 57
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 37
	checkFlag
		flag = 4
		jumpIfTrue = continue
		jumpIfFalse = 37
	flagSet
		flag = 231
	wait
		frames = 1
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"タダイマ、"
	printItem
		buffer = 0
		item = 62
	"""
	の
	シケンを ジッシしています
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
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	keyWait
	clearMsg
	printItem
		buffer = 0
		item = 62
	"を じゅけんするには、"
	keyWait
	clearMsg
	"""
	ホシの アカシと、
	アナタの ツヨさを
	ショウメイするモノとして
	"""
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 57
	"」がヒツヨウです"
	keyWait
	end
}
script 38 mmbn2 {
	flagSet
		flag = 234
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"たすかりました"
	keyWait
	end
}
script 39 mmbn2 {
	checkItem
		item = 63
		amount = 1
		jumpIfEqual = 40
		jumpIfGreater = 40
		jumpIfLess = continue
	checkLevel
		lower = 80
		upper = 100
		jumpIfInRange = continue
		jumpIfOutOfRange = 42
	flagSet
		flag = 241
	wait
		frames = 1
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	あなたはさいこうランクの
	しみんネットバトラーです
	"""
	keyWait
	end
}
script 41 mmbn2 {
	flagSet
		flag = 244
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"たすかりました"
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"タダイマ、"
	printItem
		buffer = 0
		item = 63
	"""
	の
	シケンを ジッシしています
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
	SSSシケンを ウけるには、
	アナタは まだまだミジュクすぎます
	"""
	keyWait
	clearMsg
	"""
	ジブンを もっとミガいてから
	キてクダさい
	"""
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	Bライセンスの セツメイを
	しましょーか?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"おねがいします "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"またこんど"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 57,
			jump = continue,
			jump = continue
		]
	"そういう カンガえカタも あります"
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"では、セツメイします"
	keyWait
	clearMsg
	"""
	Bライセンスを トった あなたタチは
	「シミンネットバトラー」と
	ニンテイ されました
	"""
	keyWait
	clearMsg
	"""
	シミンネットバトラーには
	ネットジケン カイケツの タメに
	ネットバトル することが ゆるされます
	"""
	keyWait
	clearMsg
	"""
	なので シミンから ヨせられる
	ネットジケン カイケツの イライを
	ヒきウけるコトが デキます
	"""
	keyWait
	clearMsg
	"""
	イマある イライを ミるには
	オフィシャルセンターに ある
	「イライケイジバン」を シラべてクダさい
	"""
	keyWait
	clearMsg
	"""
	あと、あいにく Bライセンスでは
	インターネットの コウドウハンイは
	トクに フえません
	"""
	keyWait
	clearMsg
	"""
	Aライセンスを トれば
	カイガイの インターネットに
	ジユウに イけるように なります
	"""
	keyWait
	clearMsg
	"""
	そういうコトで
	ネットシャカイの ヘイワの タメ
	ガンバって クダさいね
	"""
	keyWait
	end
}
script 60 mmbn2 {
	checkFlag
		flag = 604
		jumpIfTrue = 63
		jumpIfFalse = continue
	checkChapter
		lower = 9
		upper = 9
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	checkFlag
		flag = 601
		jumpIfTrue = 62
		jumpIfFalse = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"シケンを ウけに キたの?\n"
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
			jump = 61,
			jump = continue,
			jump = continue
		]
	"だよね"
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	たしかに このオクで
	ライセンスシケン やってるけど
	ここは アけられないんだ・・・
	"""
	keyWait
	clearMsg
	"""
	ワルいけど
	オフィシャルセンターの しけんべやから
	プラグイン してもらえるかな?
	"""
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"シケン ガンバってね"
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"Bライセンス トったんだね"
	waitSkip
		frames = 15
	"\nおめでとう!"
	keyWait
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	オフィシャルスクエアヘ
	キョウモ ヨウコソ!!
	"""
	keyWait
	clearMsg
	"""
	ワタシタチハ デンノウセカイノ
	ハッピーライフヲ サポート シマス!
	"""
	keyWait
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	あなた
	「バグのかけら」 モってますか?
	
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
			jump = 66,
			jump = continue,
			jump = continue
		]
	"""
	「バグのかけら」は ホウっておくと
	バグにシンカする ジャンクデータ です
	"""
	keyWait
	clearMsg
	"""
	デンノウセカイに オちてる
	ジャンクデータは ヒロっておく、
	それが ナビとしての マナーなのよ
	"""
	keyWait
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	「バグのかけら」って イうクライだから
	なんの ツカいミチも ナいんだけど、
	"""
	keyWait
	clearMsg
	"""
	モっていくと
	チップと コウカンしてくれる ところが
	どこかの スクエアに あるんですって
	"""
	keyWait
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	カいモノに キてさ
	マっスぐ カエるつもり だったんだけど、
	"""
	keyWait
	clearMsg
	"""
	ふらっと ハイった
	ケイジバンベヤで ヒロいモノの
	ジョウホウを ゲットしたよ!!
	"""
	keyWait
	clearMsg
	"""
	ヨウが なくても
	ちょこちょこ ノゾいてみるものですね!
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ヨーコソ!"
	keyWait
	clearMsg
	"""
	ジケンニモ マケズ
	オフィシャルスクエアハ
	オープン シテイマス
	"""
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	イりグチの プログラムクンは
	あーイってるけど、やっぱり ちょっと
	おキャクさん スクないよね
	"""
	keyWait
	clearMsg
	"""
	ゴシュジンサマの メイレイだから
	きたけど、
	アタシだって・・・
	"""
	waitSkip
		frames = 30
	"ね"
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ハジメマシテ!"
	keyWait
	clearMsg
	"""
	ワタシハ ココノ ミハリヲ スル
	プログラム デス
	"""
	keyWait
	clearMsg
	"""
	ユウカン ダッタト
	ヒョウバンノ センパイニ
	マケナイヨウ ガンバッテ ユキマス
	"""
	keyWait
	clearMsg
	"チェストォーーー!"
	keyWait
	end
}
script 85 mmbn2 {
	checkChapter
		lower = 22
		upper = 22
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	msgOpen
	mugshotShow
		mugshot = NormalNavi
	"""
	ケイジバンは イロんな ジョウホウが
	テにハイるぜ
	"""
	keyWait
	end
}
script 86 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = PurpleNavi
	"""
	アジーナの メルともに
	メールを オクったんだけど・・・
	ヘンジが カエってコないんだ
	"""
	keyWait
	end
}
script 87 mmbn2 {
	checkChapter
		lower = 22
		upper = 22
		jumpIfInRange = 121
		jumpIfOutOfRange = continue
	msgOpen
	mugshotShow
		mugshot = PurpleNavi
	"""
	♪ここは~ デンノウのマチ~♪
	そのナも~ウルワしの~ あぁ~
	オフィシャルスクエア~♪
	"""
	keyWait
	clearMsg
	"ラララ~"
	keyWait
	end
}
script 88 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = NormalNavi
	"""
	この オフィシャルスクエアの ホカにも
	デンノウスクエアはあるんだ
	"""
	keyWait
	clearMsg
	"""
	キミも キカイが あったら
	イってみるといいよ
	"""
	keyWait
	end
}
script 89 mmbn2 {
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 72
		jumpIfOutOfRange = continue
	msgOpen
	mugshotShow
		mugshot = MrProg
	"""
	オフィシャルスクエア ヲ
	アラス ヤカラガ イナイカ
	ミマワリ シテルンデス
	"""
	keyWait
	end
}
script 97 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 117
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 18
		jumpIfInRange = 116
		jumpIfOutOfRange = continue
	flagSet
		flag = 650
	wait
		frames = 1
	end
}
script 116 mmbn2 {
	flagSet
		flag = 550
	end
}
script 117 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"あなた なかなか ヤりますね"
	keyWait
	end
}
script 120 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	キョウは、ミョウに
	ヒトがスクないな・・・
	"""
	keyWait
	clearMsg
	"ハヤくキすぎたのかな?"
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ごキゲン いかがですか?
	いつも ウタをウタっている
	モノですよ
	"""
	keyWait
	clearMsg
	"""
	ウタは イイですね
	アラぶる ココロを シズめてくれます
	"""
	keyWait
	end
}
script 124 mmbn2 {
	checkChapter
		lower = 28
		upper = 30
		jumpIfInRange = 155
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 26
		jumpIfInRange = 139
		jumpIfOutOfRange = continue
	checkFlag
		flag = 596
		jumpIfTrue = 129
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	サイキン ブッソウな ジケンが
	オオいだろ?
	"""
	keyWait
	clearMsg
	"ホント どうなってんのかね?"
	keyWait
	end
}
script 125 mmbn2 {
	checkChapter
		lower = 28
		upper = 30
		jumpIfInRange = 156
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 26
		jumpIfInRange = 140
		jumpIfOutOfRange = continue
	checkFlag
		flag = 596
		jumpIfTrue = 130
		jumpIfFalse = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ハァ~、アジーナの メルトモから
	レンラク コないな・・・
	キラワれちゃったかな・・・
	"""
	keyWait
	end
}
script 126 mmbn2 {
	checkChapter
		lower = 28
		upper = 30
		jumpIfInRange = 157
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 26
		jumpIfInRange = 141
		jumpIfOutOfRange = continue
	checkFlag
		flag = 596
		jumpIfTrue = 131
		jumpIfFalse = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	さぁ~トモに ウタおう~♪
	ヨロコびのぉ~ ウ~タ~を~♪
	"""
	keyWait
	clearMsg
	"ラララ~"
	keyWait
	end
}
script 127 mmbn2 {
	checkChapter
		lower = 24
		upper = 26
		jumpIfInRange = 142
		jumpIfOutOfRange = continue
	checkFlag
		flag = 596
		jumpIfTrue = 132
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	アソコに、ウタを ウタっている
	ナビが いるだろう
	"""
	keyWait
	clearMsg
	"いいコエだよな"
	keyWait
	end
}
script 128 mmbn2 {
	checkChapter
		lower = 24
		upper = 26
		jumpIfInRange = 143
		jumpIfOutOfRange = continue
	checkFlag
		flag = 596
		jumpIfTrue = 133
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	キョウモ ミマワリ
	アシタモ ミマワリ
	マイニチ ミマワリ
	"""
	keyWait
	clearMsg
	"""
	ショウジキ シンドイデス
	デモ ワタシノ ガンバリデ
	ココノ ヘイワガ、タモタレルノデス
	"""
	keyWait
	end
}
script 129 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	この キンジョで
	プログラムに クワしいヒト・・・
	シらねえなぁ?
	"""
	keyWait
	flagSet
		flag = 597
	end
}
script 130 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	プログラムに クワしい ヒトねぇ
	うーん・・・
	このへんじゃあ きかないね
	"""
	keyWait
	flagSet
		flag = 598
	end
}
script 131 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ウツクしき マチ~♪
	ヒトビトが アツまるよ~♪
	ラララララ~♪
	"""
	keyWait
	clearMsg
	"オフィシャルスクエア~♪"
	keyWait
	flagSet
		flag = 599
	end
}
script 132 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	プログラムに クワしいヒト・・・
	ケイジバンに カキコミしとけば
	ミツかるんじゃない?
	"""
	keyWait
	flagSet
		flag = 600
	end
}
script 133 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	フー キョウモ ヘイワデスネ
	オオット!!
	キヲ ヌイテハ イケナイ!!
	"""
	keyWait
	clearMsg
	"ミマワリ ミマワリ"
	keyWait
	flagSet
		flag = 601
	end
}
script 139 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	プログラムに クワシい ヤツには
	アえたのかい?
	"""
	keyWait
	end
}
script 140 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	アタラしい メルトモでも
	サガすかぁ~
	"""
	keyWait
	end
}
script 141 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは、カンが するどいと
	よく イわれるんですが・・・
	"""
	keyWait
	clearMsg
	"なんだか、ワルい ヨカンがします"
	keyWait
	end
}
script 142 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	インターネットを アルいてたら
	オフィシャルの ナビが、
	ウロウロ してたよ
	"""
	keyWait
	clearMsg
	"ナニか あったのかな?"
	keyWait
	end
}
script 143 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	オフィシャル ノ カタカラ
	ミマワリノ キョウカヲ
	イライ サレマシタ
	"""
	keyWait
	clearMsg
	"""
	ワタシハ イツモ ゼンリョクデ、
	ミマワリ シテマスガ
	サラニ、キアイヲ イレマス
	"""
	keyWait
	clearMsg
	"カーーーーッ!!"
	keyWait
	end
}
script 149 mmbn2 {
	flagSet
		flag = 618
	wait
		frames = 1
	end
}
script 150 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ニホンに カエってこられたのですか?"
	keyWait
	clearMsg
	"それは、おカエりなさい"
	keyWait
	end
}
script 151 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	コンド、こっそりイってやろうかな
	アメロッパ・・・
	"""
	keyWait
	clearMsg
	"でも、やっぱりヒトリじゃ ムリだな"
	keyWait
	end
}
script 155 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	まさか、ココが オソわれるなんて
	オモいも しなかったぜ・・・
	"""
	keyWait
	clearMsg
	"""
	ま、グウゼン そのトキ
	オレは プラグインしてなかったから
	タスかったんだけど
	"""
	keyWait
	clearMsg
	"""
	オフィシャルのナビが、
	タクサン、デリートされちまったって
	ハナシだぜ・・・
	"""
	keyWait
	end
}
script 156 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	いつも、ミマワりしてた プログラムが、
	このアイダ、ランニュウしてきたナビに
	デリート されてしまったらしいんだよ
	"""
	keyWait
	clearMsg
	"""
	なんでも、ハンニンを
	ツカマえようと、トびカカって
	カエりウちに アったそうだよ・・・
	"""
	keyWait
	clearMsg
	"ユウカンな、プログラムだったんだね"
	keyWait
	end
}
script 157 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ヤスらかーにー ネームれー
	ワレらが、スクエアをマモった
	ユウシャタチ~
	"""
	keyWait
	clearMsg
	"う~う~う~"
	keyWait
	end
}
script 161 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 150
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"アメロッパから キてるんですか?"
	keyWait
	clearMsg
	"""
	どうです? なんだか
	フシギな キブンでしょう?
	"""
	keyWait
	clearMsg
	"""
	アナタの オペレータは
	ハルか トオくの クニにいるのに、
	アナタは ニホンに いるんですよ
	"""
	keyWait
	end
}
script 162 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 151
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"キミ、アメロッパエリアに イったの?"
	keyWait
	clearMsg
	"""
	ボクも、イチド イってみたいと
	オモってるんだけど・・・
	"""
	keyWait
	clearMsg
	"""
	オペレータさんが
	ユルして くれないんだ
	"""
	keyWait
	end
}
script 163 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"ワタシは、さすらいの ウラナイシ"
	keyWait
	clearMsg
	"""
	チカヂカ セカイは、ヒョウガキを
	ムカえるコトに なるでしょう・・・
	"""
	keyWait
	clearMsg
	"ワタシに みえるのは、ココまでです"
	keyWait
	end
}
script 164 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コンニチハ!!
	キョウモ アスモ アサッテモ!
	"""
	keyWait
	clearMsg
	"""
	オフィシャルスクエアヲ ミツメル
	プログラムクン デーース!!
	"""
	keyWait
	end
}
script 165 mmbn2 {
	checkItem
		item = 61
		amount = 1
		jumpIfEqual = 36
		jumpIfGreater = 36
		jumpIfLess = continue
	checkFlag
		flag = 3203
		jumpIfTrue = continue
		jumpIfFalse = 166
	checkFlag
		flag = 3204
		jumpIfTrue = continue
		jumpIfFalse = 166
	checkFlag
		flag = 3205
		jumpIfTrue = continue
		jumpIfFalse = 166
	checkFlag
		flag = 3208
		jumpIfTrue = continue
		jumpIfFalse = 166
	checkFlag
		flag = 3209
		jumpIfTrue = continue
		jumpIfFalse = 166
	checkFlag
		flag = 3210
		jumpIfTrue = continue
		jumpIfFalse = 166
	flagSet
		flag = 223
	wait
		frames = 1
	end
}
script 166 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"タダイマ、"
	printItem
		buffer = 0
		item = 61
	"""
	の
	シケンを ジッシしています
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
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	keyWait
	clearMsg
	"あなたが、"
	printItem
		buffer = 0
		item = 61
	"""
	を
	ジュケンするには、まだ ケイケンが
	タりないようですね
	"""
	keyWait
	clearMsg
	"""
	シケンを ウけたいのなら、
	もっと、ケイケンを ツんでから
	また キてクダさい
	"""
	keyWait
	end
}
script 170 mmbn2 {
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 175
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ケイジバンは、サイシンジョウホウが
	テにハイりヤスくて イイよな
	"""
	keyWait
	end
}
script 171 mmbn2 {
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 176
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	マスコミの ジョウホウより
	ハヤいかも シれないからね
	ホント、セカイは どうなっちまうんだ?
	"""
	keyWait
	end
}
script 172 mmbn2 {
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 177
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	たくさん ケイジバンが あるけど
	キンキュウジの ジョウホウは
	"""
	keyWait
	clearMsg
	"""
	「まちかど じょうほうケイジバン」が
	イチオシだよ
	"""
	keyWait
	end
}
script 173 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 164
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 178
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ハテ? キョウハ ミョウニ
	ヒトガ スクナイデスネ・・・
	"""
	keyWait
	clearMsg
	"""
	インターネットデ、
	ナニカ アッタノデショウカ?
	"""
	keyWait
	end
}
script 174 mmbn2 {
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 179
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ライセンスシケン、ウけようかな
	ヤめとこうかな・・・
	"""
	keyWait
	end
}
script 175 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	ゲンジツじゃ、
	ヒナンカンコクが デてるそうだぜ
	"""
	keyWait
	clearMsg
	"""
	オレタチも プラグアウト したホウが
	いいんじゃないか?
	"""
	keyWait
	clearMsg
	"それじゃ、オレ プラグアウトするわ"
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
	"""
	ゲッ!!
	オレの オペレータ、
	オレを オいて ヒナンしやがった!!
	"""
	keyWait
	end
}
script 176 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ハハハ、それ オモシロい
	ジョウダンだな!!
	"""
	keyWait
	clearMsg
	"""
	オマエさんには、ワルいけど、
	オレは プラグアウトしちゃうよ
	"""
	keyWait
	clearMsg
	"プラグアウーーーッ!!"
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
	"""
	・
	って オレもかよ!!
	"""
	keyWait
	end
}
script 177 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	キミタチの オペレータさんは
	ハクジョウだな
	"""
	keyWait
	clearMsg
	"""
	それじゃ、
	ボクは おサキに シツレイするよ
	"""
	keyWait
	clearMsg
	"プラグアウトッ!!"
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
	"""
	・
	マサカ!
	"""
	keyWait
	end
}
script 178 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	スクエアノ ナカハ、
	ヒカクテキ アンゼン ナンデスガ、
	"""
	keyWait
	clearMsg
	"""
	インターネットデハ、
	タイヘンナコトニ ナッテイル
	ヨウデス!!
	"""
	keyWait
	end
}
script 179 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	イマの インターネットや、
	ゲンジツセカイの ヨウスを
	ミるカギり、
	"""
	keyWait
	clearMsg
	"""
	とてもシケンを ウける
	ジョウキョウじゃないな・・・
	"""
	keyWait
	clearMsg
	"シケン ウけるの ヤーめた!!"
	keyWait
	end
}
script 180 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ネットショッピング ですか?
	それなら カウンター ゴしに
	ハナしカけて クダさいね
	"""
	keyWait
	end
}
script 185 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	サブチップは
	モてるカズが キまっているんだ!
	"""
	keyWait
	clearMsg
	"もしもの トキに サブチップがナイ!"
	keyWait
	clearMsg
	"""
	なんてコトが ないように
	ごリヨウは ケイカクテキ にね!
	"""
	keyWait
	end
}
script 186 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	どうやら、ゲンジツのホウは、
	テンペンチイが、サったらしいぜ
	"""
	keyWait
	end
}
script 187 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	オレと、オレの オペレータとの
	シンクロリツは、20パーセントくらいだぜ
	"""
	keyWait
	clearMsg
	"""
	ったく! ジブンのナビを
	デンノウセカイに おいてけぼりにする
	オペレータなんて シンじられないよ!
	"""
	keyWait
	end
}
script 188 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	インターネットを ミてきたけど、
	もう、コオリのカケラも ノコって
	いなかったよ
	"""
	keyWait
	end
}
script 189 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"やっぱり、ヘイワは いいなあ"
	keyWait
	end
}
script 190 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ヨウコソ オフィシャルスクエアヘ!"
	keyWait
	clearMsg
	"""
	ケイジバンモ ライセンスシケンモ
	ヘイサセズ オープン シテマス!
	"""
	keyWait
	end
}
script 191 mmbn2 {
	checkChapter
		lower = 65
		upper = 72
		jumpIfInRange = 200
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	コトブキスクエアを チョウサするタメの
	ジュンビを してるんだ
	"""
	keyWait
	clearMsg
	"""
	シミンネットバトラーの ナビとして
	おタガい ガンバろうね
	"""
	keyWait
	end
}
script 192 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	イッコクも ハヤく
	ゴスペルと タタかうべきかも
	シれませんが、
	"""
	keyWait
	clearMsg
	"""
	そのマエに ヤツラと ワタりあえるよう
	ジブンを キタえるコトも ジュウヨウです
	"""
	keyWait
	end
}
script 200 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	コトブキスクエアに ツくマエに
	ウイルスに やられちゃったよ・・・
	"""
	keyWait
	clearMsg
	"ジュンビが タりなかったのかな・・・"
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 232
		jumpIfOutOfRange = continue
	checkShopStock
		shop = 3
		jumpIfStocked = continue
		jumpIfSoldOut = 231
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワタシは ネットショウニン・・・
	イいモノ ありますよ?
	
	"""
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
			jump = 230,
			jump = continue
		]
	startShop
		shop = 3
}
script 221 mmbn2 {
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 237
		jumpIfOutOfRange = continue
	checkShopStock
		shop = 4
		jumpIfStocked = continue
		jumpIfSoldOut = 236
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは サブチップショウニン!
	イいモノ ありますよっ!
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"みる! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"みない!"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = 235,
			jump = continue
		]
	startShop
		shop = 4
}
script 222 mmbn2 {
	msgOpen
	"""
	しつないよう セキュリティシステムだ
	かたくとざされていて
	さきに すすむことはできない・・・
	"""
	keyWait
	end
}
script 223 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、
	出てかないで しけん うけようぜ
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"ショウニンは、いない・・・"
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"「このさき オフィシャルけいじばん\n げんざい こうじ中・・・」"
	keyWait
	end
}
script 226 mmbn2 {
	flagAddMail
		flag = 1797
	jump
		target = 32
}
script 227 mmbn2 {
	flagAddMail
		flag = 1802
	jump
		target = 32
}
script 228 mmbn2 {
	flagAddMail
		flag = 1804
	jump
		target = 32
}
script 230 mmbn2 {
	clearMsg
	"マタ おコしクダさい"
	keyWait
	end
}
script 231 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワタシは ネットショウニンですが、
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 232 mmbn2 {
	msgOpen
	"ネットショウニンは いない・・・"
	keyWait
	end
}
script 235 mmbn2 {
	clearMsg
	"マタ おコしクダさい!"
	keyWait
	end
}
script 236 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは サブチップショウニンですが、
	イマは イいモノ ありません!
	"""
	keyWait
	end
}
script 237 mmbn2 {
	msgOpen
	"サブチップショウニンは いない!"
	keyWait
	end
}
