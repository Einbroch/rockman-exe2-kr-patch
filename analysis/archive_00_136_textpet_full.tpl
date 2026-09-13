@archive 07727D0
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 31
		upper = 31
		jumpIfInRange = 16
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 30
		jumpIfInRange = 12
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ハァイ! シアワセですか?
	コトブキですか?
	"""
	keyWait
	clearMsg
	"""
	そうですココは、シアワセのマチ
	コトブキスクエアです!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 31
		upper = 31
		jumpIfInRange = 17
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 30
		jumpIfInRange = 13
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	「バグのカケラ コウカンジョ」には
	もう イったかい?
	"""
	keyWait
	clearMsg
	"""
	このトビラをハイったトコロに
	あるんだケド
	"""
	keyWait
	clearMsg
	"""
	デンノウセカイに、チらばる
	「
	"""
	printItem
		buffer = 0
		item = 69
	"""
	」を
	チップにコウカンしてくれるんだ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 69
	"」を ごゾンジですか?"
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 69
	"""
	」は
	それジタイでは ナンのヨウも ナさない
	ジャンクデータ なのですが、
	"""
	keyWait
	clearMsg
	"""
	ホウっておくと
	バグに シンカする とイう
	ヤッカイな シロモノ なのです
	"""
	keyWait
	clearMsg
	"""
	ワが コトブキスクエアでは
	「
	"""
	printItem
		buffer = 0
		item = 69
	"""
	」を
	イッテに アツめて ショブンしています
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 31
		upper = 31
		jumpIfInRange = 18
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 30
		jumpIfInRange = 14
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	モウシワケ アリマセンガ
	ココカラサキハ イッパンノカタハ
	ゴニュウジョウ デキマセン
	"""
	keyWait
	end
}
script 4 mmbn2 {
	checkChapter
		lower = 31
		upper = 31
		jumpIfInRange = 19
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 30
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"ハジめて ココに キたんですけど・・・"
	keyWait
	clearMsg
	"""
	メが クラクラするんだけど
	ミョウに キブンが ヨくなってきました
	"""
	keyWait
	clearMsg
	"""
	ミンナ シンセツだし・・・
	カエりたくなくなってきました
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ワレワレは ニホンから、イッコクもハヤく
	キキが サるように
	ヘイワのイノりを ササげます
	"""
	keyWait
	clearMsg
	"""
	ニホンの ヘイワを ネガって
	ココからイノりを ササげましょう
	"""
	keyWait
	clearMsg
	"""
	ヘ・イ・ワ!
	ヘ・イ・ワ!!
	ヘ・イ・ワ!!!
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	おお~! ニホンにヘイワが
	オトズれますように~!!!
	"""
	keyWait
	clearMsg
	"""
	ヘ・イ・ワ!
	ヘ・イ・ワ!!
	ヘ・イ・ワ!!!
	"""
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コトブキスクエア イチドウ
	ニホンノ ヘイワヲ イノッテオリマス
	"""
	keyWait
	clearMsg
	"""
	キキガ サルマデ コノイノリハ
	ツヅキマス
	"""
	keyWait
	clearMsg
	"""
	ヘ・イ・ワ!
	ヘ・イ・ワ!!
	ヘ・イ・ワ!!!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	アレ? よく ワカらないけど
	ボクもイノりをササげたく
	なってきたぞ・・・
	"""
	keyWait
	clearMsg
	"""
	ヘ・イ・ワ!
	ヘ・イ・ワ!!
	ヘ・イ・ワ!!!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	どうやら、ワレらのイノりが
	トドいたのか、キキは サった
	ようですね
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ニホンに オトズれた キョウイは、
	サッたようですね・・・
	"""
	keyWait
	clearMsg
	"""
	シアワセな ヒビが
	カエってクるのですね
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	マッタク ブッソウナ
	ヨノナカニ ナッテシマッタ モノデス
	"""
	keyWait
	clearMsg
	"""
	ミンナ コトブキスクエアニ クレバ
	シアワセニ ナレルノニ
	"""
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ヘイワを ネガい、そしてヘイワが
	オトズれた・・・
	とても ヨいコトを したキブンです
	"""
	keyWait
	end
}
script 40 mmbn2 {
	checkFlag
		flag = 529
		jumpIfTrue = 42
		jumpIfFalse = continue
	checkFlag
		flag = 526
		jumpIfTrue = 41
		jumpIfFalse = continue
	flagSet
		flag = 526
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	シミンネットバトラーの カタですか?
	ワタシが イライヌシです
	"""
	keyWait
	clearMsg
	"""
	サッソクですが、ワタシのイライは
	オフィシャルセンターにある
	"""
	keyWait
	clearMsg
	"""
	コーヒーサーバーに プラグインして
	ナカにいる ナビからあるプログラムを
	トりカエして イタダキたいのです
	"""
	keyWait
	clearMsg
	"""
	ワタシにとって
	とてもだいじな プログラムなのですが
	あるナビに ウバわれてしまったのです
	"""
	keyWait
	clearMsg
	"""
	そのナビは、ウイルスをバラまく
	ヒジョウに ワルいナビなのです
	"""
	keyWait
	clearMsg
	"""
	ジカンが ナいので、
	ジンソクに おネガいします
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	オフィシャルセンターの
	コーヒーサーバーですよ
	イソいでクダさい
	"""
	keyWait
	end
}
script 42 mmbn2 {
	checkFlag
		flag = 3201
		jumpIfTrue = 46
		jumpIfFalse = continue
	flagSet
		flag = 3201
	flagClear
		flag = 82
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	おぉっ ヤっていただけましたか
	アリガトウゴザイマス
	タスかりました
	"""
	keyWait
	clearMsg
	"""
	それで、ウバわれたプログラムは
	トりモドしてイタダけましたか?
	"""
	keyWait
	clearMsg
	jump
		target = 43
}
script 43 mmbn2 {
	itemTake
		item = 15
		amount = 1
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 15
	"""
	」を
	てわたした!!
	"""
	keyWait
	clearMsg
	jump
		target = 44
}
script 44 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	まちがいない・・・
	このプログラムです
	"""
	keyWait
	clearMsg
	"""
	・・・おミゴトでした!
	ワタシは、ライセンスシケンの
	シケンカンです
	"""
	keyWait
	clearMsg
	"""
	あなたが、ジンソクなコウドウを
	デキるかどうか
	"""
	keyWait
	clearMsg
	"タメさせてもらいました"
	keyWait
	clearMsg
	"""
	ゴウカクです
	グッド ジョブでした
	"""
	keyWait
	clearMsg
	"""
	ま、コレは アナタに
	トッてきてもらった
	プログラムのナカミなんですが・・・
	"""
	keyWait
	clearMsg
	"ゴウカクいわいに モラってクダさい"
	keyWait
	clearMsg
	jump
		target = 45
}
script 45 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 123
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 123
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
script 46 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"シケン ガンバッてクダさいね"
	keyWait
	end
}
script 60 mmbn2 {
	checkItem
		item = 19
		amount = 1
		jumpIfEqual = 62
		jumpIfGreater = 62
		jumpIfLess = continue
	checkItem
		item = 20
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 63
	itemTake
		item = 20
		amount = 1
	flagSet
		flag = 604
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ああ、そのプログラムなら
	アジーナスクエアに
	あるらしいよ
	"""
	keyWait
	clearMsg
	"""
	ともだちからのメッセージ
	とどけてくれたおれいに
	コレをあげるね
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
		item = 19
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 19
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
		mugshot = PurpleNavi
	msgOpen
	"""
	プログラムが あるのは
	アジーナスクエアだよ
	行くんなら 気をつけてね
	"""
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	サイキン トモダチが
	ケッコンしたんだって
	"""
	keyWait
	clearMsg
	"うらやましいな"
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	イラッシャイマセ!
	コトブキスクエアヘ ヨウコソ!
	"""
	keyWait
	clearMsg
	"1メイサマ ゴアンナーイ!"
	keyWait
	clearMsg
	"ヨロコンデー "
	waitSkip
		frames = 15
	"ヨロコンデー!"
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	オフィシャルスクエア イくの やめて
	ハジめて ここに キたんだけど、
	"""
	keyWait
	clearMsg
	"コトブキスクエア!"
	waitSkip
		frames = 15
	"\nタノしげで なんか いいですね"
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"いつもより ここ ニギワってません?"
	keyWait
	clearMsg
	"""
	これも
	オフィシャルセンターシュウゲキジケンの
	エイキョウ でしょうか?
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"ルールールー♪"
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ここに クると
	なんだか ウキウキ しちゃいます
	"""
	keyWait
	clearMsg
	"ラーラーラー♪"
	keyWait
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	「カイインセンヨウエリア」かー
	タノしいバショ なんだろうなー
	イってみたいなー
	"""
	keyWait
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"タノシー エガオ!"
	waitSkip
		frames = 10
	"\nシアワセ エガオ!"
	waitSkip
		frames = 10
	"\nオメデタ エガオ!"
	waitSkip
		frames = 10
	keyWait
	clearMsg
	"スマイルフル スクエア! "
	waitSkip
		frames = 20
	"""
	ソレガ
	コトブキスクエアノ モットー デス!
	"""
	keyWait
	clearMsg
	"ハハハハハハハハハハハハハハ!"
	keyWait
	end
}
script 90 mmbn2 {
	checkChapter
		lower = 56
		upper = 59
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ハッピー、ハッピー コトブキスクエア!
	ココは、シアワセのマチです
	"""
	keyWait
	clearMsg
	"あなたも、シアワセなキブンに なぁれ!"
	keyWait
	end
}
script 91 mmbn2 {
	checkChapter
		lower = 56
		upper = 59
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシタチの ネガいは タダ 1つ
	セカイのヘイワです
	"""
	keyWait
	clearMsg
	"""
	アラソいは いけませんね
	ハイ
	"""
	keyWait
	end
}
script 92 mmbn2 {
	checkChapter
		lower = 56
		upper = 59
		jumpIfInRange = 102
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	コトブキスクエアの ジョウレンは
	ミナ、オダやかなココロの モチヌシです
	"""
	keyWait
	clearMsg
	"""
	このスクエアに いるだけで
	オダやかなキブンに なれるのです
	"""
	keyWait
	end
}
script 93 mmbn2 {
	checkChapter
		lower = 56
		upper = 59
		jumpIfInRange = 103
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	キョウモ セカイニ ムケ
	シアワセ デンパヲ
	ホウシュツチュウ!!
	"""
	keyWait
	end
}
script 94 mmbn2 {
	checkChapter
		lower = 56
		upper = 59
		jumpIfInRange = 104
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ボクもコノスクエアの ジョウレンに
	なっちゃったよ!
	"""
	keyWait
	clearMsg
	"なんたって、シアワセだからね!"
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ゲンジツセカイでは、タイヘンな
	テンペンチイが オこっているようですね
	"""
	keyWait
	clearMsg
	"""
	そんなトキこそ ワレらが
	イノりを ササげて
	テンペンチイを シズめるのです
	"""
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	シ・ズ・マ・レ! シ・ズ・マ・レ!
	テ・ン・ペ・ン・チ・イ!!
	"""
	keyWait
	clearMsg
	"""
	シ・ズ・マ・レ! シ・ズ・マ・レ!
	テ・ン・ペ・ン・チ・イ!!
	"""
	keyWait
	clearMsg
	"さぁ! ごイッショに!!"
	keyWait
	end
}
script 102 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	まさか、こんなコトが
	オこるだなんて
	ヨソウ デキませんでしたね
	"""
	keyWait
	end
}
script 103 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	セカイガ ハメツスル ソノトキマデ
	コトブキスクエアハ シアワセヲ
	イノッテイマス
	"""
	keyWait
	end
}
script 104 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ゲンジツセカイは、ヒジョウに
	キケンな ジョウタイです
	"""
	keyWait
	clearMsg
	"""
	ワタシにデキるコトといえば
	やはり イノるコトぐらいです
	"""
	keyWait
	clearMsg
	"""
	シ・ズ・マ・レ! シ・ズ・マ・レ!
	テ・ン・ペ・ン・チ・イ!!
	"""
	keyWait
	clearMsg
	"""
	シ・ズ・マ・レ! シ・ズ・マ・レ!
	テ・ン・ペ・ン・チ・イ!!
	"""
	keyWait
	end
}
script 150 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ダレモ イナクナッチャッタ・・・"
	keyWait
	clearMsg
	"デモ ドコカデ コエガ キコエルヨ・・・"
	keyWait
	end
}
script 220 mmbn2 {
	checkItem
		item = 40
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
		jumpIfLess = continue
	msgOpen
	"""
	かいいん いがい
	たちいりきんし
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 40
	"""
	」
	を つかった!
	"""
	keyWait
	flagSet
		flag = 83
	end
}
