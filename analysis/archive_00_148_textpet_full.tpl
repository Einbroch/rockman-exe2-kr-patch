@archive 077636C
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 121
		jumpIfOutOfRange = continue
	checkChapter
		lower = 40
		upper = 47
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	flagSet
		flag = 538
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	さっき ごろつきの ナビが
	スクエアから デてイったよ
	"""
	keyWait
	clearMsg
	"""
	マちアわせ だとか
	ショウバイが イソガしい とか
	イってたけど・・・
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 40
		upper = 47
		jumpIfInRange = 16
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"パスポートを サガしてるんですか?"
	keyWait
	clearMsg
	"""
	そういえば さっきまで ここにいた
	ごろつきの ナビが
	パスポートを モってたような・・・
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 122
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	モウスグ コクサイカイギ ナノデ
	アメロッパノ デンノウセカイ デハ
	ケイビヲ キョウカ シテイマス
	"""
	keyWait
	clearMsg
	"""
	ソノタメニ ボクタチ プログラムガ
	タクサン ツクラレマシタ
	"""
	keyWait
	clearMsg
	"ワルイヤツハ イネガー!?"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ミカケナイ カオ・・・
	ア、
	"""
	waitSkip
		frames = 15
	"アナタ ワルイナビ デスカ?\n"
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
			jump = 4,
			jump = continue,
			jump = continue
		]
	"ホッ ヨカッタ・・・"
	keyWait
	end
}
script 4 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 121
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	カイギ マデハ
	ワルイヤツハ ココニ イチャダメダ!!
	デ、
	"""
	waitSkip
		frames = 15
	"デテッテ クダサイ デス!"
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 124
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタクシハ コンカイノ ケイビデ
	スデニ 5ニンノ ナラズモノヲ
	ツカマエテ イマス
	"""
	keyWait
	clearMsg
	"""
	ナカマタチモ キット オナジヨウニ
	ガンバッテ クレテイル コトデショウ
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ガンバって ケイビしても
	それでも ワルさする ヤツが
	いるもの なんですよね・・・
	"""
	keyWait
	end
}
script 7 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ハロハローー!!"
	keyWait
	clearMsg
	"ヨーコソ! アメロッパスクエアヘ!"
	keyWait
	end
}
script 8 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 112
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 95
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ここ タノしい
	でも ウラインターネットに チカい
	だから ワルいヤツ たまにクる
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"ごろつきナビを とっちめるとは・・・"
	keyWait
	clearMsg
	"""
	もしや キミ
	ブルース とかいう ナビだろ!?
	キミ、アメロッパでも ユウメイだよ!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	アレは
	あなたの パスポート だったんですか
	トりモドせて よかったですね
	"""
	keyWait
	end
}
script 65 mmbn2 {
	checkChapter
		lower = 56
		upper = 56
		jumpIfInRange = 73
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ヘイ、ユー!!
	キャン ユー スピーク アメロピッシュ?
	"""
	keyWait
	clearMsg
	"""
	なんてね ジツは、ボクはニホンから
	キているんだ
	"""
	keyWait
	clearMsg
	"""
	いやあ、イガイと ニホンのナビが
	オオい みたいだよ
	"""
	keyWait
	end
}
script 66 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 113
		jumpIfOutOfRange = continue
	checkChapter
		lower = 60
		upper = 60
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ウラインターネットって、
	イったコトある?
	"""
	keyWait
	clearMsg
	"""
	ボクは、イったコトがナいんだけど、
	ソウトウ コワい トコロらしいよ
	"""
	keyWait
	end
}
script 67 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 111
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 94
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 81
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	アメロッパタウンにある
	ホウセキテンの ジョウレンの
	ミリオネアってヒトが いるんだけど
	"""
	keyWait
	clearMsg
	"""
	ワカくミえるけど、ケッコウ
	トシ クってるらしいよ
	"""
	keyWait
	end
}
script 68 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	アメロッパの ギジュツは
	ヒジョウに タカい
	"""
	keyWait
	clearMsg
	"""
	でも、ニホンのようなセンサイさに
	カけるんだな これが
	"""
	keyWait
	clearMsg
	"""
	ニホンと アメロッパが
	キョウリョクすれば、
	"""
	keyWait
	clearMsg
	"""
	スゴい ナビとかが
	ウまれるんじゃないのかな?
	"""
	keyWait
	end
}
script 69 mmbn2 {
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 79
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	イマハ ゲンカイタイセイ モ
	トカレ ツウジョウケイビ ニ
	モドッテイマス
	"""
	keyWait
	clearMsg
	"""
	シカシ、ヒゴロ カラノ
	ケイビガ ハンザイヲ ジゼンニ
	フセグコトガデキルノデス
	"""
	keyWait
	end
}
script 70 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 104
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 96
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 82
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	アナタハ、コノアイダノ ジケンヲ
	カイケツシタト イワレル
	ロックマンサン デハ?
	"""
	keyWait
	clearMsg
	"""
	アナタト ブルースサンハ、
	ワレワレ ケイビ プログラムノ ナカデハ
	ユウメイジン デス
	"""
	keyWait
	end
}
script 71 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 105
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 97
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 83
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ニホンニモ ワタシタチト
	オナジ タイプノ プログラムガ
	イルト キキマス
	"""
	keyWait
	clearMsg
	"""
	イチド、セカイジュウノ プログラムヲ
	マネイテ、プログラム カイギヲ
	ヒライテミタイデスネ
	"""
	keyWait
	end
}
script 72 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 106
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 98
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 84
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ナニガ オコルカ ワカラナイ
	マッタク キガ ヌケナイ
	ジョウキョウデス・・・
	"""
	keyWait
	end
}
script 73 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	いやぁ、タイヘンなコトに
	なっちゃったね
	"""
	keyWait
	clearMsg
	"""
	ニホンでは、ダイジシンが
	ツヅいているって イうじゃないか
	ホント、コワいよねえ
	"""
	keyWait
	end
}
script 75 mmbn2 {
	checkFlag
		flag = 638
		jumpIfTrue = 76
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ゲンジツセカイでは、タイヘンなコトに
	なっているみたいだね
	"""
	keyWait
	end
}
script 76 mmbn2 {
	checkFlag
		flag = 641
		jumpIfTrue = 78
		jumpIfFalse = continue
	checkFlag
		flag = 640
		jumpIfTrue = 77
		jumpIfFalse = continue
	flagSet
		flag = 640
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ヤミいしゃをヨびダす キーワード?"
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
	あぁ
	それなら、オレのトモダチがシってるって
	ハナシをキいたコトがあるなあ・・・
	"""
	keyWait
	clearMsg
	"そいつは、イマ ドコにいるかって?"
	keyWait
	clearMsg
	"""
	たしか、インターネットに チップを
	カいにイったとおもうよ
	"""
	keyWait
	clearMsg
	"""
	タブン、そんなにトオくには
	イってないとおもうけど
	"""
	keyWait
	end
}
script 77 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	インターネットのショップにいるとは
	オモうけど・・・サガしてみてよ
	"""
	keyWait
	end
}
script 78 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	なに? チップをトられた?
	ハハハ アイツのガメつさは
	ユウメイだからな
	"""
	keyWait
	end
}
script 79 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コンカイハ、インターネットデ
	イジョウガ ハッセイシマシタ
	"""
	keyWait
	clearMsg
	"""
	ナカマハ ホトンド、インターネットノ
	チョウサデ、デハラッテイマス
	"""
	keyWait
	clearMsg
	"""
	デモ ゴシンパイ ナク
	ワタクシ コウミエテモ
	"""
	keyWait
	clearMsg
	"""
	「アメロッパ ノ トラ」トイウ
	イミョウヲ モツ モサナノデス
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	インターネットが
	コオリ まみれなのは、
	ニホンでも オナじなのかい?
	"""
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	アチコチで コオリに ミチを
	フサがれて、
	"""
	keyWait
	clearMsg
	"""
	ミウゴきが トれなく なっているナビや
	プログラムを ミたよ
	"""
	keyWait
	clearMsg
	"""
	あれは、ハヤく タスけてあげないと
	アブないんじゃ ないのかな?
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシタチハ シンニュウシャニ
	タイシテ コウゲキスル システムハ
	モッテイマスガ
	"""
	keyWait
	clearMsg
	"""
	アノ コオリヲ コワス チカラハ
	モッテイマセン
	"""
	keyWait
	clearMsg
	"ツマリ オテアゲ ジョウタイデス"
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	インターネットガ コオリツイテ
	プログラムガ タダシク サドウシナイ
	"""
	keyWait
	clearMsg
	"ツマリ フリーズジョウタイ ナノデス"
	keyWait
	clearMsg
	"ウツテハ アルノデショウカ?"
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コウシテイル アイダニモ、
	セカイジュウデ ダイサイガイ ガ、
	ヒロガッテイル・・・
	"""
	keyWait
	clearMsg
	"""
	ダレカ ナントカ シテクレナイ
	デショウカ・・・
	"""
	keyWait
	end
}
script 90 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 110
		jumpIfOutOfRange = continue
	checkChapter
		lower = 60
		upper = 60
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkFlag
		flag = 1809
		jumpIfTrue = 91
		jumpIfFalse = continue
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	jump
		target = 91
}
script 91 mmbn2 {
	checkItem
		item = 68
		amount = 1
		jumpIfEqual = 93
		jumpIfGreater = 93
		jumpIfLess = continue
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"お、こないだのニィちゃん!"
	keyWait
	clearMsg
	"""
	ホウ、カギをサガしてる・・・
	ドコのカギだ?
	"""
	keyWait
	clearMsg
	"デンサンエリアのゲート?"
	keyWait
	clearMsg
	"""
	あそこは、オレがコウジしたんだぜ
	コトブキエリアにツナがるゲートのカギか
	そんなのスグにデキるぜ
	"""
	keyWait
	clearMsg
	"ちょっとマってな"
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタ・・・"
	soundPlay
		track = 265
	"ピュコーン!"
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	ホラ、デキた!
	こないだのレイだ モってけ
	"""
	keyWait
	clearMsg
	jump
		target = 92
}
script 92 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 68
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 68
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
script 93 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	オレが カギをヤったコトは
	ナイショにしておいてくれよ
	"""
	keyWait
	clearMsg
	"ミつかると メンドウだからな"
	keyWait
	end
}
script 94 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	このヘンにいた ナビたちは、
	オペレータが みんな
	プラグアウト させてしまったよ
	"""
	keyWait
	clearMsg
	"""
	おそらく、
	コオリの ヒガイを ウケるマエに
	ナビを ヒナン させたんだろうね
	"""
	keyWait
	end
}
script 95 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ウラの ヤツらのシワザだ
	きっと アイツら かなりの
	ワルだから・・・
	"""
	keyWait
	end
}
script 96 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	スクエアノ ナカハ
	オソラク アンゼンダト
	オモイマスガ、
	"""
	keyWait
	clearMsg
	"""
	マンガ イチニ ソナエテ
	プラグアウト シテオイタホウガ
	ヨイト オモワレマス
	"""
	keyWait
	end
}
script 97 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ナニガ アッテモ
	ワタシタチハ コノスクエアヲ
	マモリキッテ ミセマス
	"""
	keyWait
	end
}
script 98 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	チカゴロ、ゲンカイタイセイ ガ
	シカレルコトガ オオイデス・・・
	"""
	keyWait
	clearMsg
	"""
	ソレダケ セカイハ コンランシテイル
	トイウコトデスカ・・・
	"""
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	オイオイ、ナンカ、タイヘンなコトに
	なってねえか?
	"""
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	セ、セカイは どうなっちゃうん
	でしょうね?
	"""
	keyWait
	end
}
script 104 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コンゴ、コノヨウナ サイガイジ デモ
	タイオウ デキルヨウニ
	バージョンアップヲ シナケレバ!!
	"""
	keyWait
	end
}
script 105 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ジブン ジシンヲ、ヒテイスル コトニ
	ナルカモ シレマセンガ、
	"""
	keyWait
	clearMsg
	"""
	プログラムニ ヨッテ
	ナンデモ アヤツルコトノ デキル
	セカイ・・・
	"""
	keyWait
	clearMsg
	"""
	アルイミ トテモ キケンナ セカイ
	ナノカモシレマセン
	"""
	keyWait
	end
}
script 106 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシタチハ、アクマデ
	ボウエイ スルタメノ
	ソンザイ デス
	"""
	keyWait
	clearMsg
	"""
	ワタシタチカラ コウゲキヲ
	シカケル ヨウニナレバ、
	"""
	keyWait
	clearMsg
	"""
	オソラク ウイルスト、
	ナンラ カワリナク
	ナッテシマウ デショウ
	"""
	keyWait
	end
}
script 110 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"オレのカギ、ヤクにタったか?"
	keyWait
	end
}
script 111 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	コンカイのサイガイも、ゴスペルが
	ヒきオこしたコトだった らしいね
	"""
	keyWait
	clearMsg
	"""
	ネットワークシャカイのモロさを
	ミたようなきが するよ・・・
	"""
	keyWait
	end
}
script 112 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	な、なんだ・・・ウラのヤツらの
	シワザじゃ なかったのか・・・
	"""
	keyWait
	end
}
script 113 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	セカイジュウの サイガイは
	オサまったんでしょ?
	"""
	keyWait
	clearMsg
	"ヨかった ヨかった!"
	keyWait
	end
}
script 120 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ハロハローー!!"
	keyWait
	clearMsg
	"""
	ドンナトキデモ アカルク アイサツシマス
	ダッテ ソレガ ボクノ ニンム デスカラ
	"""
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	なんか
	ここはいつも ジケンに まきこまれてる
	キが しませんか?
	"""
	keyWait
	end
}
script 122 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ワルイヤツハ イネガー?"
	waitSkip
		frames = 15
	"\nゴスペルモンハ イネガー!?"
	keyWait
	end
}
script 123 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ボスの おじいさんの そのまた
	おじいさんは、セイブの オトコ、
	カウボーイ だったのさ
	"""
	keyWait
	clearMsg
	"""
	だから オレも
	ハヤウちガンマン カスタマイズを
	ウけているんだぜ
	"""
	keyWait
	end
}
script 124 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタクシハ コレマデノ ケイビデ
	スデニ 1286ニンノ ナラズモノヲ
	ツカマエテ イマス
	"""
	keyWait
	end
}
script 125 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	カレ、ウイルスバスティングに イって
	もう ナガい アイダ
	カエって コないの
	"""
	keyWait
	clearMsg
	"""
	とても シンパイだけど
	ボスは ハヤく プラグアウトしろって
	"""
	keyWait
	clearMsg
	"""
	ねぇ・・・
	ナビが コイしちゃ ダメですか?
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 10
		jumpIfStocked = continue
		jumpIfSoldOut = 182
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
			jump = 181,
			jump = continue
		]
	startShop
		shop = 10
}
script 181 mmbn2 {
	clearMsg
	"マタ おコしクダさい"
	keyWait
	end
}
script 182 mmbn2 {
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
script 183 mmbn2 {
	checkShopStock
		shop = 11
		jumpIfStocked = continue
		jumpIfSoldOut = 185
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは サブチップショウニン・・・
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
			jump = 184,
			jump = continue
		]
	startShop
		shop = 11
}
script 184 mmbn2 {
	clearMsg
	"マタ おコしクダさい"
	keyWait
	end
}
script 185 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは サブチップショウニンですが、
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 264
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 263
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 263
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ねえねえ、キミ!
	ハジめまして!
	"""
	keyWait
	clearMsg
	"""
	ショタイメンで、こんなコト イうのも
	アレなんだけど、
	"""
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 84
	" "
	printCode
		buffer = 0
		code = Z
	"""
	」ってチップ
	モってない?
	"""
	keyWait
	clearMsg
	"""
	モってたらさ ボクの
	「
	"""
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = V
	"""
	」と
	コウカンしてホしいんだけど・・・
	"""
	keyWait
	clearMsg
	"コウカン してくれるかな?\n"
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
	"ゴメン"
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
	やっぱ、ムリだよね!
	ショタイメンだし・・・
	あ、キをワルくしないでね
	"""
	keyWait
	clearMsg
	"で、でも またハナしかけてね"
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 84
		code = Z
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 264
	itemTakeChip
		chip = 84
		code = Z
		amount = 1
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"え? ホントに コウカンしてくれるの?"
	keyWait
	clearMsg
	"""
	うわ~ カンゲキだな~!
	それじゃあ、ボクのほうからは、
	コレをキミに!
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
		chip = 119
		code = V
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = V
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	チップ、コウカンしてくれて
	アリガとう・・・
	"""
	keyWait
	clearMsg
	"""
	ツギにあうトキは、
	もうショタイメンじゃないよね
	"""
	keyWait
	clearMsg
	"へへ・・・"
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ねえねえ ボクたち、
	もう、ショタイメンじゃないよね
	"""
	keyWait
	clearMsg
	"""
	だからさ もし、モってたらで
	いいんだけど
	"""
	keyWait
	clearMsg
	"キミの「"
	printChip
		buffer = 0
		chip = 84
	" "
	printCode
		buffer = 0
		code = Z
	"""
	」と、
	ボクの「
	"""
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = V
	"""
	」を
	コウカンしてホしいんだ
	"""
	keyWait
	clearMsg
	"タノむよ な! キョウダイ!\n"
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
	"なれなれしいぞ"
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
	ゴ、ゴメン!
	キをワルく したんだったら
	アヤまるよ!
	"""
	keyWait
	clearMsg
	"""
	だから、また ハナしかけてね
	ゼッタイだよ!!
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"ねえキミ、「"
	printChip
		buffer = 0
		chip = 84
	" "
	printCode
		buffer = 0
		code = Z
	"""
	」が
	ミつからないんだけど、
	"""
	keyWait
	clearMsg
	"""
	もしかして、フォルダのナカに
	イれてない?
	"""
	keyWait
	clearMsg
	"""
	コウカンしたい チップは、
	リュックのナカに イれておかないと
	コウカンできないよ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	jump
		target = 183
}
script 221 mmbn2 {
	jump
		target = 180
}
