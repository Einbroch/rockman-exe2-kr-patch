@archive 075CE1C
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 116
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 105
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 96
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkChapter
		lower = 41
		upper = 41
		jumpIfInRange = 58
		jumpIfOutOfRange = continue
	checkChapter
		lower = 40
		upper = 40
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkFlag
		flag = 68
		jumpIfTrue = 36
		jumpIfFalse = continue
	checkFlag
		flag = 535
		jumpIfTrue = 1
		jumpIfFalse = continue
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	なんだ オマエ?
	よそもんと はなす気は ねえぜ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkFlag
		flag = 536
		jumpIfTrue = 4
		jumpIfFalse = continue
	checkFlag
		flag = 537
		jumpIfTrue = 3
		jumpIfFalse = continue
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	え? オレが ジムかって?
	なんで オマエなんかに なまえを
	おしえなきゃ なんねえんだよ!
	"""
	keyWait
	clearMsg
	"""
	・・・んあ?
	ジジイに はなしを きいてきた?
	パスポートとチップを しらねえか だと?
	"""
	keyWait
	clearMsg
	"""
	・・・ちぇっ ジジイからの ハナシなら
	ムシ できねえな・・・
	でも、タダってわけには いかねえぜ
	"""
	keyWait
	clearMsg
	"ニホンにゃ 「"
	printChip
		buffer = 0
		chip = 111
	" "
	printCode
		buffer = 0
		code = *
	"""
	」って
	めずらしい チップが あるらしいな
	そいつを くれるんなら ネタをやるぜ
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotHide
	msgOpen
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"あげる "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"あげない"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 4,
			jump = continue,
			jump = continue
		]
	flagSet
		flag = 537
	mugshotShow
		mugshot = BlackKid
	"オマエ こまってんじゃねーのか?"
	keyWait
	clearMsg
	"・・・ベツに あとばらいで いいんだぜ"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"「"
	printChip
		buffer = 0
		chip = 111
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	くれる気に なったかい?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 4 mmbn2 {
	flagSet
		flag = 536
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	それじゃ パスポートの ネタから
	おしえてやるか・・・
	"""
	keyWait
	clearMsg
	"""
	パスポートなら きっと 今ごろ
	ネットに ながれてるはずだ
	オレたちの 世界を さがしても ムダさ
	"""
	keyWait
	clearMsg
	"""
	プラグインして ナビを ネットにおくって
	パスポートを うばっていった ナビを
	さがし出すんだな
	"""
	keyWait
	clearMsg
	"""
	ただ、このあたりで ネットに アクセス
	するなら、ここを とりしきってる
	ラウルさんに ゆるしを もらわねえとな
	"""
	keyWait
	clearMsg
	"ま オレにきいたとでも いってみることだ"
	keyWait
	clearMsg
	"""
	・・・ウラネットに ながれちまったら
	パスポート もう 見つかんねえぜ
	いそいだほうが いいぜ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 115
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 107
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 92
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 82
		jumpIfOutOfRange = continue
	checkFlag
		flag = 68
		jumpIfTrue = 35
		jumpIfFalse = continue
	checkFlag
		flag = 536
		jumpIfTrue = 15
		jumpIfFalse = continue
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	ここでは ゆうふくで ないもの
	そして しょうすうみんぞくの たみが
	おおく くらしている・・・
	"""
	keyWait
	clearMsg
	"""
	みな あらっぽいヤツ ばかりだが
	しかし オレたちは なかまを
	とても だいじにする・・・
	"""
	keyWait
	clearMsg
	"""
	だが・・・しんようならない よそものに
	やさしくするほど おひとよしでは
	ないのだ
	"""
	keyWait
	end
}
script 6 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 117
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	checkFlag
		flag = 68
		jumpIfTrue = 37
		jumpIfFalse = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ここは
	りょこうしゃの くるところ じゃねえ!!
	でて行きな! ゲタウト!
	"""
	keyWait
	end
}
script 7 mmbn2 {
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 81
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	checkFlag
		flag = 68
		jumpIfTrue = 38
		jumpIfFalse = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	むこうにある
	バスケゴールの 下に いるのが
	オレたちの リーダー、ラウルさんさ
	"""
	keyWait
	clearMsg
	"""
	・・・おっと いけねえ、
	よそものに よけいなことを
	しゃべっちまった・・・
	"""
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	textSpeed
		delay = 4
	"ヒーHO! ホーHO!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	textSpeed
		delay = 4
	"ヨーHO! ローHO!"
	keyWait
	end
}
script 10 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 118
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 63
		jumpIfOutOfRange = continue
	checkFlag
		flag = 542
		jumpIfTrue = 39
		jumpIfFalse = continue
	checkFlag
		flag = 603
		jumpIfTrue = 46
		jumpIfFalse = continue
	checkChapter
		lower = 40
		upper = 40
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkFlag
		flag = 68
		jumpIfTrue = 39
		jumpIfFalse = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	なにアルカ?
	きやすく はなしかけないアル!
	"""
	keyWait
	clearMsg
	"""
	わたし アジーナじんアル!
	ニホンじん ちがうアル!
	"""
	keyWait
	end
}
script 11 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 119
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 64
		jumpIfOutOfRange = continue
	checkFlag
		flag = 68
		jumpIfTrue = 40
		jumpIfFalse = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	しょうばいの ジャマだ!
	どっか いきやがれ! ゴナウェ!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	checkFlag
		flag = 67
		jumpIfTrue = 16
		jumpIfFalse = continue
	flagSet
		flag = 67
	mugshotShow
		mugshot = Raoul
	msgOpen
	"たしかに オレは ラウルだが・・・"
	waitSkip
		frames = 30
	"\nそうか、ジムの しょうかいか"
	keyWait
	clearMsg
	"""
	よかろう・・・だが オレは
	こしぬけに 手をかす つもりはない
	"""
	keyWait
	clearMsg
	"""
	オレの サンダーマンを たおしてみろ!
	そうすれば ラジカセから
	インターネットに アクセス させてやる
	"""
	keyWait
	clearMsg
	"""
	サンダーマンを たおせるほどの ウデなら
	あとは おのずと みちが ひらける
	だろう・・・
	"""
	keyWait
	clearMsg
	"さあ どうする?"
	keyWait
	clearMsg
	jump
		target = 17
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	どうした?
	オレと ネットバトル する気になったか?
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ラウルさんに
	ネットバトルを もうしこむ?
	
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
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = 18,
			jump = 19,
			jump = continue
		]
	end
}
script 18 mmbn2 {
	checkFlag
		flag = 63
		jumpIfTrue = 20
		jumpIfFalse = continue
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	わがぶぞく、
	そして なかまたちの ほこりが
	オレを しょうりに みちびく!!
	"""
	keyWait
	clearMsg
	jump
		target = 26
}
script 19 mmbn2 {
	flagClear
		flag = 64
	flagClear
		flag = 65
	flagClear
		flag = 66
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	ゆうき なきものに
	おとずれる みらいは ない・・・
	"""
	keyWait
	end
}
script 20 mmbn2 {
	flagClear
		flag = 64
	flagClear
		flag = 65
	flagClear
		flag = 66
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	はいしゃには しょうしゃを たたえる
	じかんが ひつようと される・・・
	"""
	waitSkip
		frames = 30
	"\nわがぶぞくの オキテだ"
	keyWait
	end
}
script 21 mmbn2 {
	checkFlag
		flag = 64
		jumpIfTrue = 31
		jumpIfFalse = continue
	checkFlag
		flag = 65
		jumpIfTrue = 32
		jumpIfFalse = continue
	checkFlag
		flag = 66
		jumpIfTrue = 33
		jumpIfFalse = 33
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"これが ニホンサムライか・・・"
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	今日は まけを みとめよう・・・
	だが つぎは ちがうけっかが
	おまえを まっている!
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	こうなることは わかっていた・・・
	なぜなら わがぶぞくは
	さいきょうの ぶぞく・・・
	"""
	keyWait
	end
}
script 26 mmbn2 {
	flagSet
		flag = 63
	msgClose
	waitHold
}
script 27 mmbn2 {
	flagSet
		flag = 68
	flagClear
		flag = 64
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 84
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 84
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
		target = 23
}
script 28 mmbn2 {
	flagSet
		flag = 69
	flagClear
		flag = 65
	end
}
script 29 mmbn2 {
	flagSet
		flag = 70
	flagClear
		flag = 66
	end
}
script 31 mmbn2 {
	checkFlag
		flag = 68
		jumpIfTrue = 24
		jumpIfFalse = continue
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	おまえが ゆうしゃで あることは
	しょうめい された・・・
	"""
	keyWait
	clearMsg
	"""
	さあ、これで インターネットに
	アクセスするが いい・・・
	"""
	keyWait
	clearMsg
	jump
		target = 27
}
script 32 mmbn2 {
	checkFlag
		flag = 69
		jumpIfTrue = 24
		jumpIfFalse = continue
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	2どの はいぼくは
	1どの はいぼくより
	はるかに おもい いみをもつ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 28
}
script 33 mmbn2 {
	checkFlag
		flag = 70
		jumpIfTrue = 24
		jumpIfFalse = continue
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	わがぶぞくに つたわる
	でんせつの きょうしゃ・・・
	おまえは そのうまれかわり・・・?
	"""
	keyWait
	clearMsg
	jump
		target = 29
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"おまえは もう オレたちの なかまだ"
	keyWait
	clearMsg
	jump
		target = 17
}
script 36 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	ラウルさんに
	ゆるしを もらったみたいだな・・・
	"""
	keyWait
	clearMsg
	"""
	なら はやいとこ プラグインして
	パスポートと チップ さがしに
	行くことさ
	"""
	keyWait
	clearMsg
	"""
	・・・ウラネットに ながれちまったら
	パスポート もう 見つかんねえから
	いそいだほうが いいぜ
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ヘイ!
	オレたちの あたらしい ブラザー!
	ちょうしは どうだい?
	"""
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	むこうにある
	バスケゴールの 下に いるのが
	オレたちの リーダー、ラウルさんさ
	"""
	keyWait
	clearMsg
	"""
	・・・おっと
	それはもう しってるんだったな!
	"""
	keyWait
	clearMsg
	"""
	コイツァ おかしいや!
	ワハハハハハハハ!!!!
	"""
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"なにアルカ きょうだい?"
	keyWait
	clearMsg
	"""
	アジーナじんと ニホンじんは
	おおむかしから きょうだいアル!
	なかよく しようアル!
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ヘイ カモン ガイ!!
	チキンが くいたきゃ いつでも くいな!
	"""
	keyWait
	end
}
script 45 mmbn2 {
	flagSet
		flag = 604
	mugshotShow
		mugshot = Man
	msgOpen
	"さがしものアルカ きょうだい?"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 111
	" "
	printCode
		buffer = 0
		code = *
	"""
	」は ニホンでは
	めずらしくない きいたアル
	"""
	keyWait
	clearMsg
	"""
	たれか ニホンじんの かんこうきゃく
	きっと もってるアルナイカ?
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"やくに 立てたようで うれしいアルヨ"
	keyWait
	end
}
script 50 mmbn2 {
	checkFlag
		flag = 542
		jumpIfTrue = 57
		jumpIfFalse = continue
	checkFlag
		flag = 541
		jumpIfTrue = 51
		jumpIfFalse = continue
	flagSet
		flag = 541
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"ヘヘッ、オレのネタ やくに立っただろ?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ああ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちっとも"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 52,
			jump = continue,
			jump = continue
		]
	"おんしらずな ヤツだな"
	keyWait
	clearMsg
	"どっか 行っちゃえ!!"
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	やっぱりな、
	さっきのは じょうだん だよな
	"""
	keyWait
	clearMsg
	jump
		target = 52
}
script 52 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	じゃあ、やくそく どおり
	「
	"""
	printChip
		buffer = 0
		chip = 111
	" "
	printCode
		buffer = 0
		code = *
	"」 くれよな\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ああ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ヤだよ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 54,
			jump = continue,
			jump = continue
		]
	"なんだと バカ!"
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"さすがだぜ ブラザー!"
	waitSkip
		frames = 30
	"""
	
	・・・って リュックの中に
	ないじゃねぇか!
	"""
	keyWait
	clearMsg
	"""
	・・・もし
	そうびしてんなら とっとと出せよな
	"""
	keyWait
	end
}
script 54 mmbn2 {
	checkPackChipCode
		chip = 111
		code = *
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 53
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"じゃ! 出しな"
	keyWait
	clearMsg
	jump
		target = 55
}
script 55 mmbn2 {
	itemTakeChip
		chip = 111
		code = *
		amount = 1
	mugshotHide
	msgOpen
	"""
	熱斗は、
	「
	"""
	printChip
		buffer = 0
		chip = 111
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ジムに あげた!
	"""
	keyWait
	clearMsg
	jump
		target = 56
}
script 56 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	やったぜ!
	これで みんなに ジマンできる!
	"""
	keyWait
	clearMsg
	"""
	・・・っと わすれてたぜ
	バトルチップの ネタだっけな
	"""
	keyWait
	clearMsg
	jump
		target = 57
}
script 57 mmbn2 {
	flagSet
		flag = 542
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	カネもちで ゆうめいな ミリオネアって
	マダムが、めずらしい チップを
	たかいねだんで かったって ハナシだぜ
	"""
	keyWait
	clearMsg
	"""
	なんせ カネもち だからな
	まぁ いるところは そうぞうつくよな
	"""
	keyWait
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"よかったな・・・"
	keyWait
	clearMsg
	"""
	そういや、
	おまえの なまえを きいてなかったな
	"""
	keyWait
	clearMsg
	"おまえは・・・"
	waitSkip
		frames = 30
	"\nネット っていうのか"
	keyWait
	clearMsg
	"いいなまえだな ネット!"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	モーニン! ネット!
	あさっぱらから どうしたんだい?
	"""
	keyWait
	clearMsg
	"""
	オフィシャルの こくさいかいぎ?
	そりゃ ここじゃ ないよな
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ここは
	りょこうしゃの くるところ じゃねえ!!
	でて行きな! ゲタウト!
	"""
	keyWait
	clearMsg
	"なんてな!"
	waitSkip
		frames = 15
	"\nジョークさ! ブラザー!"
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	オレたちの リーダー、ラウルさんなら
	あさはやく 出かけて行ったぜ
	"""
	keyWait
	clearMsg
	"""
	シロの方に ようじがある、
	とか いってたな
	"""
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"おはよーアル"
	keyWait
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	オレは
	まいあさ イノリを ささげる・・・
	"""
	keyWait
	clearMsg
	"""
	マイゴッドと
	ゴッドが あたえてくれる チキンにな
	・・・
	"""
	keyWait
	clearMsg
	"""
	なにごとも
	かんしゃの キモチが だいじだぜ、
	ブラザー
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	おしろで タイヘンな じけんが
	あったらしいが、
	"""
	keyWait
	clearMsg
	"""
	とある ニホンじん しょうねん
	ネットバトラーの かつやくで
	かいけつ したらしいぜ
	"""
	keyWait
	clearMsg
	"・・・もしかして ネットか?"
	keyWait
	clearMsg
	"まさかな!"
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	おまえか オレたちのリーダー
	ラウルさんに ネットバトルで
	かった ヤツ ってのは
	"""
	keyWait
	clearMsg
	"やるじゃねえか!"
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	もうゲンキだ、と いいたい ところだが
	わがぶぞくでは ウソは しざい・・・
	"""
	keyWait
	clearMsg
	"""
	まだ キズぐちは うずくが
	ゆうしゃの らいほうだ、
	サンダーマンとともに れいを つくそう
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 90 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	オモテどおりが さわがしいな
	ナニがあったんだ?
	"""
	keyWait
	end
}
script 91 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 106
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 97
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	よう! キョウダイ!
	ゲンキか!? え? オモテどおりが
	タイヘンな コトに なっているって?
	"""
	keyWait
	clearMsg
	"""
	オモテのヤツらを ウラどおりに
	いれてやってくれって?
	フン! オレたちには、カンケーないぜ!
	"""
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"・・・"
	keyWait
	clearMsg
	"""
	オモテどおりの ものたちが
	くるしんで いるようだな・・・
	"""
	keyWait
	clearMsg
	"・・・"
	keyWait
	clearMsg
	jump
		target = 17
}
script 96 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"そんなに つよいひざしが?"
	keyWait
	clearMsg
	"""
	そりゃ たぶんアレだ、
	かんきょういじシステムに
	ふぐあいが おきてるんだ
	"""
	keyWait
	clearMsg
	"""
	アメロッパの きこうは
	かんきょういじシステムで
	せいぎょ してるからな
	"""
	keyWait
	clearMsg
	"オレは なんだって しってるぜ"
	keyWait
	clearMsg
	"""
	しかし ひざしが つよいってコトは
	しがいせんが かなり つよいかもな
	"""
	keyWait
	clearMsg
	"""
	ヘタしたら
	かなりヤバいコトに なりかねないぜ
	"""
	keyWait
	end
}
script 97 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ラウルさんに かった
	アンタの たのみとあっちゃ
	きかねえワケには いかねえからな
	"""
	keyWait
	clearMsg
	"""
	オモテどおりの ヤツらを
	いれてやったぜ
	"""
	keyWait
	end
}
script 98 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	すんなり
	ウラどおりに いれてもらえたわ・・・
	"""
	keyWait
	clearMsg
	"""
	ウ、ウラどおりの ヒトたちって
	お、おもったより やさしいのね・・・
	"""
	keyWait
	clearMsg
	"ビクビク・・・"
	keyWait
	end
}
script 99 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	ここなら なんとか
	あの きょうれつな ひざしを
	うけずに すむわ
	"""
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ふ~、たすかったデース・・・
	でも、このひざしは
	いつまで つづくんでしょ?
	"""
	keyWait
	end
}
script 105 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"日ざしが、もとに もどったようだぜ"
	keyWait
	clearMsg
	"""
	て コトは、
	かんきょういじシステムも なおった
	って コトか?
	"""
	keyWait
	end
}
script 106 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	さっき オモテの ヤツらと
	すこし しゃべったんだが、
	ワリと おもしろいヤツら じゃねえか
	"""
	keyWait
	clearMsg
	"""
	スカしたヤツら ばっかだと
	おもってたんだが ちがってた みたいだな
	"""
	keyWait
	end
}
script 107 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	かなり キズも いえた・・・
	これ、しんじつなり・・・
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 115 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	ゴスペルとの たたかいは きびしいが
	みな よくまとまって たたかっている
	・・・
	"""
	keyWait
	clearMsg
	"""
	ヤツらは オレのほこり・・・
	みなのために オレも さいごまで
	たたかおう
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 116 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"ネット!"
	keyWait
	clearMsg
	"""
	なかまが なんにんか
	ネットはんざいに まきこまれて
	ヤラれちまったんだ!
	"""
	keyWait
	clearMsg
	"ネット!"
	keyWait
	clearMsg
	"""
	おまえなら
	なんとか してくれるよな? 
	"""
	waitSkip
		frames = 15
	"な!"
	keyWait
	end
}
script 117 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ブラザー!
	ひさしぶりだな!
	"""
	keyWait
	clearMsg
	"""
	オレたちなら だいじょうぶ、
	ノープロブレム だぜ!
	"""
	keyWait
	clearMsg
	"""
	え?
	あいぼうの すがたが みあたらねぇ?
	"""
	keyWait
	clearMsg
	"""
	それは いわない プロミスさ・・・
	グズ・・・
	"""
	keyWait
	end
}
script 118 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	やるアル~~~~~~!!
	たたかうアル~~~~~~~~~!!
	"""
	keyWait
	clearMsg
	"""
	なんじ
	ウイルスを たおせんことが あるをや!
	いやない! アル!
	"""
	keyWait
	clearMsg
	"""
	ネットワークを ほろぼされた
	アジーナじんの うらみ、
	今こそ はらすときアル!
	"""
	keyWait
	end
}
script 119 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"ウイルスから このやたいを まもるぜ!"
	keyWait
	clearMsg
	"""
	と いいたいところだが
	じつは オレ チキンなんだ・・・
	"""
	keyWait
	clearMsg
	"チキンうりが チキン・・・"
	waitSkip
		frames = 15
	"\nツラいぜ マイセルフ・・・"
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 268
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 267
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 267
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ヘロー!
	あなた ニホンじんさんデスカ?
	"""
	keyWait
	clearMsg
	"""
	ニホンには グッドなチップが
	メニー、メニーあると きいていマス
	"""
	keyWait
	clearMsg
	"あなた、「"
	printChip
		buffer = 0
		chip = 157
	" "
	printCode
		buffer = 0
		code = D
	"""
	」を、
	もってますデスカ?
	"""
	keyWait
	clearMsg
	"""
	もってたら、ワタシの
	「
	"""
	printChip
		buffer = 0
		chip = 63
	" "
	printCode
		buffer = 0
		code = P
	"""
	」と
	チェンジしてクダサーイ
	"""
	keyWait
	clearMsg
	"OKですか? ハーハン?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"OK "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"NOです"
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
	オーーウ! なぜデスカーーー?
	ホワーーイ?
	"""
	keyWait
	clearMsg
	"""
	ニホンじんは、ウワサどおりの
	ケチんぼ なんデスカ?
	"""
	keyWait
	clearMsg
	"""
	そうでなかったら、
	チェンジしてクーダサーーイ
	"""
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 157
		code = D
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 268
	itemTakeChip
		chip = 157
		code = D
		amount = 1
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"OK? イェイ!"
	keyWait
	clearMsg
	"""
	さすがは、ニホンのヒト!
	ふとっぱらデース!!
	"""
	keyWait
	clearMsg
	"""
	アメロッパじんも、
	ウソつきマセーーン
	"""
	keyWait
	clearMsg
	"""
	ワタシのチップを、あなたに
	フォーユー デース!
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
		chip = 63
		code = P
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 63
	" "
	printCode
		buffer = 0
		code = P
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
		mugshot = PompadourMan
	msgOpen
	"""
	オー! ニホンのヒト!
	サンキューね!
	"""
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ヘーイ! ニホンダンジ!!
	やっぱり きてくれたのネー!
	"""
	keyWait
	clearMsg
	"ユーの「"
	printChip
		buffer = 0
		chip = 157
	" "
	printCode
		buffer = 0
		code = D
	"""
	」と、
	ミーの「
	"""
	printChip
		buffer = 0
		chip = 63
	" "
	printCode
		buffer = 0
		code = P
	"""
	」を
	チェンジしてくれるデスか? ハーハン?
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
	"そーでーす! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いやちがう"
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
	オオオーーーノーーゥ!!
	ワタシ、ニホンじん しんじてます
	"""
	keyWait
	clearMsg
	"""
	ユーが、チップをチェンジ
	してくれるのを
	"""
	keyWait
	clearMsg
	"""
	ワタシ、まってマース!
	ウエイト フォー ユー デース!!
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ワオ!
	チェンジするチップが ないネ
	"""
	keyWait
	clearMsg
	"""
	もしかして フォルダのナカに
	はいってませんカー?
	"""
	keyWait
	clearMsg
	"""
	チェンジするときには、
	リュックの なかに、チェンジする
	チップを いれといてクダサーイ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ゴミバコだ
	さまざまなゴミが ざつぜんと
	つめこまれている
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"すてられた クマのぬいぐるみ・・・"
	keyWait
	clearMsg
	"""
	なぜ ココに すてられたのか、
	この ぬいぐるみは ナニをおもうのか、
	小さなドラマが あるにちがいない・・・
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkFlag
		flag = 307
		jumpIfTrue = 231
		jumpIfFalse = continue
	msgOpen
	"""
	あきビンや もくざいが
	すてられている
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ゴミと ゴミとの あいだで
	ネズミが きゅうくつそうに
	しょくじを している・・・
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 321
		jumpIfTrue = continue
		jumpIfFalse = 235
	jump
		target = 236
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	バスケットの ゴールだ
	わりと ひくめに つけられているので、
	ダンクシュートも ユメではない
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	くらやみに 光る
	いくつもの するどい がんこうが
	こちらを とらえている・・・
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	とても ナマぐさい
	どうやら ナマゴミが すてられて
	いるようだ・・・
	"""
	keyWait
	clearMsg
	"""
	よくみると、むすうの ゴキブリが
	うごめいている・・・
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	まるハダカにされた チキンが
	ならんでいる・・・
	"""
	keyWait
	end
}
script 228 mmbn2 {
	checkFlag
		flag = 68
		jumpIfTrue = continue
		jumpIfFalse = 230
	msgOpen
	"""
	ラジカセから どくとくの リズムの
	おんがくが きこえてくる・・・
	ここに プラグイン できる!
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"中から イシが とんできた!"
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"""
	ラジカセから どくとくの リズムの
	おんがくが きこえてくる・・・
	"""
	keyWait
	clearMsg
	"""
	プラグインできる つくりだが
	しゅういに さっきを かんじる・・・
	"""
	keyWait
	end
}
script 231 mmbn2 {
	flagSet
		flag = 308
	msgOpen
	"ナニか かいてある・・・"
	keyWait
	clearMsg
	"「電脳の もりにある おうこく\n とおときモノを おさめし ヘヤ\n その ちゅうおうに たつモノ」"
	keyWait
	end
}
script 235 mmbn2 {
	flagSet
		flag = 321
	msgOpen
	"ゴソゴソ"
	textSpeed
		delay = 10
	"・・・"
	textSpeed
		delay = 2
	keyWait
	clearMsg
	"ちかづくと ネズミが にげだした!!"
	keyWait
	clearMsg
	"""
	ネズミの いたばしょに
	「
	"""
	printItem
		buffer = 0
		item = 99
	"""
	」が ある・・・
	うすよごれているが つかえそうだ
	"""
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGive
		item = 99
		amount = 1
	"""
	熱斗は、
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
	playerReset
	keyWait
	clearMsg
	"""
	レギュラーメモリの ようりょうが、
	2メガ ふえた!!
	"""
	keyWait
	end
}
script 236 mmbn2s {
	end
}
