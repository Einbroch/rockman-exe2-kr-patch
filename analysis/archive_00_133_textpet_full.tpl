@archive 0771A84
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 57
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 26
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ここは、コトブキエリア です
	ハチのスのような デザインの ミチ・・・
	とっても ハイセンス でしょう?
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 58
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 26
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"やぁ、コンニチハ!!"
	keyWait
	clearMsg
	"""
	この、ワープポイントにハイると
	シアワセのマチ コトブキスクエアの
	イりグチですよ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 59
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 26
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	この、ヤジルシの ツいているミチは、
	ゾクにイう ウゴくホドウです
	"""
	keyWait
	clearMsg
	"ちょっと ノってみてクダさいよ"
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	オラオラオラ!!
	アバれまくって やるぜイェイ!!
	"""
	keyWait
	clearMsg
	"""
	ん? なんだ テメエは!?
	やんのかぁ テメエ!!
	"""
	keyWait
	clearMsg
	"""
	オレサマを、ダレだとオモッてんだ!?
	インターネットゴロツキ2きょうだいの
	チョウナンだぜ!
	"""
	keyWait
	clearMsg
	"""
	オトウトは、ホカのエリアをアラしていて
	イマはいないが、
	"""
	keyWait
	clearMsg
	"""
	キサマくらいなら、
	オレひとりでジュウブンだぜ!
	"""
	keyWait
	clearMsg
	"クラえ! ウイルスの まい!!"
	keyWait
	clearMsg
	flagSet
		flag = 549
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 7
		field = 0
		music = 27
}
script 46 mmbn2 {
	msgOpen
	"""
	たおしたナビの からだから
	なにかが おちた・・・
	"""
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGive
		item = 17
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 17
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オフィシャルのナビさんが、
	オオゼイ ウゴいていますが
	ナニが あったんですかね
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	まさか、この ヘイワな
	コトブキエリアに、オフィシャルが
	やってくるとは・・・
	"""
	keyWait
	clearMsg
	"なんだか、モノモノしいですね"
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オフィシャルが、プラグアウトしろって
	ウルサいんですけど、
	"""
	keyWait
	clearMsg
	"""
	ワタシタチは、シタガうキは、
	ゼンゼンありません
	"""
	keyWait
	clearMsg
	"""
	このエリアは、コジンのジユウを
	ソンチョウしています
	"""
	keyWait
	clearMsg
	"""
	つまり、プラグアウトしないのも
	ワタシタチのジユウなのです
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	このエリアのナビは、
	いくら プラグアウトしろって
	イっても まるっきり キかないんだ
	"""
	keyWait
	clearMsg
	"コマったヤツらだよ"
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	オフィシャルスクエアの ホウで、
	ナニか あったようですね
	"""
	keyWait
	clearMsg
	"""
	まぁ、ワタシタチには
	カンケイない ですけどね
	"""
	keyWait
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ブッソウな ヨのナカに なりましたね
	ホント・・・
	"""
	keyWait
	clearMsg
	"""
	もうスコし、ブラついたら
	プラグアウトしますかね
	"""
	keyWait
	end
}
script 59 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	サッキの ウルサい、オフィシャルが
	スっトんでイきましたよ
	"""
	keyWait
	clearMsg
	"""
	なんでも オフィシャルスクエアに
	ダレかが、シンニュウしたとか
	なんとか イってましたね
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	さっき、チョロっと
	デンサンエリアを ノゾいてキましたが
	シズまりカエっていましたよ
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	なにやら タイヘンなコトが
	オコっているみたいだから
	そろそろ プラグアウトしますかね
	"""
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	デンサンエリアが あのヨウスじゃ
	オフィシャルセンターは
	"""
	keyWait
	clearMsg
	"""
	オオサワギになってるんじゃ
	ないですか?
	"""
	keyWait
	end
}
script 75 mmbn2 {
	checkChapter
		lower = 65
		upper = 72
		jumpIfInRange = 145
		jumpIfOutOfRange = continue
	checkChapter
		lower = 64
		upper = 64
		jumpIfInRange = 140
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	デンサンエリアの ホウも
	ダイブ オちツいた ようですね
	"""
	keyWait
	clearMsg
	"""
	まあ こちらには
	トクには カンケイない ですけどね
	"""
	keyWait
	end
}
script 105 mmbn2 {
	checkItem
		item = 35
		amount = 1
		jumpIfEqual = 107
		jumpIfGreater = 107
		jumpIfLess = continue
	checkItem
		item = 34
		amount = 1
		jumpIfEqual = 107
		jumpIfGreater = 107
		jumpIfLess = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ミチを アルいていたら
	トツゼンさっきの コオリに
	トじコめられて・・・
	"""
	keyWait
	clearMsg
	"""
	あ~コワかった~!
	イッショウ デられないかとオモいました
	"""
	keyWait
	clearMsg
	"アりガトうゴザいました~"
	keyWait
	clearMsg
	"""
	おレイとイってはナンですが、
	コレをあげましょう
	"""
	keyWait
	clearMsg
	"""
	サッキ このチカくでヒロったんです
	キラキラ ヒカっててキレイでしょ
	"""
	keyWait
	clearMsg
	jump
		target = 106
}
script 106 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 34
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 34
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
		target = 109
}
script 107 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	タスけてくれて
	アりガトうゴザいました
	"""
	keyWait
	end
}
script 108 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	インターネットじゅうにヘンな
	コオリがイッパイおちてるし
	"""
	keyWait
	clearMsg
	"ゲンジツセカイはテンペンチイ・・・"
	keyWait
	clearMsg
	"""
	こんなトキにオフィシャルは
	ナニをやってるんだ?
	"""
	keyWait
	end
}
script 109 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、コレなんだろ?
	びじゃくな でんぱを
	だしてるみたいだ・・・
	"""
	keyWait
	clearMsg
	"""
	もしかして、インターネットの
	コオリにかんけいあるのかも・・・
	"""
	keyWait
	clearMsg
	"そうだ、パパにみてもらおうか"
	keyWait
	end
}
script 130 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1809
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 140 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"コトブキスクエア・・・"
	keyWait
	clearMsg
	"イって シラべなきゃな・・・"
	waitSkip
		frames = 20
	"\nでもな・・・"
	waitSkip
		frames = 20
	"\nでも やっぱり イかなきゃな・・・"
	keyWait
	end
}
script 145 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	もう コトブキスクエアの チョウサは
	オわりましたか・・・
	"""
	keyWait
	clearMsg
	"せっかく イこうと オモったのに・・・"
	waitSkip
		frames = 20
	"\nザンネンです・・・"
	waitSkip
		frames = 15
	"エヘ"
	keyWait
	end
}
script 210 mmbn2 {
	checkItem
		item = 35
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
		flag = 591
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
		battle = 19
		field = 65
		music = 27
}
script 211 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンは、ワクチンがないので
	こおりを こわすことができない!
	"""
	keyWait
	end
}
script 212 mmbn2 {
	mugshotHide
	msgOpen
	"ロックマンは、コオリをこわした!"
	keyWait
	clearMsg
	flagSet
		flag = 592
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
		battle = 20
		field = 65
		music = 27
}
script 213 mmbn2 {
	mugshotHide
	msgOpen
	"ロックマンは、コオリをこわした!"
	keyWait
	clearMsg
	flagSet
		flag = 593
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
		battle = 21
		field = 65
		music = 27
}
script 220 mmbn2 {
	msgOpen
	"""
	ヒダリ コトブキスクエア
	ミギ  イキドマリ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	checkItem
		item = 87
		amount = 1
		jumpIfEqual = 222
		jumpIfGreater = 222
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
script 222 mmbn2 {
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
		flag = 210
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
		flag = 1299
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 25
		code = L
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 25
	" "
	printCode
		buffer = 0
		code = L
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
		flag = 1300
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 177
		code = I
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 177
	" "
	printCode
		buffer = 0
		code = I
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
		flag = 1301
	jumpRandom
		untrap = true
		targets = [
			ratio = 16
			jump = 234,
			ratio = 48
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
			chip = 17
			code = Q,
			chip = 17
			code = Q,
			chip = 17
			code = Q,
			chip = 17
			code = Q,
			chip = 7
			code = N,
			chip = 7
			code = N,
			chip = 7
			code = N,
			chip = 7
			code = N,
			chip = 65
			code = P,
			chip = 65
			code = P,
			chip = 65
			code = P,
			chip = 65
			code = P,
			chip = 123
			code = F,
			chip = 123
			code = F,
			chip = 123
			code = F,
			chip = 123
			code = F
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
			amount = 400,
			amount = 400,
			amount = 400,
			amount = 400,
			amount = 400,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 2000,
			amount = 2000
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
	flagSet
		flag = 1302
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
