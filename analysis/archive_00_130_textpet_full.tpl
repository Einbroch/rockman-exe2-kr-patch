@archive 076F674
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 4
		upper = 255
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	checkChapter
		lower = 3
		upper = 3
		jumpIfInRange = 5
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココハ オフィシャルスクエアノ
	イリグチ デス
	"""
	keyWait
	clearMsg
	"""
	イロンナ トコロカラ
	ミンナ ココニ アツマッテキマス
	"""
	keyWait
	clearMsg
	"サア! ウエノホウヘ ドウゾ!"
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 4
		upper = 255
		jumpIfInRange = 11
		jumpIfOutOfRange = continue
	checkChapter
		lower = 3
		upper = 3
		jumpIfInRange = 6
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	あー タノしかった!
	やはり オフィシャルスクエアは
	ヨいですネー
	"""
	keyWait
	clearMsg
	"""
	みんなと ハナシはデキるし
	カいモノだって デキますもんネー!
	ほんと モりダクサンですヨ!
	"""
	keyWait
	clearMsg
	"""
	おまけに キョウは
	「しみんネットバトラー」の
	シケンなんかも やってましたヨ!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ここは、ダレかが ツクった
	「ショートカット」の デグチですね
	"""
	keyWait
	clearMsg
	"""
	「ゲートキー」を モっていたら
	どこからか ここに ひとっトび!
	"""
	waitSkip
		frames = 30
	"\n・・・いいなあ"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	このワープから サキに ススんでイくと
	「コトブキエリア」に イけますが
	イマは メンテナンスチュウで イけません
	"""
	keyWait
	clearMsg
	"""
	ちなみに このあたりは
	「デンサンエリア」と イいます
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"もう ゴゾンジかも しれませんが・・・"
	keyWait
	clearMsg
	"""
	チップフォルダに イれられる
	バトルチップは ゼンブで 30マイです
	"""
	keyWait
	clearMsg
	"""
	カスタムガメンで
	サイショに エラべる 5マイは
	そのナカから ランダムで きまります
	"""
	keyWait
	clearMsg
	"""
	ヒンパンに ツカいたい チップを
	タクサン イれておけば、
	それだけ ハジメに デやすくなるでしょう
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココハ オフィシャルスクエアノ
	イリグチ デス
	"""
	keyWait
	clearMsg
	"""
	イロンナ トコロカラ
	ミンナ ココニ アツマッテキマス
	"""
	keyWait
	clearMsg
	"サア! ウエノホウヘ!"
	waitSkip
		frames = 30
	"\n・・・モウ イッタ ミタイデスネ"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
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
	」
	ですかー?
	"""
	keyWait
	clearMsg
	"うーん、ここには ナいと オモいますヨ"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	オフィシャルスクエア ドウデシタカ?
	ネットノ セカイモ
	ドンドン ベンリニ ナッテイキマスネ
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	printItem
		buffer = 0
		item = 58
	" ゲットしたんですか!?"
	keyWait
	clearMsg
	"""
	ひょっとして あなたの オペレータは
	ネットバトルで ユウメイな ヒトですか?
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	メンテナンスが オわったから
	ミギシタの セツゾクポイントの サキに
	イけるように なってますよ!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	「デンサンエリア」ッテ イウノハ
	デンサンシティノ
	デンノウセカイノ コトヲ イイマス
	"""
	keyWait
	clearMsg
	"""
	サブガメンヲ ヒライタラ
	ミギシタニ イマイル バショガ デルカラ
	ソレデ タシカメルト イイデス
	"""
	keyWait
	clearMsg
	"""
	アト 「オフィシャルスクエア」モ
	デンサンシティノ デンノウセカイ ダカラ
	デンサンエリアニ フクマレルンダケド、
	"""
	keyWait
	clearMsg
	"""
	「オフィシャルノ スクエア」ト イウノガ
	ワカリヤスイ ヨウニ
	「オフィシャルスクエア」ト ヨンデイマス
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ムカシ ナビが デキたコロはさ
	ナビは ハナシが デキなくて
	ただ メイレイをキくだけ だったんだって
	"""
	keyWait
	clearMsg
	"""
	そんなの
	ボクだったら サビしくて やだな
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ワタシみたいな キュウガタの ナビが
	サイシンの ウイルスと タタかうのは
	ショウジキ きついです
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	あっちのヒトも イってますが
	タシかに ワタシらは
	イマでは キュウガタです
	"""
	keyWait
	clearMsg
	"""
	しかし シンハツバイ トウジは
	ズイブン ワダイに なったもんですよ
	"""
	keyWait
	clearMsg
	"「1ターンに サイコウ 2マイ\n バトルチップを ツカえる! 」"
	keyWait
	clearMsg
	"ってね"
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	このブンじゃ、スクエアも
	カンサンと してるんでしょうネ
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 3210
		jumpIfTrue = 195
		jumpIfFalse = continue
	checkFlag
		flag = 155
		jumpIfTrue = 196
		jumpIfFalse = continue
	checkFlag
		flag = 156
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 154
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 154
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	コンニチハ ワタシが ケイジバンに
	イライを カきこんだモノです
	"""
	keyWait
	clearMsg
	"""
	ジツは、コンド ワタシのライバルと
	ネットバトルで ショウブするコトに
	なったのです
	"""
	keyWait
	clearMsg
	"""
	ワタシのイライは、そのネットバトルで
	ワタシが カてるように
	テツダってほしいのです
	"""
	keyWait
	clearMsg
	"""
	サッソクシゴトに ウツってホしいのですが
	アナタに アイテのテイサツを
	オネガい したいのです
	"""
	keyWait
	clearMsg
	"""
	アイテのジャクテンが ワカれば、
	ヒジョウに タタかいヤスいですから
	"""
	keyWait
	clearMsg
	"""
	ドコかの デンノウセカイで
	トレーニングしているハズです
	タブン、インターネットのナカにはいません
	"""
	keyWait
	clearMsg
	"""
	ココロが シズかになるトコロを
	ミツけたから、そこでトレーニングする
	と イっていたらしいです
	"""
	keyWait
	clearMsg
	"""
	ヤツのハードトレーニングは
	ユウメイですから、ミたらスグワカると
	オモいますよ
	"""
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"イライの カクニンですね"
	keyWait
	clearMsg
	"""
	コンド、ワタシのライバルと
	ネットバトルでショウブするコトに
	なったのです
	"""
	keyWait
	clearMsg
	"""
	ワタシのイライは、そのネットバトルで
	ワタシが カてるように
	テツダってほしいのです
	"""
	keyWait
	clearMsg
	"""
	アナタには アイテのテイサツを
	オネガい したいのです
	"""
	keyWait
	clearMsg
	"""
	アイテのジャクテンが ワカれば、
	ヒジョウに タタかいヤスいですから
	"""
	keyWait
	clearMsg
	"""
	ヤツは、ドコかの デンノウセカイで
	トレーニングしているハズです
	タブン、インターネットのナカにはいません
	"""
	keyWait
	clearMsg
	"""
	ヤツが コモッているバショが
	ワカらない?
	"""
	keyWait
	clearMsg
	"""
	ココロが、オチつくトコロというのが
	ナニか ヒントにならないでしょうか?
	"""
	keyWait
	end
}
script 192 mmbn2 {
	flagSet
		flag = 155
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"ヤツのジャクテンがワかりましたか?"
	keyWait
	clearMsg
	"ジャクテンは トクにナい?"
	keyWait
	clearMsg
	"""
	サクセンは、ウゴきマワって
	ワタシを ホンロウする
	スピードジュウシの タタかいカタ・・・
	"""
	keyWait
	clearMsg
	"""
	なら、メイチュウリツのタカい
	バトルチップで カクジツに
	ダメージを アタえたいですね・・・
	"""
	keyWait
	clearMsg
	"というコトで、「"
	printChip
		buffer = 0
		chip = 71
	" "
	printCode
		buffer = 0
		code = G
	"""
	」を
	くれませんか?
	"""
	keyWait
	clearMsg
	"どうですか?\n"
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
			jump = 193,
			jump = continue,
			jump = continue
		]
	"これは、いらいですよ!"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 71
	" "
	printCode
		buffer = 0
		code = G
	"""
	」があれば、
	ワタシはアイツに カてるんですよ!!
	"""
	keyWait
	clearMsg
	"おねがいします~"
	keyWait
	end
}
script 193 mmbn2 {
	checkPackChipCode
		chip = 71
		code = G
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 197
	flagSet
		flag = 3210
	flagClear
		flag = 82
	itemTakeChip
		chip = 71
		code = G
		amount = 1
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"おお! 「"
	printChip
		buffer = 0
		chip = 71
	" "
	printCode
		buffer = 0
		code = G
	"""
	」を
	イタダけるんですね?
	いやっほう!!
	"""
	keyWait
	clearMsg
	"""
	コレでヤツにカつコトができます!!
	アリガトうゴザいます!!
	"""
	keyWait
	clearMsg
	"""
	ココまで してもらえれば
	もうジュウブンです!!
	"""
	keyWait
	clearMsg
	"""
	それでは、これは おレイです
	ウけトってクダさい
	"""
	keyWait
	clearMsg
	jump
		target = 194
}
script 194 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 99
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 99
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
	2メガ ふえた!!
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"ようし、トレーニングをガンバるぞ"
	keyWait
	end
}
script 196 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"おや、もしかして「"
	printChip
		buffer = 0
		chip = 71
	" "
	printCode
		buffer = 0
		code = G
	"""
	」を
	モってキてクダさったんですか?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"そだよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちがうよ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 193,
			jump = continue,
			jump = continue
		]
	"""
	そ、そんな・・・
	ム、ムセキニンですよ!!
	チカラになってクダさいよう~
	"""
	keyWait
	end
}
script 197 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"オヤ 「"
	printChip
		buffer = 0
		chip = 71
	" "
	printCode
		buffer = 0
		code = G
	"""
	」が
	ミアタりませんが もしや、フォルダの
	ナカに はいっていませんか?
	"""
	keyWait
	clearMsg
	"""
	イタダケるチップは、フォルダから
	ハズしておいてクダさいね
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"キューブ1"
	keyWait
	msgClose
	end
}
script 223 mmbn2 {
	msgOpen
	"キューブ2"
	keyWait
	msgClose
	end
}
script 225 mmbn2 {
	msgOpen
	"キューブ3"
	keyWait
	msgClose
	end
}
