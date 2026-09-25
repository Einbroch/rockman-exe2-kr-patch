@archive 07E1E68
@size 143

script 0 mmbn2s {
	end
}
script 1 mmbn2s {
	"""
	フォルダ1
	フォルダ2
	フォルダ3
	"""
	end
}
script 2 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 1
		padZeros = false
		padLeft = false
	end
}
script 3 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	end
}
script 4 mmbn2s {
	"""
	ならびかえ
	
	ID
	アイウエオ
	コード
	攻撃力
	属性
	枚数
	チップ容量
	"""
	end
}
script 5 mmbn2 {
	textSpeed
		delay = 0
	msgOpenSmall
		top = 12
	positionText
		left = 1
		top = 1
	"""
	チップフォルダを
	えらぼう!
	"""
	waitHold
}
script 6 mmbn2 {
	textSpeed
		delay = 0
	msgOpenSmall
		top = 12
	positionText
		left = 1
		top = 1
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"へんしゅう\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"そうび"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 7 mmbn2 {
	textSpeed
		delay = 0
	msgOpenSmall
		top = 12
	positionText
		left = 1
		top = 1
	"フォルダ"
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	を
	そうびしました
	"""
	keyWait
	waitHold
}
script 8 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = false
		padLeft = true
	end
}
script 9 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"チップフォルダを そうびしなきゃ!"
	keyWait
	waitHold
}
script 10 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ナビチップが おおすぎるよ!
	へんしゅうがめんで こうかんして!
	"""
	keyWait
	waitHold
}
script 15 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"チップフォルダが 30枚になってないよ!"
	keyWait
	msgCloseQuick
	end
}
script 16 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	おなじチップは 5枚までしか
	入れられないよ
	"""
	keyWait
	msgCloseQuick
	end
}
script 17 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ナビチップは ぜんぶで5枚までしか
	入れられないよ
	"""
	keyWait
	msgCloseQuick
	end
}
script 18 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ナビチップは ぜんぶで8枚までしか
	入れられないよ
	"""
	keyWait
	msgCloseQuick
	end
}
script 19 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	レギュラーようりょうが たりないから
	レギュラーチップにできないよ
	"""
	keyWait
	msgCloseQuick
	end
}
script 20 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 25
		jumpIfFalse = continue
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"あたらしいメールが きてるみたいだね"
	waitHold
}
script 21 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 26
		jumpIfFalse = continue
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"どのメールを よむの?"
	waitHold
}
script 22 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 27
		jumpIfFalse = continue
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"だれからも きてないよ・・・"
	waitHold
}
script 25 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"アタラシイ メールガ キテイマス"
	waitHold
}
script 26 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"ドノ メールヲ ヨミマスカ?"
	waitHold
}
script 27 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"メールハ キテイマセン・・・"
	waitHold
}
script 30 mmbn2s {
	"    ?"
	end
}
script 31 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 3
		padZeros = false
		padLeft = true
	end
}
script 32 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 4
		padZeros = false
		padLeft = true
	end
}
script 33 mmbn2s {
	end
}
script 40 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"これがボクのステータスだよ"
	waitHold
}
script 41 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"どのキノウを きょうかするの?"
	waitHold
}
script 43 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"ノーマルスタイルに もどしたよ!"
	keyWait
	waitHold
}
script 44 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	printItem
		buffer = 1
		item = 0
	"を そうびしたよ!"
	keyWait
	waitHold
}
script 45 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ロックバスターの攻撃力をUPさせる?
	(バスターUP のこり 
	"""
	printItemAmount
		minLength = 0
		padZeros = false
		padLeft = false
		item = 97
	"コ)\n"
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
		clear = false
		targets = [
			jump = 46,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 46 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"ロックバスターの攻撃力がUPしたよ!"
	keyWait
	waitHold
}
script 47 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ロックバスターの連射力をUPさせる?
	(バスターUP のこり 
	"""
	printItemAmount
		minLength = 0
		padZeros = false
		padLeft = false
		item = 97
	"コ)\n"
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
		clear = false
		targets = [
			jump = 48,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 48 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"ロックバスターの連射力がUPしたよ!"
	keyWait
	waitHold
}
script 49 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ロックバスターのチャージ力をUPさせる?
	(バスターUP のこり 
	"""
	printItemAmount
		minLength = 0
		padZeros = false
		padLeft = false
		item = 97
	"コ)\n"
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
		clear = false
		targets = [
			jump = 50,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 50 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"ロックバスターのチャージ力がUPしたよ!"
	keyWait
	waitHold
}
script 51 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"そこはそれいじょう きょうかできないよ"
	keyWait
	waitHold
}
script 52 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"バスターアップを もってないよ・・・"
	keyWait
	waitHold
}
script 53 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"スタイルを もってないよ・・・"
	keyWait
	waitHold
}
script 54 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"どのスタイルにするの?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	printItem
		buffer = 1
		item = 0
	spaceLeft
		count = 11
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 55 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"どのスタイルにするの?\n"
	option
		left = 1
		right = 1
		up = 2
		down = 2
	space
		count = 2
	printItem
		buffer = 1
		item = 0
	spaceLeft
		count = 11
	option
		left = 0
		right = 0
		up = 2
		down = 2
	space
		count = 2
	printItem
		buffer = 2
		item = 0
	"\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 56 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"どのスタイルにするの?\n"
	option
		left = 1
		right = 1
		up = 2
		down = 2
	space
		count = 2
	printItem
		buffer = 1
		item = 0
	spaceLeft
		count = 11
	option
		left = 0
		right = 0
		up = 3
		down = 3
	space
		count = 2
	printItem
		buffer = 2
		item = 0
	"\n"
	option
		left = 3
		right = 3
		up = 0
		down = 0
	space
		count = 2
	printItem
		buffer = 3
		item = 0
	spaceLeft
		count = 11
	option
		left = 2
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 57 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	いまのスタイルでは フォルダのなかの
	ナビチップがおおくて つかいこなせないよ
	"""
	keyWait
	clearMsg
	"""
	いちど ブラザースタイルのまま
	フォルダへんしゅうがめんで
	ナビチップを 5枚いかにしてね!
	"""
	keyWait
	waitHold
}
script 60 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 75
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpenQuick
	textSpeed
		delay = 0
	"ここまでのかつやくをセーブしておこうか?\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 61 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 76
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	すでに セーブデータが あるばあい
	うわがき しちゃうけど いい?
	
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 62 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 77
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpenQuick
	textSpeed
		delay = 0
	"セーブに しっぱいしたみたい・・・"
	keyWait
	clearMsg
	"もういちど やってみるね\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 63 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 78
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpenQuick
	textSpeed
		delay = 0
	"よし セーブおわったよ!"
	keyWait
	waitHold
}
script 64 mmbn2s {
	"プレイじかん"
	end
}
script 65 mmbn2s {
	"データライブラリ"
	end
}
script 66 mmbn2s {
	"バトルチップ"
	end
}
script 67 mmbn2s {
	"クレジット"
	end
}
script 68 mmbn2s {
	"  "
	printBuffer
		buffer = 0
		minLength = 2
		padZeros = true
		padLeft = true
	":"
	printBuffer
		buffer = 1
		minLength = 2
		padZeros = true
		padLeft = true
	end
}
script 69 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 3
		padZeros = false
		padLeft = true
	"/250"
	end
}
script 70 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 3
		padZeros = false
		padLeft = true
	"/260"
	end
}
script 71 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 6
		padZeros = false
		padLeft = true
	"枚"
	end
}
script 72 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 6
		padZeros = false
		padLeft = true
	"z"
	end
}
script 75 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"ココマデノカツヤクヲ セーブシマスカ?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ハイ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"イイエ"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 76 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	スデニ セーブデータガ アルバアイ
	ウワガキ サレマスガ ヨロシイデスカ?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ハイ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"イイエ"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 77 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"セーブニ シッパイシマシタ・・・"
	keyWait
	clearMsg
	"モウイチド オコナイマスカ?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ハイ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"イイエ"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 78 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"セーブ カンリョウ シマシタ"
	keyWait
	waitHold
}
script 80 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 1
		padZeros = false
		padLeft = true
	"/"
	printBuffer
		buffer = 1
		minLength = 1
		padZeros = false
		padLeft = true
	end
}
script 81 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"なにも もってないよ・・・"
	waitHold
}
script 82 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"「"
	printItem
		buffer = 1
		item = 0
	"」を つかうよ?\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 83 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"ロックマンのHPが かいふくした!"
	keyWait
	waitHold
}
script 84 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	ロックマンのHPが
	かんぜんかいふくした!
	"""
	keyWait
	waitHold
}
script 85 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"HPは マンタンだよ!"
	keyWait
	waitHold
}
script 86 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"「"
	printItem
		buffer = 1
		item = 0
	"」は つかってるよ?"
	keyWait
	waitHold
}
script 87 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	このエリアにきてから まだウイルスに
	であってないよ?
	"""
	keyWait
	waitHold
}
script 88 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	カギのかかった ミステリーデータが
	めのまえにないと つかえないよ!
	"""
	keyWait
	waitHold
}
script 89 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"いまは つかわないでおこうよ!"
	keyWait
	waitHold
}
script 90 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"じゃあ まずはじめにセーブをするね!\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 91 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	すでに セーブデータが あるばあい
	うわがき しちゃうけど いい?
	
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 92 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpenQuick
	textSpeed
		delay = 0
	"セーブに しっぱいしたみたい・・・"
	keyWait
	clearMsg
	"もういちど やってみるね\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 93 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"よし セーブかんりょう!"
	keyWait
	waitHold
}
script 94 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ともだちと ネットバトルをするよ
	れんしゅうだから きがるにたたかえるね
	"""
	waitHold
}
script 95 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ともだちと ネットバトルをするよ
	まけるとバトルチップを1枚とられる
	しんけんしょうぶだからね!
	"""
	waitHold
}
script 96 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"ともだちとバトルチップのこうかんをするよ"
	waitHold
}
script 97 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"ともだちとスタイルのこうかんをするよ"
	waitHold
}
script 98 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	つうしんエラーだ・・・
	もういちど やりなおしてみてよ
	"""
	keyWait
	waitHold
}
script 99 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	まけたとき あいてにわたす
	バトルチップがないから
	このモードは えらべないよ
	"""
	keyWait
	waitHold
}
script 100 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ともだちの方は
	まだ じゅんび中みたい・・・
	ちょっとまってね
	"""
	waitHold
}
script 101 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	やったね 熱斗くん!
	ナイスオペレーティングだったよ!
	"""
	keyWait
	waitHold
}
script 102 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ざんねんだったね 熱斗くん・・・
	・・・ボクもがんばらなきゃね!
	"""
	keyWait
	waitHold
}
script 103 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	おしかったね 熱斗くん!
	まったくの ごかくだったね!
	"""
	keyWait
	waitHold
}
script 104 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	つうしんエラーだ・・・
	たいせんを ちゅうだんするね
	"""
	keyWait
	waitHold
}
script 105 mmbn2s {
	"  "
	printBuffer
		buffer = 0
		minLength = 6
		padZeros = false
		padLeft = true
	end
}
script 106 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 3
		padZeros = false
		padLeft = true
	"  "
	printBuffer
		buffer = 1
		minLength = 3
		padZeros = false
		padLeft = true
	end
}
script 107 mmbn2s {
	"""
	ネットバトル(れんしゅう)
	ネットバトル(ほんばん)
	バトルチップトレード
	スタイルトレード
	"""
	end
}
script 108 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	あれ・・・
	ともだちと えらんでるモードがちがうよ?
	同じモードをえらんでね!
	"""
	keyWait
	waitHold
}
script 109 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ノーマルスタイルにしてからじゃないと
	このモードは えらべないよ
	"""
	keyWait
	waitHold
}
script 110 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ともだちの方はまだ
	トレードに出すチップを
	えらんでるところだね・・・
	"""
	waitHold
}
script 111 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"この2枚を こうかんするよ?\n"
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
	"いいえ\n"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = 112,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 112 mmbn2 {
	clearMsg
	"ちょっとまってね"
	waitHold
}
script 113 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"トレードかんりょう!"
	keyWait
	waitHold
}
script 114 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ともだちの方も「なし」をえらんでるよ?
	ふたりともが えらんじゃダメだよ
	"""
	keyWait
	msgCloseQuick
	end
}
script 115 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	トレードかんりょう!・・・
	でも、いまの こうかんって
	イミあったの・・・?
	"""
	keyWait
	waitHold
}
script 116 mmbn2s {
	"なし"
	end
}
script 117 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ともだちの方も「なし」をえらんでるよ?
	ふたりともが えらんじゃダメだよ
	"""
	keyWait
	waitHold
}
script 120 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"どのスタイルを こうかんする?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	printItem
		buffer = 1
		item = 0
	spaceLeft
		count = 11
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 121 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"どのスタイルを こうかんする?\n"
	option
		left = 1
		right = 1
		up = 2
		down = 2
	space
		count = 2
	printItem
		buffer = 1
		item = 0
	spaceLeft
		count = 11
	option
		left = 0
		right = 0
		up = 2
		down = 2
	space
		count = 2
	printItem
		buffer = 2
		item = 0
	"\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 122 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"どのスタイルを こうかんする?\n"
	option
		left = 1
		right = 1
		up = 2
		down = 2
	space
		count = 2
	printItem
		buffer = 1
		item = 0
	spaceLeft
		count = 11
	option
		left = 0
		right = 0
		up = 3
		down = 3
	space
		count = 2
	printItem
		buffer = 2
		item = 0
	"\n"
	option
		left = 3
		right = 3
		up = 0
		down = 0
	space
		count = 2
	printItem
		buffer = 3
		item = 0
	spaceLeft
		count = 11
	option
		left = 2
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 123 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ともだちの方はまだ
	トレードに出すスタイルを
	えらんでるところだね・・・
	"""
	waitHold
}
script 124 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"この2つを こうかんするよ?\n"
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
	"いいえ\n"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = 112,
			jump = continue,
			jump = continue
		]
	waitHold
}
script 125 mmbn2 {
	clearMsg
	"ちょっとまってね"
	waitHold
}
script 126 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"トレードかんりょう!"
	keyWait
	waitHold
}
script 127 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	トレードかんりょう!・・・
	でも、いまの こうかんって
	イミあったの・・・?
	"""
	keyWait
	waitHold
}
script 128 mmbn2 {
	msgOpenQuick
	mugshotShow
		mugshot = MegaMan
	textSpeed
		delay = 0
	"""
	ともだちが もっているスタイルは
	きほんてきに こうかんできないよ!
	"""
	keyWait
	clearMsg
	"""
	でも おなじスタイルであれば
	こうかんOKだけどね!
	"""
	keyWait
	waitHold
}
script 140 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	「
	"""
	printItem
		buffer = 0
		item = 114
	"""
	」の
	こうかがきれたよ!
	"""
	keyWait
	end
}
script 141 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	「
	"""
	printItem
		buffer = 0
		item = 116
	"""
	」の
	こうかがきれたよ!
	"""
	keyWait
	end
}
