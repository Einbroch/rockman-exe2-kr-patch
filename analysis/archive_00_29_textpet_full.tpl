@archive 075ACEC
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 41
		upper = 42
		jumpIfInRange = 23
		jumpIfOutOfRange = continue
	checkFlag
		flag = 536
		jumpIfTrue = 1
		jumpIfFalse = continue
	checkChapter
		lower = 39
		upper = 39
		jumpIfInRange = 2
		jumpIfOutOfRange = continue
	jump
		target = 1
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"フォッ フォッ・・・"
	keyWait
	clearMsg
	"""
	このまちの ことで
	ワシに わからんことは ない
	"""
	keyWait
	clearMsg
	"""
	しんじるか しんじないかは
	おまえさん しだい じゃがの
	"""
	keyWait
	clearMsg
	"フォッ フォッ・・・"
	keyWait
	end
}
script 2 mmbn2 {
	flagSet
		flag = 535
	mugshotShow
		mugshot = OldMan
	msgOpen
	"フォッ フォッ・・・"
	keyWait
	clearMsg
	"""
	ぬすまれた パスポートと バトルチップを
	さがしとるとな・・・
	"""
	keyWait
	clearMsg
	"フォッ フォッ・・・"
	keyWait
	clearMsg
	"""
	そのての ハナシに くわしいのは
	うらどおりに すんどる ジムじゃな・・・
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ホラホラ! これが
	ゆうめいな アメロッパじょう だよ!
	はやく しゃしんを とりな!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	checkFlag
		flag = 604
		jumpIfTrue = 20
		jumpIfFalse = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"おかあさんには ナイショだけど・・・"
	waitSkip
		frames = 30
	"\nデジカメ ニホンに わすれてきちゃったの"
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	checkChapter
		lower = 41
		upper = 41
		jumpIfInRange = 24
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"アンタも だまされたのね・・・"
	keyWait
	clearMsg
	"""
	アイツ いつも あの手口で
	ニホン人から チップを うばってるの
	"""
	keyWait
	clearMsg
	"""
	なくなった チップは ヤミしじょうに
	ながれて なかなか 見つからないのよね
	"""
	waitSkip
		frames = 30
	"\nあきらめたほうが いいかも"
	keyWait
	end
}
script 6 mmbn2 {
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 28
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"ボーイ どこから きたんじゃ?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ニホン "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"アジーナ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 7,
			jump = continue,
			jump = continue
		]
	"""
	じゃろうな・・・おまえさん
	アジーナ人のような かおを しとる
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	ほう・・・
	それは とおいところから きなすった
	"""
	keyWait
	clearMsg
	"""
	ニホンの ことなら ようしっとるよ
	アジーナの いちぶ じゃろ?
	"""
	keyWait
	end
}
script 8 mmbn2 {
	checkChapter
		lower = 48
		upper = 48
		jumpIfInRange = 34
		jumpIfOutOfRange = continue
	checkChapter
		lower = 42
		upper = 42
		jumpIfInRange = 29
		jumpIfOutOfRange = continue
	checkFlag
		flag = 531
		jumpIfTrue = 9
		jumpIfFalse = continue
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	さかを のぼっていくと アメロッパじょう
	左は ダウンタウン、まちに 行けるぜ
	"""
	keyWait
	clearMsg
	"""
	オマエ、
	あんまり キョロキョロ してっと
	わるいヤツに ねらわれるぞ
	"""
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	そこにいた ヘンな ニホンジンなら
	モースピードで どっか 行っちまったよ
	"""
	keyWait
	clearMsg
	"アレが ニンジャだろ!? な? な?"
	keyWait
	end
}
script 10 mmbn2 {
	flagSet
		flag = 530
	wait
		frames = 1
	end
}
script 20 mmbn2 {
	checkFlag
		flag = 603
		jumpIfTrue = 22
		jumpIfFalse = continue
	flagSet
		flag = 603
	mugshotShow
		mugshot = Girl
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
	」?
	うん アタシ いっぱい もってるよ
	"""
	keyWait
	clearMsg
	"""
	ウイルスバスティングで
	いっつも それしか とれないんだもん
	"""
	keyWait
	clearMsg
	"じゃあ 手をだして・・・"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotHide
	msgOpen
	"ジャラララララ!!"
	keyWait
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 111
		code = *
		amount = 30
	"""
	熱斗は、
	チップデータ「
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
	を 30まい ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	おれいなら いいよ
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
	」、
	まだ 1000まいいじょう もってるから
	"""
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"フォッ フォッ・・・"
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"チップ とりかえしたのね!"
	keyWait
	clearMsg
	"""
	ニホン人て なきねいり するしか
	できないと おもってたけど、
	ちょっと みなおしたわ!!
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ホラホラ! あさひに てらされる
	アメロッパじょうも またかくべつだよ!
	はやく しゃしんを とりな!
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	はやく くうこうに 行かないと
	かえる ひこうきに おくれちゃうよー
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	コッチにきた そうそう、だまされて
	チップを とられてしまったんだ・・・
	"""
	keyWait
	clearMsg
	"もう ニホンに かえろうかな・・・"
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	おはよう ボーイ!
	いいてんきの あさは きもちがいいねぇ
	"""
	keyWait
	clearMsg
	"""
	アジーナの あさも
	おなじように さわやか なのかい?
	"""
	keyWait
	end
}
script 29 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	さっきから がいじんさんが たくさん
	おしろの 中に 入っていくぜ
	"""
	keyWait
	clearMsg
	"なんか あんのか?"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"フォッ フォッ・・・"
	keyWait
	clearMsg
	"""
	おぬしのような けっきさかんな
	わかものを 見ておると、
	"""
	keyWait
	clearMsg
	"""
	ワシにも としがいも なく
	ちが たぎってくるようじゃのぅ・・・
	"""
	keyWait
	clearMsg
	"フォッ フォッ・・・"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	わーーっ、ステキな おしろ~!!
	チョ~ イカしてる~!!
	"""
	keyWait
	clearMsg
	"""
	アメロッパ りょこうの
	しめくくりに ふさわしいっていうか~
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	イヤな おもいでとか あったかも
	しれないけど、
	"""
	keyWait
	clearMsg
	"""
	いいトコロも いっぱい あるから
	アメロッパのコト、キライに ならないでね
	"""
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	きこく するのじゃな
	アジーナ人の しょうねんよ
	"""
	keyWait
	clearMsg
	"""
	アジーナは、うみと みどりの
	たいへん うつくしい クニだと
	きいておる・・・
	"""
	keyWait
	clearMsg
	"""
	もうすこし わかければ
	アタシも 行ってみるんじゃがな・・・
	"""
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"今日 かえるのか?"
	keyWait
	clearMsg
	"""
	おみやげ かうんだったら、
	ダウンタウンに いい おみやげやさんが
	いるぜ
	"""
	keyWait
	end
}
script 40 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 46
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	な、なんてぇ アツさじゃぁ!
	こんな ひざしのなかに おったら
	すぐ、にっしゃびょうじゃ!
	"""
	keyWait
	clearMsg
	"""
	でも、ワシは ぼうしを かぶっておるで
	あんしんじゃ
	"""
	keyWait
	end
}
script 41 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 47
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	ちょっと、アツすぎるわ・・・
	ドコか ひかげに はいらないと
	"""
	keyWait
	clearMsg
	"クラクラ してきちゃった・・・"
	keyWait
	end
}
script 42 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 54
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 48
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"おお、アジーナの ボーイよ"
	keyWait
	clearMsg
	"""
	せかいかくちが てんさいに
	みまわれておる・・・
	"""
	keyWait
	clearMsg
	"アジーナも そうなのかい?"
	keyWait
	end
}
script 43 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 49
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	それにしても すごいひざしだな
	オレも、ひやけしちゃったよ
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	この アツさのなかじゃ、
	ぼ、ぼうしなんぞ やくたたーーん!
	もう、たまらんわい!
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	ハァハァ、そろそろ げんかいね・・・
	はやくドコかに ひなんしなくちゃ
	"""
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	にんげんは、じぶんたちの
	べんりさの ためだけに
	しぜんを こわしすぎたのじゃ!
	"""
	keyWait
	clearMsg
	"""
	こんかいの いじょうきしょうは、
	しぜんの いかりなのじゃ!
	"""
	keyWait
	end
}
script 49 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	アツさには、めっぽう つよい
	このオレでも もうフラフラだぜ
	"""
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	やっと いつもの ひざしに
	もどったわい
	"""
	keyWait
	clearMsg
	"""
	それにしても、しぜんさいがいは
	おそろしいもの じゃのう
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	こんかいの、きょうれつな ひざしは、
	オゾンそうを かんりしている
	システムが、とつぜんフリーズして、
	"""
	keyWait
	clearMsg
	"""
	オゾンそうに、おおきな アナが
	あいたのが、げんいん だったんだって
	"""
	keyWait
	clearMsg
	"""
	それで、つうじょうの すうじゅうばいの
	しがいせんが、ちじょうに
	ふりそそいだんだって
	"""
	keyWait
	clearMsg
	"おそろしい ハナシよね"
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"しぜんの、いかりが おさまった・・・"
	keyWait
	clearMsg
	"""
	しかし、にんげんが しぜんを
	はかい しつづけるかぎり
	"""
	keyWait
	clearMsg
	"""
	また、いつ こんかいのような
	さいがいが、おこるか わからんぞい
	"""
	keyWait
	clearMsg
	"""
	げんだいしゃかいの べんりさは
	つねに しぜんはかいの うえに
	なりたっているコトを わすれてはならん
	"""
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	こんかいの、さいがいの おかげで、
	アメロッパの アチコチで
	たくさんのヒトが たおれたらしいぜ
	"""
	keyWait
	clearMsg
	"""
	さいわい、ししゃは
	でなかったらしいけどな
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	きのうからの ウイルスの かつどう・・・
	かんぜんに いじょうだ
	"""
	keyWait
	clearMsg
	"光、"
	waitSkip
		frames = 15
	"""
	
	どんな テキとでも たたかえるように
	おまえは じゅんびを しておけ
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 61 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"ハイ・・・"
	waitSkip
		frames = 30
	"ガイ・・・"
	keyWait
	clearMsg
	"""
	ゲンキが なくて ソーリィ、
	きのうから ウイルスバスティングで
	てつや なんだ・・・
	"""
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"フォッ フォッ・・・"
	keyWait
	clearMsg
	"""
	アメロッパは
	世界一の たいこく じゃからの、
	"""
	keyWait
	clearMsg
	"""
	ゴスペルの ウイルスこうげきも
	もっとも はげしいのじゃ
	"""
	keyWait
	clearMsg
	"""
	じゃが ワシは しんじておる・・・
	ゆうかんに たたかっておる ジムたちをな
	・・・
	"""
	keyWait
	clearMsg
	"フォッ フォッ・・・"
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	みな とりみださず、ウイルスと
	ゆうかんに たたかおうと している・・・
	"""
	keyWait
	clearMsg
	"""
	こういう パワーが あるのが
	アメロッパ人の すごいところかもな
	"""
	keyWait
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	スリや チップごうとうは
	すっかり いなくなったわ
	"""
	keyWait
	clearMsg
	"わるいヤツも それどころじゃ ないみたい"
	keyWait
	end
}
script 65 mmbn2 {
	checkFlag
		flag = 325
		jumpIfTrue = 66
		jumpIfFalse = continue
	flagSet
		flag = 325
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"これ あげる"
	keyWait
	clearMsg
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 101
		amount = 1
	"""
	熱斗は、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 101
	"""
	」
	を ゲットした!!
	"""
	keyWait
	clearMsg
	playerFinish
	playerReset
	playerUnlock
	"""
	サブチップを もてるかずが
	1つ ふえた!
	"""
	keyWait
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"もうないよ"
	keyWait
	end
}
script 160 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	end
}
script 161 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、炎山くんに
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
	"いいえ\n"
	select
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = 162,
			jump = 164,
			jump = continue
		]
	end
}
script 162 mmbn2 {
	checkFlag
		flag = 186
		jumpIfTrue = 165
		jumpIfFalse = continue
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	いいだろう・・・
	ザコのあいてには オレたちも
	ウンザリ していたところ なんでな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 163
}
script 163 mmbn2 {
	flagSet
		flag = 186
	msgClose
	waitHold
}
script 164 mmbn2 {
	flagClear
		flag = 187
	flagClear
		flag = 188
	flagClear
		flag = 189
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	先を いそぐと いうのなら
	とめは せん・・・
	"""
	keyWait
	end
}
script 165 mmbn2 {
	flagClear
		flag = 187
	flagClear
		flag = 188
	flagClear
		flag = 189
	end
}
script 166 mmbn2 {
	checkFlag
		flag = 187
		jumpIfTrue = 167
		jumpIfFalse = continue
	checkFlag
		flag = 188
		jumpIfTrue = 169
		jumpIfFalse = continue
	checkFlag
		flag = 189
		jumpIfTrue = 171
		jumpIfFalse = 171
}
script 169 mmbn2 {
	checkFlag
		flag = 192
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	・・・その ウデなら
	オレが もどるまでの 間・・・
	じかんかせぎを まかせられそうだな
	"""
	keyWait
	clearMsg
	jump
		target = 170
}
script 170 mmbn2 {
	flagSet
		flag = 192
	flagClear
		flag = 188
	end
}
script 171 mmbn2 {
	checkFlag
		flag = 193
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	ゴスペルと たたかえる ネットバトラー
	オレしか いないと おもっていたが・・・
	"""
	keyWait
	clearMsg
	jump
		target = 172
}
script 172 mmbn2 {
	flagSet
		flag = 193
	flagClear
		flag = 189
	end
}
script 174 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	フッ・・・
	じつりょく いじょうの かのうせい、か
	・・・
	"""
	keyWait
	end
}
script 175 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	やはり たよれるのは おのれのみ・・・
	いっこくも はやく
	ニホンに もどらなければ・・・
	"""
	keyWait
	end
}
script 197 mmbn2 {
	checkItem
		item = 54
		amount = 1
		jumpIfEqual = 203
		jumpIfGreater = 203
		jumpIfLess = continue
	checkFlag
		flag = 3217
		jumpIfTrue = 203
		jumpIfFalse = continue
	checkFlag
		flag = 282
		jumpIfTrue = 201
		jumpIfFalse = continue
	flagSet
		flag = 282
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	な、なんだべ?
	お、おめ レディのカオさ
	ジロジロ みるなんてぇ
	"""
	keyWait
	clearMsg
	"シツレイでねか!"
	keyWait
	clearMsg
	jump
		target = 198
}
script 198 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	このへんじゃ、ききなれない
	ほうげん・・・
	"""
	keyWait
	clearMsg
	"""
	おまえは、「かいとう3しまい」の
	ひとりだな!!
	"""
	keyWait
	clearMsg
	"ぬすんだほうせきを かえすんだ!"
	keyWait
	clearMsg
	jump
		target = 199
}
script 199 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	おったまげた~!
	なして わかっただべか?
	"""
	keyWait
	clearMsg
	"あっ! いっちまったべ!"
	keyWait
	clearMsg
	"しっかた ねえべな!"
	keyWait
	clearMsg
	"""
	コレにかてたら ほうせきは
	かえしてやるっぺよ!
	"""
	keyWait
	clearMsg
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 54
		field = 65
		music = 27
}
script 200 mmbn2 {
	mugshotHide
	msgOpen
	"かり"
	keyWait
	end
}
script 201 mmbn2 {
	flagSet
		flag = 282
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	またまた、たまげたーー
	おめ、つえ~なー
	"""
	keyWait
	clearMsg
	"""
	オラは、みつけるコトができても、
	ねえちゃんたちは、そうそう
	みつかんねえよ
	"""
	keyWait
	clearMsg
	"""
	アメロッパのドコかにいるコトは、
	たしか だけどもな
	"""
	keyWait
	clearMsg
	"""
	ホレ これかえすっぺ
	オラたちは、ぬすみはするけんど
	ウソはつかねえべ
	"""
	keyWait
	clearMsg
	jump
		target = 202
}
script 202 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 54
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 54
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
script 203 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	もう、ドロボウは やめるっぺ
	いちど つかまったら
	アシを あらうってぇ きめてたから~
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	くうこう行きの バスのりば だ
	バスを まちますか?
	
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
		clear = true
		targets = [
			jump = 221,
			jump = continue,
			jump = continue
		]
	end
}
script 221 mmbn2 {
	msgOpen
	"くうこうの どこに 行きますか?\n"
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"しゅっぱつロビー\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"とうちゃくロビー"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 222,
			jump = continue,
			jump = continue
		]
	"・・・まっていたら バスが きた!!"
	wait
		frames = 30
	startWarp
		warp = 3
	end
}
script 222 mmbn2 {
	msgOpen
	"・・・まっていたら バスが きた!!"
	wait
		frames = 30
	startWarp
		warp = 2
	end
}
