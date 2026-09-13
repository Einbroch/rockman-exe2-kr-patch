@archive 0773C04
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	このワープポイントに はいると
	アジーナスクエアの いりぐちだよ
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"""
	ハイ ロック!
	こんなトコで あうなんて きぐうね!
	"""
	keyWait
	clearMsg
	"""
	アジーナエリアって しずかで
	いいトコロね・・・
	ワタシ 気にいっちゃった!
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ファ~ ツカレマシタァ"
	keyWait
	clearMsg
	"""
	オクデンダニ カラ コンナトコロマデ
	オツカイニ コサセラレルナンテ
	オモッテモ ミマセンデシタ
	"""
	keyWait
	end
}
script 80 mmbn2 {
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkFlag
		flag = 636
		jumpIfTrue = 81
		jumpIfFalse = continue
	flagSet
		flag = 636
	mugshotShow
		mugshot = Roll
	msgOpen
	"""
	あ~! ロック~!!
	たすけにきてくれたの?
	"""
	keyWait
	clearMsg
	"ありがとう! ロック、熱斗くん!"
	keyWait
	clearMsg
	"""
	これで、メイルちゃんに
	れんらくできそうね
	"""
	keyWait
	clearMsg
	"""
	メイルちゃんに れんらくしなきゃ
	きっと、シンパイしてるだろうから
	"""
	keyWait
	clearMsg
	"""
	メイルちゃん! ロックと熱斗くんが
	たすけに きてくれたから
	ワタシは だいじょうぶだよ
	"""
	keyWait
	clearMsg
	"""
	しんぱい かけてゴメン・・・
	うん、もうちょっとしたら かえるね
	"""
	keyWait
	clearMsg
	"これで よしっと"
	keyWait
	clearMsg
	"ロック、熱斗くん"
	keyWait
	clearMsg
	"""
	インターネットの ふんいきが
	いつもとちがうから、ロックも
	気をつけてね
	"""
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"""
	インターネットにナニが
	おこってるのかしら
	"""
	keyWait
	end
}
script 82 mmbn2 {
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	checkFlag
		flag = 637
		jumpIfTrue = 83
		jumpIfFalse = continue
	flagSet
		flag = 637
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ア、ワタシ タスカッタノデスネ?"
	keyWait
	clearMsg
	"""
	シゴトヲ サボッテコンナトコロデ
	アブラヲ ウッテイタノガ
	イケナカッタンデスネ
	"""
	keyWait
	clearMsg
	"""
	タスケテクダサッテ
	ドウモ アリガトウゴザイマシタ
	"""
	keyWait
	clearMsg
	"""
	ワタシ、アル トコロデ
	ヒヲ オコスシゴトヲ ヤッテイルンデスガ
	"""
	keyWait
	clearMsg
	"""
	シゴトバデ ツカッテイル
	「
	"""
	printItem
		buffer = 0
		item = 36
	"""
	」ガ
	チョウシヨスギテ
	"""
	keyWait
	clearMsg
	"""
	シゴトバガ アツインデスヨ
	タマニハ コウヤッテ
	アタマヲヒヤサナイト
	"""
	keyWait
	clearMsg
	"シゴトニナリマセンヨネ"
	keyWait
	clearMsg
	"""
	ドウリョウガ シンパイ
	シテイルカモシレマセン
	アトデ レンラク シテオカナイト
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	タスカリマシタガ モウスコシ
	ココデ スズンデ イキマス
	"""
	keyWait
	clearMsg
	"""
	ナニセ シゴトバハ モエルヨウニ
	アツイ トコロナノデ・・・
	"""
	keyWait
	clearMsg
	"""
	モウ チョットクライ サボッテモ
	バチハ アタラナイデスヨネ
	"""
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"おう、おう アンタしってるかい?"
	keyWait
	clearMsg
	"""
	どうやら、あのコオリのせいで
	セカイがオカしくなっちまってるって
	ウワサだぜ!
	"""
	keyWait
	clearMsg
	"""
	ケイジバンにカいてあったんだ
	オフィシャルスクエアのケイジバンは
	ジョウホウ サイゼンセンだからな
	"""
	keyWait
	clearMsg
	"""
	サイシンの ユウリョク ジョウホウが
	アツまってくるんだぜ
	"""
	keyWait
	clearMsg
	"コオリのコト ミンナに オシえなきゃな!"
	keyWait
	end
}
script 85 mmbn2 {
	checkItem
		item = 35
		amount = 1
		jumpIfEqual = 86
		jumpIfGreater = 86
		jumpIfLess = continue
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	インターネットじゅう、
	コオリだらけだ
	"""
	keyWait
	clearMsg
	"""
	なんとか、コオリを コワせないか、
	アチコチ チョウサしているんだが、
	なかなか テガかりが ツカめないんだ
	"""
	keyWait
	clearMsg
	"""
	あと、シラべていないのは、
	コトブキエリアだけだが・・・
	"""
	keyWait
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"どうしたら、コオリが コワせるのか・・・"
	keyWait
	end
}
script 110 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	いつのヒか カナラず、アジーナエリアを
	フッコウして ミせます!
	"""
	keyWait
	clearMsg
	"""
	そのヒが オトズれる タメにも
	まずは アナタが ゴスペルを!
	"""
	keyWait
	end
}
script 190 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	おい、ボウズ! いのちが、おしけりゃ
	モってる ゼニーと、チップを
	ゼンブよこしな!
	"""
	keyWait
	clearMsg
	jump
		target = 191
}
script 191 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	おまえは、「ブラック・ナビズ」の
	ひとりだな!?
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	その トオりだ!
	オレは、「ブラック・ナビズ」の
	ナンバー4!
	"""
	keyWait
	clearMsg
	"""
	オレたちを、シっている トコロをミると
	おマエ、オフィシャルか?
	"""
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ほかのメンバーは、ドコにいるんだ?"
	keyWait
	clearMsg
	jump
		target = 194
}
script 194 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"オシえてやろう"
	keyWait
	clearMsg
	"""
	アメロッパエリアの おくに
	ナンバー3がいるぜ
	"""
	keyWait
	clearMsg
	"""
	だが、おマエは ナンバー3に
	あうコトはナい・・・
	"""
	keyWait
	clearMsg
	"""
	ナゼなら おマエはココで、
	オレに デリートされるんだからな!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 295
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 57
		field = 65
		music = 27
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
		flag = 600
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
		battle = 28
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
		item = 35
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
		flag = 601
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
		battle = 29
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
script 220 mmbn2 {
	checkItem
		item = 87
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
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
script 221 mmbn2 {
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
		flag = 31
	wait
		frames = 102
	end
}
script 230 mmbn2 {
	checkFlag
		flag = 2143
		jumpIfTrue = continue
		jumpIfFalse = 242
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
	itemGiveChip
		chip = 103
		code = B
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 103
	" "
	printCode
		buffer = 0
		code = B
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1314
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
		flag = 1315
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 193
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 193
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
		flag = 1316
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
			chip = 18
			code = T,
			chip = 18
			code = T,
			chip = 18
			code = T,
			chip = 18
			code = T,
			chip = 40
			code = I,
			chip = 40
			code = I,
			chip = 40
			code = I,
			chip = 40
			code = I,
			chip = 2
			code = E,
			chip = 2
			code = E,
			chip = 3
			code = E,
			chip = 2
			code = E,
			chip = 124
			code = I,
			chip = 124
			code = I,
			chip = 124
			code = I,
			chip = 124
			code = I
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
			amount = 600,
			amount = 600,
			amount = 600,
			amount = 600,
			amount = 600,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 3000,
			amount = 3000,
			amount = 3000
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
		flag = 1317
	jumpRandom
		untrap = true
		targets = [
			ratio = 16
			jump = 239,
			ratio = 48
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
			chip = 18
			code = T,
			chip = 18
			code = T,
			chip = 18
			code = T,
			chip = 18
			code = T,
			chip = 40
			code = I,
			chip = 40
			code = I,
			chip = 40
			code = I,
			chip = 40
			code = I,
			chip = 2
			code = E,
			chip = 2
			code = E,
			chip = 3
			code = E,
			chip = 2
			code = E,
			chip = 124
			code = I,
			chip = 124
			code = I,
			chip = 124
			code = I,
			chip = 124
			code = I
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
			amount = 600,
			amount = 600,
			amount = 600,
			amount = 600,
			amount = 600,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 800,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 3000,
			amount = 3000,
			amount = 3000
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
script 242 mmbn2 {
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
script 243 mmbn2 {
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
		flag = 1318
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
