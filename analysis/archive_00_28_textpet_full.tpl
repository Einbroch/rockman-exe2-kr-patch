@archive 075A118
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ひこうき あれだけ のって
	まだ のりたりないの?
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	ウェルカム!! ヨーコソ!!
	アメロッパへーーーーー!!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	なにを いわれてるのか
	さっぱり わかんないよ・・・
	"""
	keyWait
	clearMsg
	"バカに されてたり しないだろうな"
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 48
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	checkFlag
		flag = 571
		jumpIfTrue = 4
		jumpIfFalse = continue
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	mugshotAnimate
		animation = 2
	"@♥♪←↓→↑?"
	mugshotAnimate
		animation = 0
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	なにか おこまりですか?
	おてつだい しますよ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkFlag
		flag = 571
		jumpIfTrue = 6
		jumpIfFalse = continue
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	mugshotAnimate
		animation = 2
	"@♥♪←↓→↑!!"
	mugshotAnimate
		animation = 0
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	あ~ つかれた!!
	やっと かえってきたわ~~~~~!!
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	う~~ん・・・
	ハ、ハラが・・・
	"""
	keyWait
	clearMsg
	"""
	いてててててて!
	あたたたたたたたた!
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	パパ ぽんぽん いたいの?
	だいじょうぶ?
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	いたいの いたいの とんでけ~
	パパ、なおった?
	"""
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	パパ、だいじょうぶ!?
	もうすぐ ひこうきでちゃうよ!
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	あそこの、おやこづれの
	おとうさんが、きゅうに
	おナカが いたいって いいだしたから
	"""
	keyWait
	clearMsg
	"""
	ワタシ さっき、きゅうきゅうしゃ
	よんじゃったよ
	"""
	keyWait
	end
}
script 25 mmbn2 {
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ここが、ひこうきの
	とうじょうぐちに なります
	"""
	keyWait
	clearMsg
	"""
	かいてきな そらのたびを
	おたのしみ ください
	"""
	keyWait
	end
}
script 26 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 57
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 31
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	このたびは、アメロッパエアラインを
	ごりよういただき、
	まことに ありがとうございます
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = GaussMagnus
	msgOpen
	"""
	さ、そろそろ ひこうきに
	のりこむとするか・・・
	"""
	keyWait
	end
}
script 29 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 58
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 49
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 36
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	ここは アメロッパの めんぜいてん、
	デューティフリーショップだよ
	"""
	keyWait
	clearMsg
	"""
	なんたって
	アメロッパは ブランドの メッカだからね
	プライドかけて いいしな そろえてるよ
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"ウーン、おきゃくがすくない・・・"
	keyWait
	clearMsg
	"""
	せかいかくちで おこっている、
	てんぺんちいの おかげで、
	みんな りょこうどころじゃ ないのかな?
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	いつまで、この じょうきょうが
	つづくのかしら・・・
	"""
	keyWait
	clearMsg
	"""
	ながく つづくと、かいしゃが
	トウサンしちゃうわ・・・
	"""
	keyWait
	end
}
script 32 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	アメロッパは、キケンだから
	どこか がいこくに いこうと
	おもったんだけど、
	"""
	keyWait
	clearMsg
	"""
	どこも かしこも、さいがいが
	おこっているのよね・・・
	"""
	keyWait
	clearMsg
	"キャンセルしようかしら・・・"
	keyWait
	end
}
script 33 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 46
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	う~ん・・・こまったな・・・
	このまま、アメロッパにいるべきか
	それとも ニホンにかえるべきか・・・
	"""
	keyWait
	clearMsg
	"どうしようか・・・"
	keyWait
	end
}
script 34 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 47
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 42
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	オー! オレの ねりにねった
	「じぶんさがしの たび」プランが、
	メチャクチャね!!
	"""
	keyWait
	clearMsg
	"""
	こんな じょうきょうじゃ、
	ドコにもいけないよ!!
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	やっぱり、カンコウキャクが
	すくないデース
	"""
	keyWait
	clearMsg
	"""
	テンペンチイの あおりを
	モロにくらってマース!!
	"""
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"しょうばい あがったりだね"
	keyWait
	clearMsg
	"""
	ま、
	いいときが あれば わるいときも ある
	それが しょうばい ってもんさ
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	こんかいの チケット、
	キャンセルしちゃった・・・
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ここは、アメロッパに とどまって
	ようすを みよう・・・
	"""
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	しかたないね! あらたなる
	「じぶんさがしの たび」プランを
	たてるね!!
	"""
	keyWait
	clearMsg
	"いつでも ポジティブシンキングね!"
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	さいがいは、おさまった みたいだから
	ウチに かえろうかしら
	"""
	keyWait
	clearMsg
	"くうこうまできて、ソンしちゃったわ"
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	いがいと、はやく おさまったようだ
	アメロッパにとどまったのは、
	セイカイだったな・・・
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ニュー「じぶんさがしの たび」プランで
	じぶんを さがしに、いってくるぜ!!
	"""
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"ウエルカム!! ウエルカム!!"
	keyWait
	clearMsg
	"""
	テンペンチイも おさまったので
	おきゃくさんも、きっとふえるデース!
	"""
	keyWait
	end
}
script 49 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	ここは アメロッパの めんぜいてん、
	デューティフリーショップだよ
	"""
	keyWait
	clearMsg
	"""
	え? カンバンには
	タックスフリーって かいてあるって?
	"""
	keyWait
	clearMsg
	"""
	おなじいみ だから いいのさ
	こどもが こまかいこと
	気にする ものじゃないよ
	"""
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"ヨウコソ! アメロッパへ!"
	keyWait
	clearMsg
	"なんで そんなに あかるいのかって?"
	keyWait
	clearMsg
	"""
	こんなときに わざわざ
	とおいところから やってきた
	おきゃくさま ですもの・・・ね?
	"""
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"ふぅ~・・・"
	waitSkip
		frames = 20
	"""
	なんとか
	ぶじに アメロッパに ついたか・・・
	"""
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	また
	エアポートが ガランと しちゃったね
	"""
	keyWait
	clearMsg
	"""
	まあ レットイットビーね
	なるように なるさの スピリッツね
	"""
	keyWait
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	しょうしょう
	きゃくが いなくったってさ、
	"""
	keyWait
	clearMsg
	"""
	ボーイに ムリなかいものを すすめるほど
	わたしゃ おちぶれちゃいないよ
	"""
	keyWait
	clearMsg
	"""
	それが アメロッパおんなの
	プライド ってヤツさ
	"""
	keyWait
	end
}
script 59 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	いかに おきゃくさまに あんしんして
	そらのたびを おたのしみ いただくか、
	"""
	keyWait
	clearMsg
	"""
	こんなときこそ、
	キャビンアテンダントの プロとして
	いいしごとを しなくっちゃね!
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 272
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 271
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 271
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	アタシは、こうみえても
	アメロッパこくせき なのよ
	"""
	keyWait
	clearMsg
	"""
	パパがね、アメロッパじんなの
	1ねんまえに、ニホンから
	こっちにきたの
	"""
	keyWait
	clearMsg
	"""
	で、こんど ニホンから
	ボーイフレンドが あそびにくるんだけど
	"""
	keyWait
	clearMsg
	"""
	はなれてくらしている カレのハートを
	ガッチリ つかまえておくために
	なにか プレゼントをしたいのよ
	"""
	keyWait
	clearMsg
	"""
	それで、チップを プレゼントしようかな
	なんて かんがえてるワケ
	"""
	keyWait
	clearMsg
	"カレ、「"
	printChip
		buffer = 0
		chip = 165
	" "
	printCode
		buffer = 0
		code = A
	"""
	」、
	「
	"""
	printChip
		buffer = 0
		chip = 166
	" "
	printCode
		buffer = 0
		code = R
	"」と、"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 167
	" "
	printCode
		buffer = 0
		code = S
	"""
	」、
	「
	"""
	printChip
		buffer = 0
		chip = 168
	" "
	printCode
		buffer = 0
		code = L
	"""
	」、ってチップを
	まえから ほしがってたんだけど、
	"""
	keyWait
	clearMsg
	"どこにも ないのよ"
	keyWait
	clearMsg
	"""
	アナタ、もし もってたら ワタシに
	ゆずってくれない?
	"""
	keyWait
	clearMsg
	"""
	ワタシのもってる、
	「
	"""
	printChip
		buffer = 0
		chip = 162
	" "
	printCode
		buffer = 0
		code = N
	"""
	」と
	こうかんして あげるわよ
	"""
	keyWait
	clearMsg
	"どうかしら?\n"
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
	おねがいだから、きょうりょくしてよ
	ね! おねがい!
	"""
	keyWait
	clearMsg
	"えんきょりれんあいは、ツラいのよ~"
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 165
		code = A
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	checkPackChipCode
		chip = 166
		code = R
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	checkPackChipCode
		chip = 167
		code = S
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	checkPackChipCode
		chip = 168
		code = L
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 272
	itemTakeChip
		chip = 165
		code = A
		amount = 1
	itemTakeChip
		chip = 166
		code = R
		amount = 1
	itemTakeChip
		chip = 167
		code = S
		amount = 1
	itemTakeChip
		chip = 168
		code = L
		amount = 1
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	こうかんしてくれるの? ワオ!
	うれしいわ!
	"""
	keyWait
	clearMsg
	"""
	カレも、きっと よろこんでくれると
	おもうわ!
	"""
	keyWait
	clearMsg
	"""
	そして、ワタシたちの
	あいも、ふかまるってものよ!
	"""
	keyWait
	clearMsg
	"""
	あ、コレと こうかんだったわね
	わすれるトコロだったわ
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
		chip = 162
		code = N
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 162
	" "
	printCode
		buffer = 0
		code = N
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
		mugshot = Girl
	msgOpen
	"""
	あなたに、もらったチップで
	あいの ほのおが、もえさかるわ!
	ラヴボルテージ、MAXよ!!
	"""
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	あ、アナタは!
	やっぱり、ワタシに きょうりょく
	してくれるのね!?
	"""
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 165
	" "
	printCode
		buffer = 0
		code = A
	"""
	」、
	「
	"""
	printChip
		buffer = 0
		chip = 166
	" "
	printCode
		buffer = 0
		code = R
	"」と、"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 167
	" "
	printCode
		buffer = 0
		code = S
	"""
	」、
	「
	"""
	printChip
		buffer = 0
		chip = 168
	" "
	printCode
		buffer = 0
		code = L
	"""
	」を、
	もってきてくれたの?
	"""
	keyWait
	clearMsg
	"ワタシの「"
	printChip
		buffer = 0
		chip = 162
	" "
	printCode
		buffer = 0
		code = N
	"""
	」は、
	いつでも、こうかんできるわよ!
	"""
	keyWait
	clearMsg
	"さ、こうかんして~!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"どうぞ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"やめた"
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
	おねがいだから、きょうりょくしてよ
	ね! おねがい!
	"""
	keyWait
	clearMsg
	"フラれたら、アナタのせいだからね!!"
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"ねぇ、「"
	printChip
		buffer = 0
		chip = 165
	" "
	printCode
		buffer = 0
		code = A
	"""
	」、
	「
	"""
	printChip
		buffer = 0
		chip = 166
	" "
	printCode
		buffer = 0
		code = R
	"」と、"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 167
	" "
	printCode
		buffer = 0
		code = S
	"""
	」、
	「
	"""
	printChip
		buffer = 0
		chip = 168
	" "
	printCode
		buffer = 0
		code = L
	"""
	」が、
	ないみたいなんだけど・・・
	"""
	keyWait
	clearMsg
	"まさか、ワタシをからかったワケ?"
	keyWait
	clearMsg
	"""
	ヒドイ!
	じゅんすいな オトメゴコロを
	もてあそんだのね!
	"""
	keyWait
	clearMsg
	"""
	あ、もしかしたら
	フォルダのなかにはいってない!?
	"""
	keyWait
	clearMsg
	"さがしてみてよ! そっこうで!"
	keyWait
	clearMsg
	"""
	みつかったら、リュックにいれて
	またきてよね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ショウケースだ・・・
	コンピュータで しょうひんかんりを
	しているようだ・・・
	"""
	keyWait
	clearMsg
	"プラグインできそうだ!"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	ニホンで 大にんきブランドの
	ハンドバッグが なんと、このおねだん!!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"えはがきスタンドだ"
	keyWait
	clearMsg
	checkFlag
		flag = 322
		jumpIfTrue = continue
		jumpIfFalse = 230
	jump
		target = 231
	end
}
script 223 mmbn2 {
	msgOpen
	"ここからニホンへかえれる"
	keyWait
	clearMsg
	"うそ!"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	ここから アメロッパタウンには
	行けない
	"""
	keyWait
	end
}
script 230 mmbn2 {
	flagSet
		flag = 322
	msgOpen
	"""
	えはがきの あいだに
	なにかが おちている
	"""
	textSpeed
		delay = 10
	"・・・"
	textSpeed
		delay = 2
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
script 231 mmbn2s {
	end
}
