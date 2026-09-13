@archive 0774D5C
@size 255

script 0 mmbn2 {
	checkShopStock
		shop = 1
		jumpIfStocked = continue
		jumpIfSoldOut = 2
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
			jump = 1,
			jump = continue
		]
	startShop
		shop = 1
}
script 1 mmbn2 {
	clearMsg
	"マタ おコしクダさい"
	keyWait
	end
}
script 2 mmbn2 {
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
script 10 mmbn2 {
	checkChapter
		lower = 40
		upper = 42
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	はあ、
	パスポートを サガしに コられましたか
	"""
	keyWait
	clearMsg
	"""
	アメロッパスクエアに イけば
	ダレか ナニか シってるんじゃ
	ないでしょうか
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	はあ、
	パスポートを ミつかったんですか
	"""
	keyWait
	clearMsg
	"それは ヨかったですね"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ミかけない カオだな
	どうだ? アメロッパは?
	"""
	keyWait
	clearMsg
	"""
	ちょっと ミチが ややこしいけど
	ワルかないだろ?
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシハ ウワサズキノ
	プログラムデス
	"""
	keyWait
	clearMsg
	"""
	アメロッパジョウ ガ、
	ネットマフィア ゴスペルノ
	シュウゲキヲ ウケタラシインデス
	"""
	keyWait
	clearMsg
	"""
	シカシ ニホンカラ キタ
	ショウネント アオイ ナビガ、
	ソノ キキヲ スクッタラシイデス
	"""
	keyWait
	clearMsg
	"ソウイエバ アナタモ アオイデスネ"
	keyWait
	end
}
script 40 mmbn2 {
	checkFlag
		flag = 641
		jumpIfTrue = 45
		jumpIfFalse = continue
	checkFlag
		flag = 642
		jumpIfTrue = 44
		jumpIfFalse = continue
	checkFlag
		flag = 640
		jumpIfTrue = 41
		jumpIfFalse = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	なんだよ、オレのホしいチップが
	ゼンゼンないじゃん!
	"""
	keyWait
	clearMsg
	"プリプリ!"
	keyWait
	end
}
script 41 mmbn2 {
	flagSet
		flag = 642
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ん? ヤミいしゃを ヨびダす
	キーワードをオシえてホしいだ?
	"""
	keyWait
	clearMsg
	"""
	ベツにイイけど、
	タダってワケには イかないよ
	"""
	keyWait
	clearMsg
	"""
	キーワードのジョウホウリョウとして
	バトルチップ「
	"""
	printChip
		buffer = 0
		chip = 66
	" "
	printCode
		buffer = 0
		code = B
	"""
	」を
	オレにクれよ
	"""
	keyWait
	clearMsg
	"そしたら オシえてやってもイイぜ"
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"いいよ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"イヤ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 42,
			jump = continue,
			jump = continue
		]
	"""
	それじゃあ、ジョウホウは
	オシエられないな
	"""
	keyWait
	end
}
script 42 mmbn2 {
	checkPackChipCode
		chip = 66
		code = B
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 43
	flagSet
		flag = 641
	itemTakeChip
		chip = 66
		code = B
		amount = 1
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ものワかりがイイな
	「ウオゴコロあれば ミズゴコロあり」
	だぜ!
	"""
	keyWait
	clearMsg
	"""
	じゃあ、おしえてやるよ
	ヤミいしゃをヨびダす キーワードをよ
	"""
	keyWait
	clearMsg
	"""
	イッカイしかイわねえから
	ココロしてキきな!
	"""
	keyWait
	clearMsg
	"そのキーワードとは・・・!"
	keyWait
	clearMsg
	"そのキーワードとは・・・!!"
	keyWait
	clearMsg
	"そのキーワードとは・・・!!!"
	keyWait
	clearMsg
	"「WWW」だ!!!!"
	keyWait
	clearMsg
	"おどろいたかい?"
	keyWait
	clearMsg
	"""
	あの はんざいしゅうだんのナマエと
	オナじだ どういうカンケイがアるかは
	シらねえ
	"""
	keyWait
	clearMsg
	"""
	オレのジョウホウは、コレだけだ
	おヤクにタてたかい?
	"""
	keyWait
	end
}
script 43 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	なんだよ、ホントはモってナいじゃんかよ!
	ジツは、フォルダのナカにイれてるんじゃ
	ナいだろうな?
	"""
	keyWait
	clearMsg
	"""
	フォルダにハイってる チップは
	アげたり、コウカンしたりデキないからな
	"""
	keyWait
	clearMsg
	"""
	とりあえず フォルダのナカを ミてくれよ
	それでナいバアイは、ジョウホウは
	やれないな
	"""
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	お? トりヒきかい?
	それじゃ、れいの「
	"""
	printChip
		buffer = 0
		chip = 66
	" "
	printCode
		buffer = 0
		code = B
	"""
	」
	クれるのかい?
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
	"いいよ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"イヤ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 42,
			jump = continue,
			jump = continue
		]
	"""
	それじゃあ、ジョウホウは
	オシエられないな
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"オレの「ざゆうのめい」は"
	keyWait
	clearMsg
	"「ギブ アンド テイク」"
	keyWait
	clearMsg
	"コレだ!!"
	keyWait
	clearMsg
	"イきてイくタメには、ヒツヨウなコトだ"
	keyWait
	end
}
script 50 mmbn2 {
	checkChapter
		lower = 60
		upper = 61
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkItem
		item = 38
		amount = 1
		jumpIfEqual = 56
		jumpIfGreater = 56
		jumpIfLess = continue
	checkFlag
		flag = 647
		jumpIfTrue = 54
		jumpIfFalse = continue
	checkFlag
		flag = 645
		jumpIfTrue = 52
		jumpIfFalse = continue
	checkFlag
		flag = 646
		jumpIfTrue = 53
		jumpIfFalse = continue
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	おう ニィちゃん!
	タスかったぜ!
	"""
	keyWait
	clearMsg
	"""
	ヘンなコオリに トじコめられたトキは
	イきたココチが しなかったぜ
	"""
	keyWait
	clearMsg
	"""
	ソレはそうと、アンタ、コオリを
	コワせるみたいだな
	アンタをオトコとミコんで タノみがある!
	"""
	keyWait
	clearMsg
	"""
	ジツは、オレのオトウトなんだが
	ユクエフメイになっちまったんだよ
	"""
	keyWait
	clearMsg
	"""
	サガしてキてくれねえか?
	タダとはイワネエ な?
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
	"いいですよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"イヤです!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 51,
			jump = continue,
			jump = continue
		]
	flagSet
		flag = 646
	"""
	タノむよ! なあ!
	オトウトは、アメロッパでもユウメイな
	カギショクニンなんだ
	"""
	keyWait
	clearMsg
	"""
	アイツがいなくなったら
	ダレがカギをツクるんだよ!?
	"""
	keyWait
	end
}
script 51 mmbn2 {
	flagSet
		flag = 645
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	サガしてキてくれるんだな?
	アリガとう!!
	"""
	keyWait
	clearMsg
	"""
	アイツ、もしかして ウラにいったかも
	シれないんだ!
	"""
	keyWait
	clearMsg
	"""
	アメロッパ イチのカギショクニンの
	オトウトにナニかあったら・・・
	"""
	keyWait
	clearMsg
	"""
	オレもう、シンパイでシンパイで・・・
	たのんだぜ!
	"""
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"オトウトのコト タノんだぜ"
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ん? オトウトをサガしてキてくれるのか?"
	keyWait
	clearMsg
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
	"イヤです!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 51,
			jump = continue,
			jump = continue
		]
	"""
	タノむよ! なあ!
	オトウトは、アメロッパでもユウメイな
	カギショクニンなんだ
	"""
	keyWait
	clearMsg
	"""
	アイツがいなくなったら
	ダレがカギをツクるんだよ!?
	"""
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オトウトは?
	ブジだって? はぁぁぁヨカッた
	"""
	keyWait
	clearMsg
	"""
	そうか、よくサガシてキてクれたな
	コレはほんのキモチだ
	トっといてくれ ヒロいもんだけどな
	"""
	keyWait
	clearMsg
	jump
		target = 55
}
script 55 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 38
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 38
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
script 56 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オレのカンだけどな、ウラインターネット3
	あそこは、アヤシいぜ・・・
	"""
	keyWait
	clearMsg
	"""
	なにせ、ウラコトブキとかいう
	ヘンなエリアとツナがってるって
	ハナシだからな・・・
	"""
	keyWait
	end
}
script 57 mmbn2 {
	checkFlag
		flag = 645
		jumpIfTrue = 58
		jumpIfFalse = continue
	checkFlag
		flag = 646
		jumpIfTrue = 58
		jumpIfFalse = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	この オクにダレか
	トジコめられてましたよ
	"""
	keyWait
	clearMsg
	"""
	けど、ワタシにはナニもデキません
	でも、ミスてるのも ワルいので
	ココでタスけをマってるんです
	"""
	keyWait
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	あのコオリをコワしたんですか?
	スゴいですね
	"""
	keyWait
	end
}
script 59 mmbn2 {
	checkChapter
		lower = 60
		upper = 61
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 31
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシハ ウワサズキノ プログラムデスゥ
	ケイジバンニ コッソリ カキコンダリ
	シテマス
	"""
	keyWait
	clearMsg
	"コレハアクマデ ウワサ ナンデスケド"
	keyWait
	clearMsg
	"""
	ウラインターネット ト
	コトブキエリアガ ジツハ、
	ツナガッテルンジャナイカッテ
	"""
	keyWait
	clearMsg
	"""
	カンケイシャノアイダデ
	マコトシヤカニ イワレテルラシイデスヨ
	"""
	keyWait
	clearMsg
	"""
	デモ、フツウニ
	コトブキエリアニイッテモ
	ウラニハ ヌケラレナイ ソウデスヨ
	"""
	keyWait
	clearMsg
	"""
	ベツノ ミチガ
	ドコカニアルンデスカネ
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"さて、これから どうするかな・・・"
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	サア、アタラシイ ウワサヲ
	サガシマスカ・・・
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	アメロッパは ワレワレが マモりヌきます
	ここは マカせて クダさい!
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 9
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = NumberMan
	msgOpen
	"""
	ワタシは ギョウショウチュウの
	ナンバーマンです
	"""
	keyWait
	clearMsg
	"イいモノ ありますよ?\n"
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
		shop = 9
}
script 181 mmbn2 {
	clearMsg
	"マタ キてクダさいね"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = NumberMan
	msgOpen
	"ザンネンですが、シナギレチュウです"
	keyWait
	end
}
script 210 mmbn2 {
	checkItem
		item = 37
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 211
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 37
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 606
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 34
		field = 65
		music = 27
}
script 211 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 212 mmbn2 {
	checkItem
		item = 37
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 213
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 37
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 607
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 35
		field = 65
		music = 27
}
script 213 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 214 mmbn2 {
	checkItem
		item = 35
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 215
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 35
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 608
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 36
		field = 65
		music = 27
}
script 215 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkItem
		item = 84
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
		jumpIfLess = continue
	msgOpen
	"""
	ラウルのかんりする
	セキュリティキューブだ
	"""
	keyWait
	clearMsg
	"""
	パスコードがないので
	キューブを かいじょ
	することができない
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
		item = 84
	"""
	」
	を つかった!!
	"""
	keyWait
	clearMsg
	"""
	セキュリティキューブが
	かいじょされた!!
	"""
	keyWait
	flagSet
		flag = 72
	wait
		frames = 102
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	さかみち のぼると
	アメロッパスクエアほうめん
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	このおく ネットショウニン おいでませ
	ひだり  アメロッパスクエア
	"""
	keyWait
	end
}
script 224 mmbn2 {
	checkItem
		item = 87
		amount = 1
		jumpIfEqual = 225
		jumpIfGreater = 225
		jumpIfLess = continue
	msgOpen
	"なぞの セキュリティキューブだ"
	keyWait
	clearMsg
	"""
	パスコードがないので
	キューブを かいじょ
	することができない
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 87
	"""
	」
	を つかった!!
	"""
	keyWait
	clearMsg
	"""
	セキュリティキューブが
	かいじょされた!!
	"""
	keyWait
	msgClose
	flagSet
		flag = 212
	wait
		frames = 102
	end
}
script 230 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1433
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 30000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「30000ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 231 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1434
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 69
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 69
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 232 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	checkFlag
		flag = 2144
		jumpIfTrue = continue
		jumpIfFalse = 233
	"サブチップ「"
	printItem
		buffer = 0
		item = 115
	"""
	」
	が こうりょくを はっきした!!
	"""
	keyWait
	clearMsg
	"""
	ミステリーデータに ひそむ
	ウイルスデータが デリートされた!
	"""
	keyWait
	jump
		target = 233
}
script 233 mmbn2 {
	flagSet
		flag = 1435
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 234,
			ratio = 32
			jump = 235,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 236
		]
	flagClear
		flag = 2144
}
script 234 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	clearMsg
	startRandomBattle
	end
}
script 235 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 118
			code = N,
			chip = 118
			code = N,
			chip = 118
			code = N,
			chip = 118
			code = N,
			chip = 114
			code = *,
			chip = 114
			code = *,
			chip = 114
			code = *,
			chip = 114
			code = *,
			chip = 125
			code = D,
			chip = 125
			code = D,
			chip = 125
			code = D,
			chip = 125
			code = D,
			chip = 13
			code = C,
			chip = 13
			code = C,
			chip = 13
			code = C,
			chip = 13
			code = C
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 236 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 200,
			amount = 200,
			amount = 200,
			amount = 200,
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 10000,
			amount = 10000,
			amount = 10000,
			amount = 10000
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 237 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	checkFlag
		flag = 2144
		jumpIfTrue = continue
		jumpIfFalse = 238
	"サブチップ「"
	printItem
		buffer = 0
		item = 115
	"""
	」
	が こうりょくを はっきした!!
	"""
	keyWait
	clearMsg
	"""
	ミステリーデータに ひそむ
	ウイルスデータが デリートされた!
	"""
	keyWait
	jump
		target = 238
}
script 238 mmbn2 {
	flagSet
		flag = 1436
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 239,
			ratio = 32
			jump = 240,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 241
		]
	flagClear
		flag = 2144
}
script 239 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	clearMsg
	startRandomBattle
	end
}
script 240 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 118
			code = N,
			chip = 118
			code = N,
			chip = 118
			code = N,
			chip = 118
			code = N,
			chip = 114
			code = *,
			chip = 114
			code = *,
			chip = 114
			code = *,
			chip = 114
			code = *,
			chip = 125
			code = D,
			chip = 125
			code = D,
			chip = 125
			code = D,
			chip = 125
			code = D,
			chip = 13
			code = C,
			chip = 13
			code = C,
			chip = 13
			code = C,
			chip = 13
			code = C
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 241 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 100,
			amount = 200,
			amount = 200,
			amount = 200,
			amount = 200,
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 10000,
			amount = 10000,
			amount = 10000,
			amount = 10000
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
