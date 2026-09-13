@archive 074D3F0
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 66
		upper = 72
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 64
		upper = 65
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 34
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 31
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"ここは メトロラインの マリンえきです"
	keyWait
	clearMsg
	"""
	マリンハーバーに あるから
	マリンえき っていいます
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkFlag
		flag = 604
		jumpIfTrue = 5
		jumpIfFalse = continue
	checkFlag
		flag = 590
		jumpIfTrue = 2
		jumpIfFalse = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"ぎゅうにゅうを グビっとな!!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"ライセンスしけん うけるまえに・・・"
	waitSkip
		frames = 30
	"\nぎゅうにゅうを グビっとな!!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1801
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"ライセンスしけんに おちたけど・・・"
	waitSkip
		frames = 30
	"\nぎゅうにゅうを グビっとな!!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"ここは メトロラインの マリンえきです"
	keyWait
	clearMsg
	"""
	マリンハーバーに あるから
	マリンえき っていいます
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	オフィシャルセンターに
	チップトレーダーが あたらしく
	おかれたんだって!
	"""
	keyWait
	clearMsg
	mugshotHide
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"なにそれ? "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ホント!?"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 12,
			jump = continue,
			jump = continue
		]
	mugshotShow
		mugshot = OrangeShirtBoy
	"""
	ホントさ!
	キミも 行って たしかめてみたら?
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	いらない チップを 入れたら
	あたらしいチップが 出てくる きかいだよ
	おもしろいよ!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"ここは メトロラインの マリンえきです"
	keyWait
	clearMsg
	"""
	マリンハーバーに あるから
	マリンえき っていいます
	"""
	keyWait
	end
}
script 20 mmbn2 {
	checkItem
		item = 23
		amount = 1
		jumpIfEqual = 21
		jumpIfGreater = 21
		jumpIfLess = continue
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"ようこそ マリンえきへ!"
	keyWait
	checkItem
		item = 23
		amount = 1
		jumpIfEqual = 21
		jumpIfGreater = 21
		jumpIfLess = continue
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"あっ パスポートを おもちですね"
	keyWait
	clearMsg
	"""
	でしたら
	くうこうせんを ごりよう いただけますよ
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	わるいが いそがしいんだ
	話なら またこんどに してくれ・・・
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	まいど ごじょうしゃ
	ありがとうございます!
	"""
	keyWait
	clearMsg
	"うん、今日も ぜっこうちょう!!"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	じしんの せいで、
	おきゃくさんが、ガクンと
	へりました・・・
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	メトロラインは、えきもふくめて
	じしんにつよい せっけいを
	されているので、あんしんです
	"""
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	まちも、もうすぐ おちつきを
	とりもどすコトでしょう
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"ようこそ マリンえきへ!"
	keyWait
	clearMsg
	"""
	じけんが ふえると 
	このえきを りようする おきゃくさんも
	ふえて いそがしく なります
	"""
	keyWait
	clearMsg
	"""
	でも ゴスペルの ふあんから
	気を まぎらわせられるので
	いいですけどね
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"グビっ・・・グビっ・・・"
	keyWait
	clearMsg
	"""
	よっしゃ! きあい 入ったぞー!
	いらいを こなしに 行くぞー!!
	"""
	keyWait
	clearMsg
	"""
	しみんネットバトラー として
	がんばっちゃうからなー!
	"""
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	おふぃちゃるちぇんたー は
	どこ でちか?
	"""
	keyWait
	clearMsg
	"""
	パパも ママも おうちで
	ウイルチュを やっちゅけてるの、
	"""
	keyWait
	clearMsg
	"だから アタチが・・・"
	waitSkip
		frames = 20
	"えとえと・・・"
	waitSkip
		frames = 20
	"\nなにちに きたんだっけ?"
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	コトブキパスを おもちですね
	では ちょくせつ かいさつへ
	おすすみ下さい
	"""
	keyWait
	clearMsg
	"""
	なお コトブキえきには
	このえきからしか 行けません
	みかいつうろせん ですからね
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 260
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 259
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 259
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"ねぇ、キミ!"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 107
	" "
	printCode
		buffer = 0
		code = S
	"""
	」
	っていうチップを もっていないかい?
	"""
	keyWait
	clearMsg
	"""
	もし、もってたら ボクの
	「
	"""
	printChip
		buffer = 0
		chip = 121
	" "
	printCode
		buffer = 0
		code = B
	"""
	」と、
	こうかんしてほしいんだけど
	"""
	keyWait
	clearMsg
	"どうかな?\n"
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
	"いや"
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
	いやなら しかたないね
	もし、こうかんしてくれるんだったら
	また ボクにこえをかけてね
	"""
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 107
		code = S
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 260
	itemTakeChip
		chip = 107
		code = S
		amount = 1
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	え? ホントにいいの?
	うわ~、うれしいな~!!
	"""
	keyWait
	clearMsg
	"""
	んじゃ、やくそくのチップ
	はい!
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
		chip = 121
		code = B
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 121
	" "
	printCode
		buffer = 0
		code = B
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
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	キミはとても、しんせつなヒトだね
	キミからもらったチップ、
	たいせつにするよ!!
	"""
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"おや? キミは・・・"
	keyWait
	clearMsg
	"キミの「"
	printChip
		buffer = 0
		chip = 107
	" "
	printCode
		buffer = 0
		code = S
	"""
	」と、
	ボクの「
	"""
	printChip
		buffer = 0
		chip = 121
	" "
	printCode
		buffer = 0
		code = B
	"""
	」を
	こうかんしてくれるのかい?
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
	"いいよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いや"
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
	いやなら しかたないね
	もし、こうかんしてくれるんだったら
	また ボクにこえをかけてね
	"""
	keyWait
	clearMsg
	"ずっと、まってるよ・・・"
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"ねえ、「"
	printChip
		buffer = 0
		chip = 107
	" "
	printCode
		buffer = 0
		code = S
	"""
	」が
	ないみたいだけど、
	"""
	keyWait
	clearMsg
	"""
	もしかして、フォルダのなかに
	いれてたり、しないよね?
	"""
	keyWait
	clearMsg
	"""
	こうかんする チップは、
	リュックのなかに いれておいてね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	もえるゴミを すてるための
	ゴミバコだ
	"""
	keyWait
	clearMsg
	"""
	しかし、もえないゴミも
	まざっている
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"「じょうしゃマナーを まもろう」"
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"バイテンだ"
	keyWait
	clearMsg
	"""
	メトロ マリンえきてんは、
	ほうふな しなぞろえが ウリだ
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"スポーツしんぶんだ"
	keyWait
	clearMsg
	"""
	だいいちめんには、ゆうめいカントク の
	しゃしんが おおきくのっている
	"""
	keyWait
	clearMsg
	"「サヨナラ! ミスター、ジャンボーズ!」"
	keyWait
	end
}
script 230 mmbn2 {
	checkFlag
		flag = 23
		jumpIfTrue = 236
		jumpIfFalse = continue
	checkItem
		item = 23
		amount = 1
		jumpIfEqual = 232
		jumpIfGreater = 232
		jumpIfLess = continue
	checkChapter
		lower = 16
		upper = 32
		jumpIfInRange = 231
		jumpIfOutOfRange = continue
	msgOpen
	"行き先を えらんでください\n"
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"秋原町\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"どこにも行かない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 233,
			jump = continue,
			jump = continue
		]
	end
}
script 231 mmbn2 {
	msgOpen
	"行き先を えらんでください\n"
	option
		left = 1
		right = 1
		up = 2
		down = 2
	space
		count = 2
	"秋原町     "
	option
		left = 0
		right = 0
		up = 1
		down = 2
	space
		count = 2
	"おくデンだに\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"どこにも行かない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 233,
			jump = 234,
			jump = continue,
			jump = continue
		]
	end
}
script 232 mmbn2 {
	msgOpen
	"行き先を えらんでください\n"
	option
		left = 1
		right = 1
		up = 2
		down = 2
	space
		count = 2
	"秋原町     "
	option
		left = 0
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"おくデンだに\n"
	option
		left = 3
		right = 3
		up = 0
		down = 0
	space
		count = 2
	"くうこう    "
	option
		left = 2
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"どこにも行かない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 233,
			jump = 234,
			jump = 235,
			jump = continue,
			jump = continue
		]
	end
}
script 233 mmbn2 {
	flagSet
		flag = 23
	itemGive
		item = 88
		amount = 1
	msgOpen
	playerAnimate
		animation = 24
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 88
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 4
	playerUnlock
	keyWait
	end
}
script 234 mmbn2 {
	flagSet
		flag = 23
	itemGive
		item = 90
		amount = 1
	msgOpen
	playerAnimate
		animation = 24
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 90
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 4
	playerUnlock
	keyWait
	end
}
script 235 mmbn2 {
	flagSet
		flag = 23
	itemGive
		item = 91
		amount = 1
	msgOpen
	playerAnimate
		animation = 24
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 91
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 4
	playerUnlock
	keyWait
	end
}
script 236 mmbn2 {
	msgOpen
	"きっぷを かいなおしますか?\n"
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
			jump = 237,
			jump = continue,
			jump = continue
		]
	end
}
script 237 mmbn2 {
	itemTake
		item = 88
		amount = 1
	itemTake
		item = 90
		amount = 1
	itemTake
		item = 91
		amount = 1
	flagClear
		flag = 23
	msgOpen
	"""
	熱斗は、
	もっている きっぷを
	へんきゃくした!
	"""
	keyWait
	clearMsg
	jump
		target = 230
}
script 238 mmbn2 {
	itemTake
		item = 88
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 88
	"""
	」
	を つかった!
	"""
	keyWait
	end
}
script 240 mmbn2 {
	itemTake
		item = 90
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 90
	"""
	」
	を つかった!
	"""
	keyWait
	end
}
script 241 mmbn2 {
	itemTake
		item = 91
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 91
	"""
	」
	を つかった!
	"""
	keyWait
	end
}
script 242 mmbn2 {
	checkItem
		item = 41
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 243
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、\n"
	printItem
		buffer = 0
		item = 41
	"を つかう?\n"
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
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = continue,
			jump = 243,
			jump = continue
		]
	mugshotHide
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 41
	"""
	」
	を つかった!
	"""
	keyWait
	flagSet
		flag = 172
	end
}
script 243 mmbn2 {
	mugshotHide
	checkItem
		item = 88
		amount = 1
		jumpIfEqual = 238
		jumpIfGreater = 238
		jumpIfLess = continue
	checkItem
		item = 90
		amount = 1
		jumpIfEqual = 240
		jumpIfGreater = 240
		jumpIfLess = continue
	checkItem
		item = 91
		amount = 1
		jumpIfEqual = 241
		jumpIfGreater = 241
		jumpIfLess = continue
	end
}
