@archive 0763EA8
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 67
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 18
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 12
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	やっぱり、ファーストクラスは
	きぶんいいYO!
	"""
	keyWait
	clearMsg
	"""
	オレはYO!
	なんだってYO!
	イチバンが すきなんだYO!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 68
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 19
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 13
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"ワタシは、たびが だいすきでね"
	keyWait
	clearMsg
	"""
	むかしは、じいさんと いっしょに
	せかいじゅうを たびして
	まわったんだが
	"""
	keyWait
	clearMsg
	"いまじゃ、ひとりたびだよ・・・"
	keyWait
	clearMsg
	"""
	カネは あるんだけど、
	さみしさは、まぎれないからね
	"""
	keyWait
	end
}
script 10 mmbn2 {
	checkFlag
		flag = 528
		jumpIfTrue = 11
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = Entomologist
	"""
	いやはや、なんともすばらしいな・・・
	ワタシも、ファーストクラスに
	のってみたいものだ
	"""
	keyWait
	clearMsg
	"""
	でも、ニホンこんちゅうがっかい には、
	そんなに おカネないしなあ
	"""
	keyWait
	flagSet
		flag = 528
	end
}
script 11 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = Entomologist
	"""
	ワタシは、アメロッパでひらかれた
	「せかい こんちゅうシンポジウム」に
	しゅっせきしてきたんだよ
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	さすが、ファーストクラス
	なんでも そろってるYO!
	"""
	keyWait
	clearMsg
	"""
	とびっきりの ざせきに、
	こうきゅうウイスキー
	"""
	keyWait
	clearMsg
	"""
	あとは、ピチピチのギャルでも
	いれば、もんくなしなんだけどYO!
	"""
	keyWait
	clearMsg
	"""
	っていうかYO!
	その おっさんは、ダレなんだYO?
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	さっきの ゆれは、ひどかったねえ
	ぼうや、ケガはなかったかい?
	"""
	keyWait
	clearMsg
	"""
	ところで、ワタシのまえに
	すわっているヒト
	"""
	keyWait
	clearMsg
	"""
	ずいぶん、にぎやかだけど、
	ナニものなんだろうね?
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	のりごこちは、サイコーだけどYO!
	しずかすぎるのは、いただけないYO!
	"""
	keyWait
	clearMsg
	"""
	もっとアツい ミュージックを
	かけてほしいYO!
	"""
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"ぼうやは、ニホンにいくのかい?"
	keyWait
	clearMsg
	"""
	ニホンは、いいねぇ
	まいとし、いっているよ
	"""
	keyWait
	clearMsg
	"""
	そのうち べっそうでも
	たてようかと おもっているんだ
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	たいくつだから、ウタでもうたうか
	YO、YO、YO、YO!
	"""
	keyWait
	clearMsg
	"""
	ララララ~ハァハーン
	ププッピ~ドゥ~
	"""
	keyWait
	clearMsg
	"ハァ~!!"
	keyWait
	clearMsg
	"""
	さぁ、キミもいっしょに!
	YO! YO! YO!
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	まえのオトコ、さわがしいだけかと
	おもったら、けっこう イイこえ
	してるじゃないかい
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	まえのオトコの ウタを きいていると
	なんだか、たのしいきぶんに
	なってきたYO!
	"""
	keyWait
	clearMsg
	"アラやだ! うつっちゃった?"
	keyWait
	end
}
script 41 mmbn2 {
	checkItem
		item = 32
		amount = 1
		jumpIfEqual = 53
		jumpIfGreater = 53
		jumpIfLess = continue
	checkFlag
		flag = 543
		jumpIfTrue = 52
		jumpIfFalse = continue
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"""
	HEY YO!
	YO! ボーイ! どうしたんだYO!
	"""
	keyWait
	clearMsg
	"""
	なんだってYO?
	その こうきゅうウイスキーを
	わけてくれってYO?
	"""
	keyWait
	clearMsg
	"""
	HEY、HEY ユーのトシじゃあ、
	まだ ママの おっぱいのほうが
	おにあいだぜ YO!
	"""
	keyWait
	clearMsg
	"""
	ん?
	どうしても ひつようだって?
	"""
	keyWait
	clearMsg
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
	"""
	・
	OK、OK わかった、わかった
	"""
	keyWait
	clearMsg
	"""
	どうしても、ひつようってんなら
	しかたねえ
	"""
	keyWait
	clearMsg
	"""
	でも、タダってわけには いかねえ
	じょうけんが ひとつある
	"""
	keyWait
	clearMsg
	"""
	ユーの ソウルをみせてくれ
	ソウル、たましい、じょうねつだYO
	"""
	keyWait
	clearMsg
	"""
	これから、オレが うたう うたを
	そのまま、まねすればいい!
	"""
	keyWait
	clearMsg
	"""
	まちがえずに うたいきれたら
	ウイスキーを わけてやるYO!
	"""
	keyWait
	clearMsg
	"チャレンジするかい?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"するYO! "
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
			jump = 44,
			jump = 43,
			jump = continue
		]
}
script 42 mmbn2 {
	flagSet
		flag = 543
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"ユーのソウルは、そんなもんかYO?"
	keyWait
	clearMsg
	"""
	オレにソウルをみせてみろ!
	チャレンジするかYO?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"するYO! "
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
			jump = 44,
			jump = 43,
			jump = continue
		]
}
script 43 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"まだまだ ボーイだな"
	keyWait
	end
}
script 44 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"それじゃ いくぜ!!"
	keyWait
	clearMsg
	"1・"
	waitSkip
		frames = 20
	"2・"
	waitSkip
		frames = 20
	"123 YO!"
	keyWait
	clearMsg
	"""
	ときめきボンバー! あいにひをつけろ!
	きらめきハリケーン じょうりくすんぜん
	キミのひとみに、オレは むねキュン!
	"""
	keyWait
	clearMsg
	"""
	もえろ! もえろ! ラブファイヤー!
	カミングスーーーーン YO!
	"""
	keyWait
	clearMsg
	"ちゃんとおぼえたかい?"
	keyWait
	clearMsg
	"それじゃ、こんどはボーイのばんだ!"
	keyWait
	clearMsg
	"1・"
	waitSkip
		frames = 20
	"2・"
	waitSkip
		frames = 20
	"123 YO!"
	keyWait
	clearMsg
	jump
		target = 45
}
script 45 mmbn2 {
	msgOpen
	mugshotHide
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"ときめきガンバー! あいにきをつけろ!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ときめきボンバー! あいにひをつけろ!\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ときめきバンボー! あねにめをつけろ!"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 42,
			jump = 46,
			jump = 42,
			jump = continue
		]
}
script 46 mmbn2 {
	msgOpen
	mugshotHide
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"きらめきハリケーン じょうりくすんぜん\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"きらめきバリケード はれつすんぜん!\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"きらきらハリケーン つうかすんぜん!"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 47,
			jump = 42,
			jump = 42,
			jump = continue
		]
}
script 47 mmbn2 {
	msgOpen
	mugshotHide
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"キミのひがみに、オレは ドキュン!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"キミのひとみに、オレが むねキュン!\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"キミのひとみに、オレは むねキュン!"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 42,
			jump = 42,
			jump = 48,
			jump = continue
		]
}
script 48 mmbn2 {
	msgOpen
	mugshotHide
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"きえろ! きえろ! メテファイヤー!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"もえる! もえる! ラヴファイヤー!\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"もえろ! もえろ! ラブファイヤー!"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 42,
			jump = 42,
			jump = 49,
			jump = continue
		]
}
script 49 mmbn2 {
	msgOpen
	mugshotHide
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"カミングスーーーーン YO!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"カミングスーーーーン YA!\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"カミンシツーーーーン WOW!"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 50,
			jump = 42,
			jump = 42,
			jump = continue
		]
}
script 50 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"""
	OK! いいパッションだったぜ!
	ひさびさに、オレもあつくなれたぜ!
	じゃあ、コレわけてやるYO!!
	"""
	keyWait
	clearMsg
	jump
		target = 51
}
script 51 mmbn2 {
	msgOpen
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 32
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 32
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
script 52 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"お? もういちど トライするのか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"もちろんだYO! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いや\n"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 44,
			jump = 43,
			jump = continue
		]
}
script 53 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"ボーイ、しょうらい ゆうぼうだYO!"
	keyWait
	end
}
script 60 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"""
	YOYOYOYOYOYO!
	YOYOYOYOYO!
	"""
	keyWait
	clearMsg
	"ターイヘーンだYO!"
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	おおカミよ
	われらを おまもりください
	"""
	keyWait
	end
}
script 67 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = BlackMan
	"ヘイ! ボーイ!"
	keyWait
	clearMsg
	"""
	どうやら オレたち たすかったんだな
	HAHA!!
	"""
	keyWait
	clearMsg
	"ミラクルだぜ!!"
	keyWait
	end
}
script 68 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	かみが われらを、すくいたもうた
	かみよかんしゃします・・・
	"""
	keyWait
	end
}
script 70 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 85
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	こんな、大じしんが おきてるときに
	いうことでもないと おもうけど、
	"""
	keyWait
	clearMsg
	"""
	いちどで いいから、ファーストクラスで
	りょこうに 行きたいねえ
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	みんな ひなんしているってときに
	アタシは、ファーストクラスに
	いるだなんて、
	"""
	keyWait
	clearMsg
	"ワルいコト してるみたいだね"
	keyWait
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	アタシゃきめたよ!! ぜったい
	ファーストクラスで りょこうに
	いくってね!!
	"""
	keyWait
	end
}
script 95 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ワタシたち
	コトブキ町の ごうかマンションに
	すんでたんだけど、
	"""
	keyWait
	clearMsg
	"""
	きのうから アタマが いたくなって
	にげてきたの・・・
	"""
	keyWait
	clearMsg
	"""
	ここは
	ウチと おなじくらい ごうかだし
	いいぐあい なのよね
	"""
	keyWait
	end
}
script 96 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"マーマ! マーマ!"
	keyWait
	end
}
script 97 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ゴハン 出ないの~"
	keyWait
	end
}
script 98 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"オウチかえりた~い"
	keyWait
	end
}
script 99 mmbn2 {
	mugshotShow
		mugshot = FlightAttendant
	msgOpen
	"""
	ふだんなら
	おひきとり いただくんだけど、
	じじょうが じじょう だからなぁ・・・
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 276
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 275
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 275
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	や! ニホンって
	とっても いいトコロだね!
	"""
	keyWait
	clearMsg
	"""
	オイラ もうすぐ、アメロッパに
	かえるんだ・・・
	"""
	keyWait
	clearMsg
	"""
	クニでまってる おとうとに
	ニホンのチップを おみやげに
	もってかえろうと おもうんだけど
	"""
	keyWait
	clearMsg
	"ほしいチップが てに はいらないんだ"
	keyWait
	clearMsg
	"キミ、「"
	printChip
		buffer = 0
		chip = 212
	" "
	printCode
		buffer = 0
		code = S
	"""
	」
	「
	"""
	printChip
		buffer = 0
		chip = 213
	" "
	printCode
		buffer = 0
		code = S
	"""
	」
	「
	"""
	printChip
		buffer = 0
		chip = 214
	" "
	printCode
		buffer = 0
		code = S
	"」を、もってない?"
	keyWait
	clearMsg
	"""
	もし、よかったら
	オイラのもってる「
	"""
	printChip
		buffer = 0
		chip = 184
	" "
	printCode
		buffer = 0
		code = S
	"""
	」と
	こうかんしてくれない?
	"""
	keyWait
	clearMsg
	"おとうとの ためなんだ たのむよ\n"
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
	"なんとか ならないかな?"
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 212
		code = S
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	checkPackChipCode
		chip = 213
		code = S
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	checkPackChipCode
		chip = 214
		code = S
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 276
	itemTakeChip
		chip = 212
		code = S
		amount = 1
	itemTakeChip
		chip = 213
		code = S
		amount = 1
	itemTakeChip
		chip = 214
		code = S
		amount = 1
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	か~! ありがとう!!
	これで、ムネをはって
	かえることができるよ
	"""
	keyWait
	clearMsg
	"""
	じつは、ニホンにくるとき、
	おとうと と、おおゲンカして
	でてきたんだ
	"""
	keyWait
	clearMsg
	"""
	このチップで なかなおり
	できるかな
	"""
	keyWait
	clearMsg
	"コレ、うけとってよ"
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
		chip = 184
		code = S
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 184
	" "
	printCode
		buffer = 0
		code = S
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
		mugshot = BlackKid
	msgOpen
	"""
	キミにもらった チップは、
	ニホンでの いいおもいでに
	なるとおもうよ
	"""
	keyWait
	clearMsg
	"ありがとう"
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	やっぱり きてくれた
	キミは、きっと きてくれると
	おもってたよ
	"""
	keyWait
	clearMsg
	"キミの「"
	printChip
		buffer = 0
		chip = 212
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
		chip = 213
	" "
	printCode
		buffer = 0
		code = S
	"""
	」
	「
	"""
	printChip
		buffer = 0
		chip = 214
	" "
	printCode
		buffer = 0
		code = S
	"」と、"
	keyWait
	clearMsg
	"オイラの「"
	printChip
		buffer = 0
		chip = 184
	" "
	printCode
		buffer = 0
		code = S
	"""
	」を
	こうかんしに きてくれたのかい?
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
	"うん "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちがうよ"
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
	そんなコト いってるけど、
	キミは、また きてくれるはずさ
	"""
	keyWait
	clearMsg
	"""
	だって、やさしそうなカオ
	してるからね
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"「"
	printChip
		buffer = 0
		chip = 212
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
		chip = 213
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
		chip = 214
	" "
	printCode
		buffer = 0
		code = S
	"」がないよ、"
	keyWait
	clearMsg
	"これじゃあ、こうかんできないな"
	keyWait
	clearMsg
	"""
	もしかして、フォルダのなかに
	はいってたり しないかい?
	"""
	keyWait
	clearMsg
	"いちど、みておくれよ"
	keyWait
	clearMsg
	"""
	もしフォルダのなかにあったら、
	リュックに、いれておいてね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	なんとも、スゴイざせきだ
	ゴージャスのひとことにつきる
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	みためには、わからないが
	さいしんきしゅの テレビだ
	"""
	keyWait
	clearMsg
	"""
	プラグインは できないように
	されている
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	カーテンがしまっていて
	はいることができない
	"""
	keyWait
	clearMsg
	"""
	ファーストクラスのカーテンは
	こころなしか、よいきじをつかっている
	ようにみえる
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ぞうか などではない
	ホンモノのはなが、いけてある
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"あまい かおりがただよってくる"
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ふじんむけの ファッションざっしだ
	さいしんのりゅうこうが、
	てにとるように わかる
	"""
	keyWait
	clearMsg
	"""
	「ことしのあきは、クロでキマリ」
	だ、そうだ
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	さいしんの ミュージックシーンが
	はあくできる おんがくざっしだ
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	いっぽん いくらになるか
	わからないほどの こうきゅうワインだ
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	みるからに、アルコールのつよそうな
	さいこうきゅう ウイスキーだ
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"そとへ でるときにつかうトビラだ"
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"""
	エアコンなどの ちょうせいを
	するタメのコントロールパネルだ
	"""
	keyWait
	clearMsg
	"プラグインは できない"
	keyWait
	end
}
script 231 mmbn2 {
	checkChapter
		lower = 55
		upper = 255
		jumpIfInRange = 233
		jumpIfOutOfRange = continue
	msgOpen
	"""
	まどのそとには、
	うつくしい あおぞらが
	ひろがっている
	"""
	keyWait
	end
}
script 233 mmbn2 {
	msgOpen
	"""
	くうこうのようすが みえる
	たくさんのひこうきが ならんでいる
	"""
	keyWait
	end
}
