@archive 076D4B0
@size 255

script 0 mmbn2 {
	checkShopStock
		shop = 0
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
		shop = 0
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
script 4 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 145
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	インターネットノ セカイニ ヨウコソ!
	インターネットハ ココカラ セカイニ
	ツナガッテ イマス!
	"""
	keyWait
	clearMsg
	"ビバ インターネット!! "
	waitSkip
		frames = 30
	"ナノデス!"
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 44
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 38
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 19
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 18
		jumpIfInRange = 27
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ネットハンザイが マタ フえてきたので
	インターネットの ナカで ジユウに
	イけないトコロが あります
	"""
	keyWait
	clearMsg
	"""
	タトえば コジンの タンマツには
	そのモチヌシに パスコードを
	もらわないと イくコトが デキません
	"""
	keyWait
	clearMsg
	"""
	このサキ みたいに
	ダレかが イけなくしている トコロも
	あります
	"""
	keyWait
	end
}
script 6 mmbn2 {
	checkChapter
		lower = 3
		upper = 255
		jumpIfInRange = 11
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	メールを トドけにイく トチュウ
	なんですが、こんなカンバン ミたら
	カいモノ してイきたく なりますヨネ?
	"""
	keyWait
	end
}
script 10 mmbn2 {
	msgOpen
	"""
	ロックマンは、おちている データを
	手にとって しらべてみた
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	"""
	どうやら
	「
	"""
	printItem
		buffer = 0
		item = 2
	"」の ようだ!"
	keyWait
	clearMsg
	flagSet
		flag = 1281
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 2
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 2
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 14
}
script 11 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ウエのミセで カいモノ してキましたヨ!
	あなた イきましたか?
	"""
	keyWait
	end
}
script 12 mmbn2 {
	checkItem
		item = 2
		amount = 1
		jumpIfEqual = 13
		jumpIfGreater = 13
		jumpIfLess = continue
	mugshotShow
		mugshot = Roll
	msgOpen
	"""
	このエリアに
	「
	"""
	printItem
		buffer = 0
		item = 2
	"""
	」が あるって
	きいたんだけど・・・
	"""
	keyWait
	clearMsg
	"みちに まよっちゃったの・・・"
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"""
	あ ロック
	「
	"""
	printItem
		buffer = 0
		item = 2
	"""
	」とったんだー
	いいなぁー
	"""
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やったな!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	さっき このエリアで
	ツヨそうなナビが ホカのナビを
	デリートしてるのを ミちゃいました・・・
	"""
	keyWait
	clearMsg
	"""
	オペレータも いないみたいで
	デくわしたら すぐバトルに
	なっちゃった ようなのです・・・
	"""
	keyWait
	clearMsg
	"""
	あなたも
	チュウイしたホウが いいですよ
	"""
	keyWait
	end
}
script 20 mmbn2 {
	checkFlag
		flag = 604
		jumpIfTrue = 22
		jumpIfFalse = continue
	checkChapter
		lower = 9
		upper = 9
		jumpIfInRange = 21
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ライセンスシケンを
	ウけに イくんですか?
	"""
	keyWait
	clearMsg
	"""
	それなら オフィシャルセンターから
	チョクセツ プラグインしないと
	ダメだと オモったけど・・・
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ライセンスの シケンチュウ なんですね"
	keyWait
	clearMsg
	"""
	このあたりでは
	おさがしの ナビは ミてないですね
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ここの コウジも
	そろそろ オわるらしいですよ
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"このチカくにある ワープゲートは"
	keyWait
	clearMsg
	"""
	オフィシャル、コトブキ、アジーナ、
	アメロッパのデンノウスクエアに
	チョクセツ ツナがっています
	"""
	keyWait
	clearMsg
	"""
	しかし、これらのワープゲートには
	アクヨウされないタメに
	カギがカカっています
	"""
	keyWait
	clearMsg
	"""
	ワープゲートを ツカうタメには、
	「ゲートキー」というカギがヒツヨウです
	"""
	keyWait
	clearMsg
	"""
	ナンでも、アメロッパの
	カギ ショクニンさんがコウジしたとかで
	かなり、ガンジョウなカギらしいですよ
	"""
	keyWait
	end
}
script 26 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 43
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 37
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 19
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	さーて、カいモノも したし、
	オフィシャルスクエア にでも
	アソびに イくかな
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	やあ、コンニチハ
	インターネットは、タノしいね!
	"""
	keyWait
	clearMsg
	"""
	アジーナスクエアに イくのかい?
	あそこに、イくんだったら、
	"""
	keyWait
	clearMsg
	"""
	デンサンエリア3 の ツきアたりを
	ヒダリにイけば、いいんだよ
	"""
	keyWait
	end
}
script 28 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 57
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 54
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 22
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 39
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 19
		jumpIfInRange = 34
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	デンサンエリアハ トテモ ヘイワナ
	エリアデス
	"""
	keyWait
	clearMsg
	"""
	コレモ ヒトエニ、
	オフィシャルネットバトラー ノ
	カツヤクノ タマモノ デス
	"""
	keyWait
	clearMsg
	"ビバ オフィシャル!! ナノデス"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ナニか、アタラしい ジョウホウが
	ハイってないか、ケイジバンでも、
	チェックするか~
	"""
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	へぇ~、ライセンスシケンを
	ウけてるんだぁ?
	"""
	keyWait
	clearMsg
	"""
	とイうコトは、あなたは
	シミンネットバトラーさん なんだ
	いやあ、いつも ゴクロウサマ!
	"""
	keyWait
	clearMsg
	"シケン ガンバってね!"
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	キョウモ デンサンエリア ハ
	ヘイワデス~
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"えっ! "
	printItem
		buffer = 0
		item = 60
	"\nトったんだ! すげえな!"
	keyWait
	clearMsg
	"""
	オレも、ライセンス シケンを
	ウけようかな~
	"""
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	シケン ウかったの!?
	それは おめでとう!!
	"""
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	printItem
		buffer = 0
		item = 60
	"""
	ヲ、
	トッタノデスネ?
	"""
	keyWait
	clearMsg
	"スゴイデスネ!!"
	keyWait
	clearMsg
	"""
	ヨッ ミライノ
	オフィシャルネットバトラー!!
	"""
	keyWait
	end
}
script 43 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	シケン、ウけに イったけど、
	ケイケンが、タりない って
	イわれちゃったよ
	"""
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"アジーナは、どうでした?"
	keyWait
	clearMsg
	"""
	ナビが タクサン アツまっていて
	とても、ニギやかな トコロだったでしょ?
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ミマワリ ミマワリ!"
	keyWait
	clearMsg
	"""
	タダイマ、ボウハン ウンドウ
	キョウカ ゲッカン ナノデス!
	"""
	keyWait
	clearMsg
	"ミンナデ マモロウ デンサンエリア!"
	keyWait
	clearMsg
	"""
	ハンザイヲ、
	シナイ! サセナイ! ミノガサナイ!
	"""
	keyWait
	end
}
script 49 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ミンカンの ナビだね
	ワタシは、オフィシャルのナビだ
	"""
	keyWait
	clearMsg
	"ハヤく、プラグアウトしたまえ"
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"フシンシャは いないようだな"
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"イマのトコロ・・・イジョウナシ・・・"
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	オフィシャル サンガ、
	インターネットヲ チョウサ シテイル
	トイウコトハ・・・
	"""
	keyWait
	clearMsg
	"""
	ナニカ ジケンガ
	オコッタトイウ コト デスネ・・・
	"""
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	オフィシャルスクエア デ
	ジケンガ オコッタ ミタイデス!
	"""
	keyWait
	clearMsg
	"""
	オフィシャルサンハ ミンナ
	イッテ シマイマシタ!
	"""
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	オフィシャルサンタチ・・・
	カエッテ キマセンネ・・・
	"""
	keyWait
	clearMsg
	"ダイジョウブカナ?"
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"ヘイワを トりモドした とはいえ、"
	keyWait
	clearMsg
	"デアルくのは スコし コワいです・・・"
	keyWait
	end
}
script 95 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 110
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	このコオリは、イッタイ
	ナニなんでしょう?
	"""
	keyWait
	clearMsg
	"""
	とてもカラダにワルそうな
	デンパをハっしているようです
	"""
	keyWait
	clearMsg
	"""
	ハヤくトりノゾかないと
	ヤバそうなキがします・・・
	"""
	keyWait
	clearMsg
	"""
	タカい カガクリョクをモッたヒトなら
	このコオリをコワす ホウホウが
	ワカるかもシれないですね
	"""
	keyWait
	clearMsg
	"ワタシには ムリですけどね"
	keyWait
	end
}
script 96 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 121
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 111
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コノアタリノ インターネットエリアヲ
	ミテキマシタケド
	"""
	keyWait
	clearMsg
	"""
	アチコチデ、コオリニトジコメラレタ
	ヒトガイマシタヨ
	"""
	keyWait
	end
}
script 97 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 122
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 112
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	シロイ コオリハ、
	イロノツイタ コオリヨリ
	モロイミタイデ、
	"""
	keyWait
	clearMsg
	"タタイタラ コワセソウデス~"
	keyWait
	clearMsg
	"""
	デモ、ワタシニハ、ソンナチカラハ
	アリマセン~シクシク
	"""
	keyWait
	end
}
script 110 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	いったい、ナニがゲンインで
	コオリが ハッセイしたのか・・・
	"""
	keyWait
	end
}
script 111 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ワタシモ コオリニ
	トジコメラレタラ ドウシマショウ
	"""
	keyWait
	end
}
script 112 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コオリノ タイリョウ ハッセイ トイイ
	ゲンジツセカイノ テンペンチイ トイイ
	イッタイ ナニガ ドウナッテルンデショ?
	"""
	keyWait
	end
}
script 120 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	コオリが トツゼン コナゴナに
	クダけチりました
	"""
	keyWait
	clearMsg
	"""
	マッタく ヨく ワからない
	コオリでした・・・
	"""
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コオリガ ナクナッテ、
	ゲンジツセカイ ニモ
	ヘイワガ オトズレタヨウデス
	"""
	keyWait
	end
}
script 122 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ハァ~、ナニハトモアレ
	コオリハ ナクナッタ ヨウデスネ・・・
	"""
	keyWait
	end
}
script 145 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"アナタ イノチガ オシクナインデスカ?"
	keyWait
	clearMsg
	"""
	ゴスペルノ ウイルスガ
	ウヨウヨ シテルッテトキニ
	インターネットニ ヤッテクル ナンテ
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
	mugshotHide
	msgOpen
	"ロックマンは、コオリをこわした!"
	keyWait
	clearMsg
	flagSet
		flag = 581
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
		battle = 9
		field = 65
		music = 27
}
script 211 mmbn2 {
	mugshotHide
	msgOpen
	"ロックマンは、コオリをこわした!"
	keyWait
	clearMsg
	flagSet
		flag = 582
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
		battle = 10
		field = 65
		music = 27
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
		flag = 583
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
		battle = 11
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
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
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
		item = 80
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
		jumpIfLess = continue
	msgOpen
	"""
	メイルの かんりする
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
		item = 80
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
		flag = 24
	wait
		frames = 102
	end
}
script 222 mmbn2 {
	checkItem
		item = 87
		amount = 1
		jumpIfEqual = 223
		jumpIfGreater = 223
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
script 223 mmbn2 {
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
		flag = 25
	wait
		frames = 102
	end
}
script 224 mmbn2 {
	checkItem
		item = 82
		amount = 1
		jumpIfEqual = 225
		jumpIfGreater = 225
		jumpIfLess = continue
	msgOpen
	"""
	やいとの かんりする
	セキュリティキューブだ
	"""
	keyWait
	clearMsg
	"""
	パスコードが ないので
	キューブを かいじょ することが
	できない・・・
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	やいとの かんりする
	セキュリティキューブだ
	"""
	keyWait
	clearMsg
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 82
	"""
	」
	を つかった!!
	"""
	keyWait
	clearMsg
	"""
	セキュリティキューブが
	かいじょ された!!
	"""
	keyWait
	msgClose
	flagSet
		flag = 26
	wait
		frames = 102
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	ネットショウニン
	ヒダリにまがって ワープゾーン
	はいって スグにいます
	"""
	keyWait
	clearMsg
	"""
	オフィシャルスクエア
	ミギにまがって
	ふといみち みちなりに
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	こうじちゅう!
	たちいりきんし!!
	"""
	keyWait
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
		flag = 1284
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 113
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 113
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
script 231 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 240
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
	keyWait
	msgClose
	flagSet
		flag = 1285
	end
}
script 232 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 240
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
	playerAnimate
		animation = 24
	itemGive
		item = 57
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 57
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1286
	end
}
script 233 mmbn2 {
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
		flag = 1287
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
script 240 mmbn2 {
	msgOpen
	"""
	このミステリーデータには、
	セキュリティがかかっていて
	かいせきすることができない
	"""
	keyWait
	clearMsg
	"""
	かいせきするには、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 117
	"""
	」
	が、ひつようだ
	"""
	keyWait
	end
}
