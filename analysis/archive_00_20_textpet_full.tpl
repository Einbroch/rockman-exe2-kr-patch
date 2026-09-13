@archive 07535A4
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 19
		jumpIfOutOfRange = continue
	checkFlag
		flag = 630
		jumpIfTrue = 12
		jumpIfFalse = continue
	checkChapter
		lower = 12
		upper = 13
		jumpIfInRange = 9
		jumpIfOutOfRange = continue
	checkFlag
		flag = 621
		jumpIfTrue = 2
		jumpIfFalse = continue
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"やあ キミたち、キャンプかい?\n"
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
			jump = 1,
			jump = continue,
			jump = continue
		]
	"""
	そうかい・・・
	でも そうは 見えないぞ?
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	「キャンプの ゴミは もちかえる」
	それが 山のルール なんだ!
	わすれない ようにな!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	このおくデンだにを あいするモノとして
	かんこうきゃくが ゴミを すてるのには
	もう ガマンが できないよ!
	"""
	keyWait
	clearMsg
	"""
	だって
	パッと見 なにもなさそうな ところでも
	しらべると ゴミが 出てくるんだぜ!
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 12
		upper = 13
		jumpIfInRange = 11
		jumpIfOutOfRange = continue
	checkFlag
		flag = 621
		jumpIfTrue = 6
		jumpIfFalse = continue
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"こんにちはー!"
	keyWait
	end
}
script 4 mmbn2 {
	checkChapter
		lower = 12
		upper = 13
		jumpIfInRange = 7
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	きよまつの サヨナラホームランの
	しんぶんを 木に ひっかけて
	すてた ヤツは だれだ!?
	"""
	keyWait
	clearMsg
	"""
	まったく けしからん!
	せっかくの ホームランなのに!!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 12
		upper = 13
		jumpIfInRange = 8
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	この人ったら ねっきょうてきな
	ジャンボーズの ファン なんですのよ
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"え ハチが?"
	waitSkip
		frames = 30
	"""
	
	ハチは やっぱり
	火に よわいんじゃ ないかしら?
	"""
	keyWait
	clearMsg
	"""
	なにかで 火をおこせば
	ハチを おいはらえるんじゃない?
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	きよまつの サヨナラホームランが
	・・・
	"""
	waitSkip
		frames = 30
	"もえちまった・・・"
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"あなた・・・"
	waitSkip
		frames = 20
	"ゲンキ出して くださいな"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	キミたち トカイっ子 にしては
	なかなか やるな!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"キャンプだ ワーイ!!"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"ハチ、おいはらえて よかったわね"
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	バーベキューの じゅんび?
	たいていのものは キャンプじょうで
	そろう はずだぞ
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	え? バクダンじけんの
	はんにんを さがしてる?
	さぁ・・・しらないなぁー
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"さらに きいてみる\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ほかを あたる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 16,
			jump = continue,
			jump = continue
		]
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	そう なんども きかれてもなぁ・・・
	まぁ しっていると いえば
	しっているかも しれないけどね
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"なっとくする\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ききながす\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"あやしむ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 21,
			jump = continue,
			jump = 17,
			jump = continue
		]
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"え? ボクが あやしい?"
	keyWait
	clearMsg
	"""
	ハハハっ まぁいいか、
	そろそろ バラしちゃっても
	"""
	keyWait
	clearMsg
	"""
	そうさ! バクダンじけんの はんにんは
	ボク、速見(はやみ)ダイスケだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ちょっと きびしいけど
	いい人だと おもってたのに!
	オレたちを だましたな!
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 19 mmbn2 {
	checkFlag
		flag = 643
		jumpIfTrue = continue
		jumpIfFalse = 20
	checkFlag
		flag = 644
		jumpIfTrue = continue
		jumpIfFalse = 20
	checkFlag
		flag = 645
		jumpIfTrue = 15
		jumpIfFalse = 20
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	なんだ
	まだ ヒナン していなかったのかい?
	"""
	keyWait
	clearMsg
	"""
	はやく ヒナンしなよ
	ここは もうすぐ
	とんでもないことに なるからね!
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"まあ そういう ことだよ"
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"""
	わるかったね
	でも ほんとに わるいのは キミたち、
	デンサンシティの人間 だぜ
	"""
	keyWait
	clearMsg
	"""
	この おくデンだにの
	しぜんを はかいしたり
	ゴミで よごしたんだからね!
	"""
	keyWait
	clearMsg
	"さあ もうすぐだ・・・"
	keyWait
	clearMsg
	"""
	ダムが バクハツすれば
	ボクたちも、そして 川下にある
	デンサンシティも・・・
	"""
	keyWait
	clearMsg
	"そう、すべてが 水に しずむんだ!"
	keyWait
	clearMsg
	"""
	あとは クイックマンに
	きばくプログラムを バクダンまで
	おくらせるだけ、
	"""
	keyWait
	clearMsg
	"""
	じしんが あるなら ボクの PETに
	プラグイン してもいいけど、
	ムダだろうね
	"""
	keyWait
	clearMsg
	"""
	だれも ボクと クイックマンを
	とめられやしないんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そんなの やってみなきゃ わかんない!"
	keyWait
	clearMsg
	"""
	みんなのために オレは たたかう!
	ロックマン! いくぜ!!
	"""
	keyWait
	flagSet
		flag = 646
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"おねえちゃーん ドコー?"
	keyWait
	end
}
script 30 mmbn2 {
	checkChapter
		lower = 31
		upper = 31
		jumpIfInRange = 47
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 30
		jumpIfInRange = 44
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 26
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 23
		jumpIfInRange = 38
		jumpIfOutOfRange = continue
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 34
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	カブトムシ、いないな~
	やっぱり よるに きたほうが
	たくさんいるのかな?
	"""
	keyWait
	end
}
script 31 mmbn2 {
	checkChapter
		lower = 31
		upper = 31
		jumpIfInRange = 48
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 30
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 24
		upper = 26
		jumpIfInRange = 42
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 23
		jumpIfInRange = 39
		jumpIfOutOfRange = continue
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"けっこうサカナが いるんだね"
	keyWait
	clearMsg
	"""
	2、3びきつかまえて
	こんやの オカズにするかね
	"""
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"いた! カブトムシ!"
	keyWait
	clearMsg
	"""
	やった~、これで みんなに
	じまん できるぞ
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"サカナが、ぜんぜん つかまらないよ"
	keyWait
	clearMsg
	"""
	やっぱり、みえてるサカナは
	とれないって いうのはホントだね
	"""
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	まちじゃ、そんなタイヘンなコトに
	なってたの!?
	"""
	keyWait
	clearMsg
	"""
	キャンプに きてるから
	ぜんぜん しらなかったよ!
	"""
	keyWait
	clearMsg
	"みんな だいじょうぶかな?"
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	きょうこそは、おおものを
	とってかえるわよ~!
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	じけんが、おさまるまで
	しばらく ここでキャンプせいかつを
	するコトに したんだ
	"""
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	もう ちょっとで つかまえられたのにね!
	こんどこそは、しっぱいしないよ!
	"""
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	だいぶ、キャンプせいかつにも
	なれてきたよ
	"""
	keyWait
	clearMsg
	"""
	けっこう ふべんなコトも
	おおいけど、わりとたのしいよ
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	サカナをつかまえるコツを
	さとったんだよ!
	さぁ、つかまえるよ~!
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	ネットワークしゃかいの ききも
	ここでは、そんなに えいきょうないから
	あんしんできるよ
	"""
	keyWait
	clearMsg
	"ずっと、ここに いたいきぶんだよ"
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	きょうは、たいりょうだね!
	おもしろいように サカナが
	とれるよ!!
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	わずらわしい、とかいの ざっとうを
	わすれるには、
	"""
	keyWait
	clearMsg
	"""
	こうやって もりのなかを
	ひとりで あるくのに かぎるわ
	"""
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	この キャンプびよりに
	こんなに ひとけが ないなんて
	じしんの えいきょうかな?
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 258
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 257
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 257
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ねぇ、おにいちゃん!
	「
	"""
	printChip
		buffer = 0
		chip = 153
	" "
	printCode
		buffer = 0
		code = *
	"""
	」っていうチップを
	もっていな~い?
	"""
	keyWait
	clearMsg
	"""
	もってたら ボクの
	「
	"""
	printChip
		buffer = 0
		chip = 138
	" "
	printCode
		buffer = 0
		code = N
	"""
	」と、
	こうかんしてほしいんだ~
	"""
	keyWait
	clearMsg
	"こうかん してくれる?\n"
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
	"ちぇっ! つまんないの!"
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 153
		code = *
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 258
	itemTakeChip
		chip = 153
		code = *
		amount = 1
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	え? こうかんしてくれるの?
	うわ~い!! みんなに じまんしよ!
	"""
	keyWait
	clearMsg
	"じゃ、ボクのチップと こうかんだね!"
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
		chip = 138
		code = N
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 138
	" "
	printCode
		buffer = 0
		code = N
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	clearMsg
	jump
		target = 196
}
script 193 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ありがとう おにいちゃん!
	ほしかったんだ~ このチップ!
	"""
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"こんにちは、おにいちゃん!"
	keyWait
	clearMsg
	"おにいちゃんの「"
	printChip
		buffer = 0
		chip = 153
	" "
	printCode
		buffer = 0
		code = *
	"""
	」と
	ボクの「
	"""
	printChip
		buffer = 0
		chip = 138
	" "
	printCode
		buffer = 0
		code = N
	"""
	」を
	こうかんしておくれよ
	"""
	keyWait
	clearMsg
	"ねえ、いいでしょ?"
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
	こうかんして こうかんして
	こうかんして~!!
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"おにいちゃん、「"
	printChip
		buffer = 0
		chip = 153
	" "
	printCode
		buffer = 0
		code = *
	"""
	」が
	みつかんないんだけど、
	"""
	keyWait
	clearMsg
	"""
	もしかして、フォルダのなかに
	はいってない?
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
script 196 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	わ~い やった~!
	おれいに コレも あげちゃう!
	"""
	keyWait
	clearMsg
	jump
		target = 197
}
script 197 mmbn2 {
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
	playerFinish
	playerUnlock
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 16
		upper = 72
		jumpIfInRange = 238
		jumpIfOutOfRange = continue
	checkFlag
		flag = 621
		jumpIfTrue = continue
		jumpIfFalse = 225
	checkFlag
		flag = 624
		jumpIfTrue = 238
		jumpIfFalse = continue
	checkItem
		item = 9
		amount = 1
		jumpIfEqual = 238
		jumpIfGreater = 238
		jumpIfLess = 226
	end
}
script 221 mmbn2 {
	checkFlag
		flag = 167
		jumpIfTrue = 236
		jumpIfFalse = continue
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
	checkChapter
		lower = 16
		upper = 72
		jumpIfInRange = 239
		jumpIfOutOfRange = continue
	checkFlag
		flag = 621
		jumpIfTrue = continue
		jumpIfFalse = 228
	checkFlag
		flag = 624
		jumpIfTrue = 239
		jumpIfFalse = continue
	checkItem
		item = 8
		amount = 1
		jumpIfEqual = 239
		jumpIfGreater = 239
		jumpIfLess = 229
	end
}
script 224 mmbn2 {
	checkChapter
		lower = 16
		upper = 72
		jumpIfInRange = 240
		jumpIfOutOfRange = continue
	checkFlag
		flag = 621
		jumpIfTrue = continue
		jumpIfFalse = 231
	checkFlag
		flag = 624
		jumpIfTrue = 240
		jumpIfFalse = continue
	checkItem
		item = 7
		amount = 1
		jumpIfEqual = 240
		jumpIfGreater = 240
		jumpIfLess = 232
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	あしばが ないので
	この先には すすめそうにない・・・
	"""
	keyWait
	clearMsg
	"""
	よく見ると、イシに ぼうきれが
	ひっかかっている・・・
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	あしばが ないので
	この先には すすめそうにない・・・
	"""
	keyWait
	clearMsg
	"""
	よく見ると、イシに ぼうきれが
	ひっかかっている・・・
	"""
	keyWait
	clearMsg
	"ひろいますか?\n"
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
			jump = 227,
			jump = continue,
			jump = continue
		]
	end
}
script 227 mmbn2 {
	msgOpen
	playerAnimate
		animation = 24
	itemGive
		item = 9
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 9
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
script 228 mmbn2 {
	msgOpen
	"""
	いろんな 大きさのイシが
	ゴロゴロと ころがっている・・・
	"""
	keyWait
	clearMsg
	"""
	よく見ると、イシとイシの すきまに
	ライターが はさまっている・・・
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"""
	いろんな 大きさのイシが
	ゴロゴロと ころがっている・・・
	"""
	keyWait
	clearMsg
	"""
	よく見ると、イシとイシの すきまに
	ライターが はさまっている・・・
	"""
	keyWait
	clearMsg
	"ひろいますか?\n"
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
			jump = 230,
			jump = continue,
			jump = continue
		]
	end
}
script 230 mmbn2 {
	msgOpen
	playerAnimate
		animation = 24
	itemGive
		item = 8
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 8
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
script 231 mmbn2 {
	msgOpen
	"セの高い スギの木だ・・・"
	keyWait
	clearMsg
	"""
	よく見ると、えだに
	しんぶんしが まきついている・・・
	"""
	keyWait
	end
}
script 232 mmbn2 {
	msgOpen
	"セの高い スギの木だ・・・"
	keyWait
	clearMsg
	"""
	よく見ると、えだに
	しんぶんしが まきついている・・・
	"""
	keyWait
	clearMsg
	"とりますか?\n"
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
			jump = 233,
			jump = continue,
			jump = continue
		]
	end
}
script 233 mmbn2 {
	msgOpen
	playerAnimate
		animation = 24
	itemGive
		item = 7
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 7
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
script 234 mmbn2 {
	checkItem
		item = 7
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 235
	checkItem
		item = 8
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 235
	checkItem
		item = 9
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 235
	flagSet
		flag = 622
	end
}
script 235 mmbn2 {
	flagSet
		flag = 621
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 263
	"ブ~~~~~~~ン!!!"
	wait
		frames = 60
	keyWait
	clearMsg
	soundEnableTextSFX
	"""
	たくさんの 大きなハチが
	とびかっている!!
	とても とおりぬけられそうにない・・・
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Mayl
	msgOpen
	"どうしよう・・・"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	・・・て いっても
	キャンプじょうに 行くみちは
	ここしか ないわよ
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	おい熱斗! たいちょうの メイレイだ!
	おまえ なんとか しろよな!!
	"""
	keyWait
	end
}
script 236 mmbn2 {
	flagSet
		flag = 168
	flagClear
		flag = 167
	mugshotHide
	msgOpen
	"""
	なにか、クロくて大きな ムシが
	およいでいる・・・
	"""
	keyWait
	clearMsg
	"「デンサン オオゲンゴロウ」だ!"
	keyWait
	clearMsg
	jump
		target = 237
}
script 237 mmbn2 {
	mugshotHide
	msgOpen
	playerAnimate
		animation = 24
	itemGive
		item = 53
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 53
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	end
}
script 238 mmbn2 {
	msgOpen
	"""
	あしばが ないので
	この先には すすめそうにない・・・
	"""
	keyWait
	end
}
script 239 mmbn2 {
	msgOpen
	"""
	いろんな 大きさのイシが
	ゴロゴロと ころがっている・・・
	"""
	keyWait
	end
}
script 240 mmbn2 {
	msgOpen
	"セの高い スギの木だ・・・"
	keyWait
	end
}
