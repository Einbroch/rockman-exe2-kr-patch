@archive 07541F8
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 13
		upper = 13
		jumpIfInRange = 5
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	キャンプでは ときには
	きめられた ルートから
	はずれてみるのも いいもんだぞ
	"""
	keyWait
	clearMsg
	"""
	そうすることで
	なにか おもいがけない ものを
	見つけることも あるもんだ
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 626
		jumpIfTrue = 2
		jumpIfFalse = continue
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkChapter
		lower = 13
		upper = 13
		jumpIfInRange = 6
		jumpIfOutOfRange = continue
	checkFlag
		flag = 626
		jumpIfTrue = 3
		jumpIfFalse = continue
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	あっちで えらそうにしてるの
	ボクの パパ なんだ
	"""
	keyWait
	clearMsg
	"""
	・・・でも さっき、どこかで
	オペラグラス おとしちゃったんだよ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	なに!? クマが!?
	それは イカン!!
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	クマが クマがー!
	ワーーーーン!!!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	キミたちの おかげで たすかったよ
	つくりモノと いっても はずみで
	ケガさせられる ことだってあるしね
	"""
	keyWait
	clearMsg
	"""
	おれいに
	ワタシが おとした オペラグラス、
	キミたちに あげるよ
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ニセモノの クマなら こわくないやい!
	ボクだって プラグイン してみようかな
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"・・・にげおくれちゃった"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	さっき
	上のほうで だれか ウロウロしてたけど
	なに してたのかしら?
	"""
	keyWait
	clearMsg
	"あ! それより いもうと さがさなきゃ!"
	keyWait
	end
}
script 20 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"うわーきれいな、みずだな~!"
	keyWait
	end
}
script 21 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	この おじぞうさまをみてると、
	ふだんのイヤなコトとか
	わすれられるんだ~
	"""
	keyWait
	end
}
script 22 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 27
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ワタシは、くうきおせん の
	けんきゅうをしているんだ
	"""
	keyWait
	clearMsg
	"""
	ココのくうきと、
	クルマのはしる まちなかを
	くらべると、
	"""
	keyWait
	clearMsg
	"""
	まちのくうきは、おそろしいほど
	よごれているんだ
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"あ、おサカナさんだ~!!"
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ふー、だいぶ いやされたわ・・・
	これで、あしたからも
	はりきって いきていけるわ
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	このまま くうきが、よごれつづけたら
	ニホンは、どうなってしまうのか?
	"""
	keyWait
	end
}
script 31 mmbn2 {
	checkChapter
		lower = 29
		upper = 31
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 28
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"コンニチハ、ナビでーす!"
	keyWait
	clearMsg
	"""
	ハッ!!
	・
	"""
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"""
	み、みたな!!
	ボクのヒミツとっくんを!
	"""
	keyWait
	clearMsg
	"""
	こんど、あるイベントで げきをするんだ
	で、ボクは ナビの やくなのさ
	"""
	keyWait
	clearMsg
	"よくできた きぐるみだろ?"
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ちょっと、つかれてきたな・・・
	そろそろ きゅうけいするか・・・
	"""
	keyWait
	clearMsg
	"ハ! また みられちゃった!"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	じつはね、ホントのコト イうと
	ボク デンノウセカイから
	やってキたんだ
	"""
	keyWait
	clearMsg
	"""
	なーんてね!! びっくりした?
	これで、ボクの えんげきは
	だいせいこう まちがいなしさ!
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"しぜんが いっぱい!!"
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	じしん コワイ・・・
	おウチに かえらなきゃ・・・
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ワタシ
	キャンプに きたわけじゃないの、
	"""
	keyWait
	clearMsg
	"""
	このうつくしい しぜんを
	目に やきつけに きたのよ
	"""
	keyWait
	clearMsg
	"さ・・・もう 行かなきゃ・・・"
	keyWait
	clearMsg
	"""
	ウイルスで こまってる
	おおくの人を たすけるために!
	"""
	keyWait
	end
}
script 81 mmbn2 {
	checkFlag
		flag = 326
		jumpIfTrue = 82
		jumpIfFalse = continue
	flagSet
		flag = 326
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"これ あげますじゃ"
	keyWait
	clearMsg
	mugshotHide
	playerLock
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
	playerUnlock
	keyWait
	clearMsg
	"""
	レギュラーメモリの ようりょうが、
	2メガ ふえた!!
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"もう ありませんじゃ"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	あしばが ないので
	この先には すすめそうにない・・・
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	あしばが ないので
	この先には すすめそうにない・・・
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	いろんな 大きさのイシが
	ゴロゴロと ころがっている・・・
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	いろんな 大きさのイシが
	ゴロゴロと ころがっている・・・
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	おだやかなカオをした
	おじぞうさんだ・・・
	"""
	keyWait
	clearMsg
	"・・・!?"
	keyWait
	clearMsg
	"""
	よくみると、プラグインできそうな
	アナがあいている
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	これが ゆうめいな、
	おくデンのたきだ
	"""
	keyWait
	clearMsg
	"""
	ここから ながれだすみずは、
	デンサンシティの
	せいかつようすい になる
	"""
	keyWait
	end
}
script 226 mmbn2 {
	checkChapter
		lower = 16
		upper = 72
		jumpIfInRange = 239
		jumpIfOutOfRange = continue
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 236
		jumpIfOutOfRange = continue
	checkFlag
		flag = 626
		jumpIfTrue = continue
		jumpIfFalse = 227
	checkItem
		item = 10
		amount = 1
		jumpIfEqual = 239
		jumpIfGreater = 239
		jumpIfLess = 228
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	たきの ウラは
	うすぐらくて ジトジトとしている・・・
	"""
	waitSkip
		frames = 30
	"\nピチャ! "
	waitSkip
		frames = 30
	"水しぶきが つめたい!"
	keyWait
	clearMsg
	"""
	・・・よく見ると、
	キラリと 光るものが あるようだが
	くらくて よくわからない・・・
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	たきの ウラは
	うすぐらくて ジトジトとしている・・・
	"""
	waitSkip
		frames = 30
	"\nピチャ! "
	waitSkip
		frames = 30
	"水しぶきが つめたい!"
	keyWait
	clearMsg
	"""
	・・・よく見ると、
	キラリと 光るものが あるようだが
	くらくて よくわからない・・・
	"""
	keyWait
	clearMsg
	"ひろってみますか?\n"
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
			jump = 229,
			jump = continue,
			jump = continue
		]
	end
}
script 229 mmbn2 {
	msgOpen
	playerAnimate
		animation = 24
	itemGive
		item = 10
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 10
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
script 230 mmbn2 {
	checkChapter
		lower = 13
		upper = 255
		jumpIfInRange = 232
		jumpIfOutOfRange = continue
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 264
	"ガオーーーーー!!!"
	wait
		frames = 60
	"\n"
	soundPlay
		track = 264
	"ガガガガオーーーーーー!!!!"
	wait
		frames = 60
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 231
}
script 231 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	こいつ うごき出しそうだよ!
	はやく プラグインしよう!
	"""
	keyWait
	end
}
script 232 mmbn2 {
	msgOpen
	"""
	つくりモノの クマだ
	今は かんぜんに ストップしている・・・
	"""
	keyWait
	end
}
script 233 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 264
	"ガオーーー!!!!"
	wait
		frames = 60
	"\n"
	soundPlay
		track = 264
	"ガオーーー!!!!"
	wait
		frames = 60
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 234
}
script 234 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"熱斗 ヤバいって!"
	keyWait
	clearMsg
	jump
		target = 235
}
script 235 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	・・・でも おかしくない?
	あのクマ さっきから おなじように
	ほえてるよ
	"""
	keyWait
	clearMsg
	"""
	なにか ありそうだけど
	ここからじゃ よくわからないな・・・
	"""
	keyWait
	end
}
script 236 mmbn2 {
	checkFlag
		flag = 657
		jumpIfTrue = 238
		jumpIfFalse = continue
	flagSet
		flag = 660
	msgOpen
	"""
	たきの ウラは
	うすぐらくて ジトジトとしている・・・
	"""
	waitSkip
		frames = 30
	"\nピチャ! "
	waitSkip
		frames = 30
	"水しぶきが つめたい!"
	keyWait
	clearMsg
	jump
		target = 237
}
script 237 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ね?
	そこに おちてるの PET じゃない?
	さっきまでは なかったのに・・・
	"""
	keyWait
	clearMsg
	"プラグインして 中を しらべてこようか?"
	keyWait
	end
}
script 238 mmbn2 {
	msgOpen
	"""
	たきの ウラは
	うすぐらくて ジトジトとしている・・・
	"""
	waitSkip
		frames = 30
	"\nピチャ! "
	waitSkip
		frames = 30
	"水しぶきが つめたい!"
	keyWait
	clearMsg
	"""
	はんにんが
	じけんに つかった PETが おちている
	きしゅは よくある タイプだ
	"""
	keyWait
	end
}
script 239 mmbn2 {
	msgOpen
	"""
	たきの ウラは
	うすぐらくて ジトジトとしている・・・
	"""
	waitSkip
		frames = 30
	"\nピチャ! "
	waitSkip
		frames = 30
	"水しぶきが つめたい!"
	keyWait
	end
}
