@archive 077589C
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"なんだよ おマエ?"
	keyWait
	clearMsg
	"""
	ビジネスで イソガしいんダァよ!
	ニホンジンの パスポートは
	カネに なるんだっつーの!
	"""
	keyWait
	clearMsg
	"""
	ァア? よく ミりゃ
	さっきの ヨワっちぃ ナビじゃねえか?
	"""
	keyWait
	clearMsg
	"""
	しつこい ヤツだな!
	コンドは ホンキで デリートしてやらぁ!
	"""
	waitSkip
		frames = 30
	"\nおメェら! やっちまいな!"
	keyWait
	clearMsg
	flagSet
		flag = 539
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 8
		field = 0
		music = 27
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コノサキハ ナラズモノタチガ ツドウ
	アンコクノ ネットセカイ
	「ウラインターネット」 デス
	"""
	keyWait
	clearMsg
	"""
	オフィシャルノ コクサイカイギ ガ
	モウスグ アルノデ、ワルイヤツガ
	ハイッテ コナイヨウ フウサ シテイマス
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkFlag
		flag = 540
		jumpIfTrue = 3
		jumpIfFalse = continue
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"なんだ おマエ?"
	keyWait
	clearMsg
	"""
	オレさまが
	ニホンジンの パスポートを カうのを
	ジャマ しようってのか!?
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	おマエの パスポートだ なんて
	しらなかったんだよ
	しょうがねえダロ!!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	アレ? アメロッパスクエア ハ
	ドッチダッタッケナ?
	"""
	keyWait
	clearMsg
	"""
	ミチガ イリクンデテ
	マヨッチャイマシタ~
	"""
	keyWait
	end
}
script 20 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ハッ! コオリヲ コワシテ
	クレタンデスカ?
	"""
	keyWait
	clearMsg
	"""
	アノ コオリハ、カナリ
	キケンデスヨ・・・
	"""
	keyWait
	clearMsg
	"ハヤク トリノゾカナイト"
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コオリガ ゼンブ ナクナリマシタ
	モシカシテ、アナタガ
	トリノゾイテ クレタンデスカ?
	"""
	keyWait
	end
}
script 30 mmbn2 {
	checkChapter
		lower = 65
		upper = 72
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワルモノの シンニュウを
	ここで ミハっていますが
	トクに メダったコトは ありません
	"""
	keyWait
	clearMsg
	"""
	ヤツら
	イッタイ どこから クるんだろう?
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	え? コトブキスクエアから
	ゴスペルの ヤツらが
	シンニュウ してキていますか?
	"""
	keyWait
	clearMsg
	"""
	じゃあ そっちの セツゾクポイントを
	カタめなきゃ
	"""
	keyWait
	end
}
script 190 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ねぇ、ボクゥ おニィさんに
	ボウヤのモってる ゼニー
	ゼンブくれない?
	"""
	keyWait
	clearMsg
	"""
	おニィさん、おカネに
	コマってるのよ
	"""
	keyWait
	clearMsg
	"""
	イヤだなんて イったら
	ケガしちゃうわよん
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
	おまえが、「ブラック・ナビズ」の
	ナンバー3か!?
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
	アラやだ! なんで、アタシのコト
	シってるの?
	"""
	keyWait
	clearMsg
	"""
	もしかして、ナンバー4を
	タオしたナビって アナタなの?
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
	"""
	ナンバー2と、ナンバー1は
	ドコにいるんだ!?
	"""
	keyWait
	clearMsg
	jump
		target = 194
}
script 194 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	なるホド・・・ようするに アナタは、
	アタシたちの テキってワケね
	"""
	keyWait
	clearMsg
	"""
	ナンバー2は、ウラインターネットの
	オクに いるわ
	"""
	keyWait
	clearMsg
	"""
	でも、アナタが、ナンバー2に
	あうコトはないわ
	"""
	keyWait
	clearMsg
	"""
	ナゼなら、アナタの ナビジンセイ
	ココでオワっちゃうのよ
	"""
	keyWait
	clearMsg
	"""
	アナタ、カワイいから
	デリート したくないけど
	しかたナいわね・・・
	"""
	keyWait
	clearMsg
	"""
	なるべく、イタくナいように
	デリートしてあげるわ!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 296
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 58
		field = 65
		music = 27
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
		flag = 609
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
		battle = 37
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
		flag = 610
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
		battle = 38
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
		flag = 611
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
		battle = 39
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
		item = 85
		amount = 1
		jumpIfEqual = 221
		jumpIfGreater = 221
		jumpIfLess = continue
	msgOpen
	"""
	ミリオネアのかんりする
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
	ミリオネアの かんりする
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
		item = 85
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
		flag = 73
	wait
		frames = 102
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	ウラインターネット
	ワープポイントはいってスグ
	キケン!! ちかづくな!
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	さかみちを のぼると
	ウラインターネット ほうめん
	キケン!!
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
		flag = 1437
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	ロックマンは、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 96
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
	checkFlag
		flag = 2144
		jumpIfTrue = continue
		jumpIfFalse = 232
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
		target = 232
}
script 232 mmbn2 {
	flagSet
		flag = 1438
	jumpRandom
		untrap = true
		targets = [
			ratio = 32
			jump = 233,
			ratio = 32
			jump = 234,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 235
		]
	flagClear
		flag = 2144
}
script 233 mmbn2 {
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
script 234 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 52
			code = Q,
			chip = 52
			code = Q,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G
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
script 235 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 2000,
			amount = 2000,
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
script 236 mmbn2 {
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
		jumpIfFalse = 237
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
		target = 237
}
script 237 mmbn2 {
	flagSet
		flag = 1439
	jumpRandom
		untrap = true
		targets = [
			ratio = 16
			jump = 238,
			ratio = 48
			jump = 239,
			ratio = 0
			jump = 0,
			ratio = 64
			jump = 240
		]
	flagClear
		flag = 2144
}
script 238 mmbn2 {
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
script 239 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 52
			code = Q,
			chip = 52
			code = Q,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 40
			code = W,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 111
			code = *,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G,
			chip = 2
			code = G
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
script 240 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 300,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1000,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 1200,
			amount = 2000,
			amount = 2000,
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
script 241 mmbn2 {
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
		chip = 52
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 52
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	keyWait
	msgClose
	flagSet
		flag = 1440
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
