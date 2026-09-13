@archive 0747A90
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 31
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	ここは ちかてつ メトロラインの
	あきはらえき です
	"""
	keyWait
	clearMsg
	"""
	いま かいつう してるのは
	マリンハーバー行きの ろせんだけです
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 56
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 46
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 36
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 27
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 31
		jumpIfInRange = 11
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	メトロラインに のるには
	そこの けんばいきで
	きっぷを かわなきゃ ダメだよ
	"""
	keyWait
	clearMsg
	"""
	でも しょうがくせいは むりょうだから
	おかねは いらないんだ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkFlag
		flag = 590
		jumpIfTrue = 3
		jumpIfFalse = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"キミの ともだち?"
	waitSkip
		frames = 30
	"""
	
	だれかは しらないけど
	こどもは 見てないなあ
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	おじさん
	オフィシャルセンターに つとめてるんだ
	これで 行きかえりが ラクになるよ
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	まいど
	あきはらえきを ごりよう いただき
	ありがとう ございます
	"""
	keyWait
	clearMsg
	"""
	ただいま キャンプシーズンに つき
	「おくデンだに」行きの りんじびんを
	うんこう中 です
	"""
	keyWait
	clearMsg
	"え? もう キャンプは コリゴリ?"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	メトロラインで はたらいている からには
	いつかは うんてんしに なりたいで
	あります
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ボクも
	でんしゃの うんてんしゅに なるんだ!
	"""
	keyWait
	end
}
script 23 mmbn2 {
	flagAddMail
		flag = 1822
	jump
		target = 25
}
script 24 mmbn2 {
	flagAddMail
		flag = 1794
	flagAddMail
		flag = 1814
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	まいど
	あきはらえきを ごりよう いただき
	ありがとう ございます
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	メトロラインには くうこうせん も
	あります
	"""
	keyWait
	clearMsg
	"""
	パスポートを もってたら
	「くうこう」行きの きっぷが
	かえるように なるのです
	"""
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"メトロラインで アメロッパへ?"
	keyWait
	clearMsg
	"""
	あんさん
	そりゃ ムリというもの じゃえ
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	こんげつは、しゃないマナーきょうか
	キャンペーンを じっし しています
	"""
	keyWait
	clearMsg
	"""
	おとしよりや、カラダの ふじゆうなカタに
	ざせきを、おゆずりして いただくよう
	よろしく おねがいします
	"""
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	まいど ごじょうしゃ
	ありがとうございます
	"""
	keyWait
	clearMsg
	"""
	へぇ! アメロッパからかえって
	こられたんですか?
	"""
	keyWait
	clearMsg
	"おかえりなさい!"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	じしんが、つづいていますが
	メトロラインは うんこうちゅうです
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	むかしの、でんしゃは
	じしんなどで、だっせんする
	きけんせいが ありましたが、
	"""
	keyWait
	clearMsg
	"""
	メトロラインは そうならないように
	せっけい かんり されています
	"""
	keyWait
	clearMsg
	"あんしん して、ごりようください"
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	メトロラインは、さいがいに
	くっしません!
	"""
	keyWait
	clearMsg
	"""
	せかい さいきょうの
	てつどうなのです!!
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	い、いくら でんしゃ じたいは、
	だっせんしなくても
	"""
	keyWait
	clearMsg
	"""
	らくばんでも、おこして
	えきが うまったら
	さすがに、ヤバいなあ
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	ひとりでも、メトロラインを
	りようしてくださる
	おきゃくさまが いれば
	"""
	keyWait
	clearMsg
	"""
	ワタシたちは、ぜんりょくで
	はたらきます!
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	まいど ごじょうしゃ
	ありがとうございます!!
	"""
	keyWait
	clearMsg
	"さぁ! きょうも はりきっていくぞ!"
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	まいど
	あきはらえきを ごりよう いただき
	ありがとう ございます
	"""
	keyWait
	clearMsg
	"""
	今のところ メトロラインは
	ぜんせんで つうじょうどおりの
	うんてんを 行っています
	"""
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = MetrolineMan
	msgOpen
	"""
	メトロラインは むかし いちど
	ウイルスに やられたことが
	ありますからね
	"""
	keyWait
	clearMsg
	"""
	こんかいは そうならないように
	ばんぜんの たいさくを とっています!!
	"""
	keyWait
	clearMsg
	"""
	と 「いえ」って
	いわれてるんですけどね・・・
	"""
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"キャンプに 行くんじゃないのよ"
	keyWait
	clearMsg
	"""
	ウイルスでおきる じけんを シンパイして
	おやが じっかに かえってこいって
	うるさいの
	"""
	keyWait
	clearMsg
	"ほんと シンパイしょう なんだから"
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 3213
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 162
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 161
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 161
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	キミが、いらいをうけてくれるのかい?
	ボクとそんなにトシは かわらないのに
	すごいなあ
	"""
	keyWait
	clearMsg
	"""
	ところで、ボクの いらいなんだけど
	ボクのナビが、いえでしちゃったんだ
	"""
	keyWait
	clearMsg
	"""
	ちょっとしたコトで ケンカに
	なっちゃったんだけど
	ボク、ヒドいコトいっちゃって
	"""
	keyWait
	clearMsg
	"たぶん、そのせいでボクのナビは・・・"
	keyWait
	clearMsg
	"""
	ねえ、たのむよ! ボクのナビを
	さがしてきてくれないか?
	"""
	keyWait
	clearMsg
	"""
	もう、しんぱいでたまらないんだ
	たぶん、インターネットの
	ドコかにいるとおもうんだけど・・・・
	"""
	keyWait
	clearMsg
	"""
	このあいだ、Aライセンスを とったから
	アジーナエリアあたりまで 行ったかも
	しれないんだ・・・
	"""
	keyWait
	clearMsg
	"""
	ムラサキいろのナビで、
	ちょっと ひよわそうなカンジなんだよ
	"""
	keyWait
	clearMsg
	"よろしくね"
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	いらいの ないよう?
	もー! ちゃんと おぼえておいてよね!
	"""
	keyWait
	clearMsg
	"""
	ケンカして、いえで しちゃった
	ボクのナビを さがしてほしいんだ
	"""
	keyWait
	clearMsg
	"""
	インターネットに とびだして
	行っちゃったんだ・・・
	"""
	keyWait
	clearMsg
	"""
	ナビの とくちょうは、
	ムラサキいろで ちょっと ひよわそうな
	かんじなんだ・・・
	"""
	keyWait
	clearMsg
	"ドコに いるんだろう?"
	keyWait
	clearMsg
	"""
	このあいだ Aライセンス とったから
	アジーナエリアくらいまで 行ってるかも
	"""
	keyWait
	clearMsg
	"よろしく たのんだよ!"
	keyWait
	end
}
script 192 mmbn2 {
	flagSet
		flag = 3213
	flagClear
		flag = 82
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"ホントにみつけてくれたのかい?"
	keyWait
	clearMsg
	"""
	え? アジーナエリアにいた?
	そんなトコロまでいってたのか
	"""
	keyWait
	clearMsg
	"わかったよ、ありがとう!!"
	keyWait
	clearMsg
	"""
	え? しばらく かえらない?
	そんなコトいってたの・・・
	"""
	keyWait
	clearMsg
	"""
	わかった・・・
	ボク はんせいして、
	じぶんのコトは じぶんでするよ
	"""
	keyWait
	clearMsg
	"""
	それで・・・
	ちゃんとあやまって
	なかなおりする!
	"""
	keyWait
	clearMsg
	"""
	それじゃあ、コレこんかいの
	おれいだよ
	"""
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 96
		amount = 1
	"""
	熱斗は、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 96
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
script 194 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"はやく かえってこないかな?"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	たいへん あいくるしいデザインの
	ゴミバコだ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"さまざまな ポスターが はられている"
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
	"マリンハーバー\n"
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
	"マリンハーバー "
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
	"マリンハーバー "
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
		item = 89
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
		item = 89
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
		item = 89
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
script 239 mmbn2 {
	itemTake
		item = 89
		amount = 1
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 89
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
