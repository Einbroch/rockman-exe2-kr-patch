@archive 07569A4
@size 255

script 0 mmbn2 {
	checkFlag
		flag = 516
		jumpIfTrue = 4
		jumpIfFalse = continue
	flagSet
		flag = 516
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ひとりで がいこく 行くなんて・・・"
	waitSkip
		frames = 30
	"\nしんぱいだから 見おくりに きたの"
	keyWait
	clearMsg
	"ねぇ 熱斗、コレ もっていってよ"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 195
		code = R
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 195
	" "
	printCode
		buffer = 0
		code = R
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 24
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 24
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
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	・・・って チップは わかるけどさ、
	コッチは なんだ?
	こんなもん なんに つかうんだよ?
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"そんな いいかた しないでよ!"
	keyWait
	clearMsg
	"""
	わたしだって よくわかんないけど
	うらない 見てたら これが
	熱斗の ラッキーアイテム だったの!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗の バカ!!"
	waitSkip
		frames = 30
	"\n・・・でも 気をつけるのよ!"
	keyWait
	end
}
script 5 mmbn2 {
	checkItem
		item = 64
		amount = 1
		jumpIfEqual = 8
		jumpIfGreater = 8
		jumpIfLess = continue
	checkFlag
		flag = 516
		jumpIfTrue = 6
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん?
	メイルちゃん 見おくりに きてるの
	気づいてないの?
	"""
	keyWait
	end
}
script 6 mmbn2 {
	checkFlag
		flag = 570
		jumpIfTrue = 7
		jumpIfFalse = continue
	flagSet
		flag = 570
	msgOpen
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 22
	"""
	」
	を きかいに とおした!!
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 285
	"シューン!! "
	waitSkip
		frames = 30
	soundPlay
		track = 273
	"ガチャ!!"
	soundEnableTextSFX
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 22
	"」は うけつけられた!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	いちど 中に入ったら
	そとに出ちゃ ダメなんだよ
	"""
	keyWait
	end
}
script 8 mmbn2 {
	msgOpen
	"""
	熱斗は、
	「フリーパス」
	を きかいに とおした!!
	"""
	keyWait
	clearMsg
	soundDisableTextSFX
	soundPlay
		track = 285
	"シューン!! "
	waitSkip
		frames = 30
	soundPlay
		track = 273
	"ガチャ!!"
	soundEnableTextSFX
	keyWait
	clearMsg
	"「フリーパス」は うけつけられた!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"こうくうけんを お入れ下さい"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	ここは じょうむいんや VIP、あと
	オフィシャルネットバトラー なんかの
	せんようつうろ なのよ
	"""
	keyWait
	end
}
script 11 mmbn2 {
	wait
		frames = 1
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ここは とうちゃくゲート です
	ここから 中には 入れませんよ
	"""
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	おいおい、そとに 出ちゃ
	けんさの いみが なくなっちゃうよ
	"""
	keyWait
	end
}
script 16 mmbn2 {
	checkChapter
		lower = 56
		upper = 255
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkFlag
		flag = 518
		jumpIfTrue = 36
		jumpIfFalse = continue
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"では パスポートを 見せてください\n"
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
	"やだ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 17,
			jump = continue,
			jump = continue
		]
	"""
	それじゃ ここを とおせないよ
	がいこくに 行けないけど いいの?
	"""
	keyWait
	end
}
script 17 mmbn2 {
	flagSet
		flag = 518
	flagClear
		flag = 2163
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"光熱斗くん・・・"
	waitSkip
		frames = 30
	"まちがいなしと!"
	waitSkip
		frames = 30
	"\nで、どこへ 行くのかな?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"アメロッパ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"アジーナ!"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 18,
			jump = continue,
			jump = continue
		]
	"""
	でも チケット、アメロッパ行き だよ?
	ほんとは アメロッパに 行くんでしょ?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"そうだった "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"アジーナ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 19,
			jump = continue,
			jump = continue
		]
	"うーん ヘンだなあ・・・"
	waitSkip
		frames = 30
	"\nまあ いいか、じゃ どうぞ・・・"
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"ふむふむ・・・"
	waitSkip
		frames = 30
	"\nはい OK!"
	waitSkip
		frames = 30
	" じゃ よいたびを ね!"
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	やっぱり そうだよね
	はい じゃOK! よい たびを!
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	おいおい もう しんさはすんだよ
	もどっちゃ ダメだよ
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	おい ボク、
	かってに とおっちゃ ダメだよ
	"""
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ここも じょうむいんや VIP、あと
	オフィシャルネットバトラーたちの
	せんようつうろ だよ
	"""
	keyWait
	end
}
script 25 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	ニホンの そらの げんかん、
	デンサンくうこうへ ようこそ!
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	こうくうけんを おもちの かたは
	こちらのほうへ おすすみ下さい
	"""
	keyWait
	clearMsg
	"""
	たびの じゅんびは OKですか?
	いちど 中に入ると もう
	そとへは 出れませんので ごちゅういを
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	スシ! ゲイシャ! オクデンダニ!
	ニホンは オモシロカッタデース!
	"""
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	どうやら おまえも
	かいぎに よばれたらしいな・・・
	"""
	keyWait
	clearMsg
	"とうじつは オレの ジャマを するなよ"
	keyWait
	end
}
script 29 mmbn2 {
	checkChapter
		lower = 55
		upper = 72
		jumpIfInRange = 48
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	こちらは とうちゃくロビー ですよ
	しゅっぱつロビーの ほうに まわって
	くださいね
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"ワタシ ニホンは はじめてデース!!"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	りょこう中に スリに あったんだよ・・・
	がいこくは ゆだんが ならないね
	ぼうやも 気をつけなよ
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	こうくうけんは おもちの ようですね
	たのしい フライトに なりますように!
	"""
	keyWait
	end
}
script 33 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 83
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 76
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 59
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	AALは
	アメロッパの こうくう がいしゃです
	"""
	keyWait
	end
}
script 34 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 84
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ナイフとか きけんぶつは
	ひこうきに もって のれないんだよ
	"""
	keyWait
	clearMsg
	"""
	けんさを するから
	ゲートを くぐってごらん
	"""
	keyWait
	end
}
script 35 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 85
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	つぎは いよいよ
	しゅっこくしんさ じゃ
	"""
	keyWait
	clearMsg
	"""
	しつもんに ちゃんと こたえんと
	がいこくに イケンらしいぞ
	きんちょう するのぅ・・・
	"""
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	どうしたの?
	もう しゅっこくしんさは おわりだよ
	"""
	keyWait
	end
}
script 37 mmbn2 {
	checkZenny
		amount = 0
		jumpIfEqual = continue
		jumpIfGreater = 39
		jumpIfLess = continue
	flagAddMail
		flag = 1819
	jump
		target = 39
}
script 39 mmbn2 {
	msgOpen
	flagAddMail
		flag = 1818
	"メールガ トドキマシタ・・・"
	keyWait
	end
}
script 40 mmbn2 {
	checkChapter
		lower = 56
		upper = 255
		jumpIfInRange = 67
		jumpIfOutOfRange = continue
	checkFlag
		flag = 572
		jumpIfTrue = 42
		jumpIfFalse = continue
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"パスポート見せてください\n"
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
	"やだ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 41,
			jump = continue,
			jump = continue
		]
	"""
	それじゃ このさきにはとおせないよ
	まいったなぁ・・・
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"光熱斗くん、まちがいなしと!"
	waitSkip
		frames = 30
	"\nおかえり"
	keyWait
	flagSet
		flag = 572
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	おいおい もう しんさはすんだよ
	もどっちゃ ダメだよ
	"""
	keyWait
	end
}
script 43 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	おい ボク、
	かってに とおっちゃ ダメだよ
	"""
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	ボク、これから がいこくに
	いくんだ!!
	"""
	keyWait
	clearMsg
	"""
	ひこうきに のってね、
	アジーナにいくんだよ!!
	"""
	keyWait
	clearMsg
	"へへっ!!"
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	コラ! あんまり はしゃいじゃ
	ダメだっていってるだろ!!
	もうちょっと おちつきなさい!
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	オー!! ついにニホン
	とうちゃくデース!!
	"""
	keyWait
	clearMsg
	"""
	メニー メニーかんこうして
	かえりマース!!
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	ながらくの ごとうじょう
	おつかれさまでした
	"""
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"こちらは とうちゃくロビー ですよ"
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	printItem
		buffer = 0
		item = 64
	"""
	を おもちですね
	どうぞ、おとおりください
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	printItem
		buffer = 0
		item = 64
	"""
	を おもちですね
	でしたら、しゅっこくしんさは、
	ヒツヨウありません
	"""
	keyWait
	clearMsg
	"どうぞ、おすすみください"
	keyWait
	end
}
script 52 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 65
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	こんな、じょうきょうか でも
	メトロラインや ひこうきは、
	うごいておる
	"""
	keyWait
	clearMsg
	"ジコなぞ、おきや せんじゃろうのう?"
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ムー!!"
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	アジーナに ついたとたん、
	いきなり、アチコチで だいこうずいが
	はじまって あわてて かえってきたんだ
	"""
	keyWait
	clearMsg
	"""
	そしたら、ムスコのヤツが、
	ムクれちゃって
	"""
	keyWait
	clearMsg
	"""
	な、こんど ゆうえんちに
	つれてってやるから、な
	そう ムクれるなよ なっ!
	"""
	keyWait
	end
}
script 55 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"パパ、はやくかえってこないかな?"
	keyWait
	end
}
script 56 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"きょうね、パパが かえってくるの"
	keyWait
	end
}
script 57 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 72
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	まだかな? まだかな?
	パパまだかな?
	"""
	keyWait
	end
}
script 58 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 73
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 63
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ウチの だんなが、アメロッパで
	モウチョウに かかっちゃって、
	ひこうきに のれなかったの
	"""
	keyWait
	clearMsg
	"""
	それで、今日 かえってくる
	よてい なんだけど・・・
	"""
	keyWait
	clearMsg
	"""
	ニホンも、今 じしんがつづいてるし
	アメロッパでも ナニか さいがいが
	おこってるみたいだから・・・
	"""
	keyWait
	clearMsg
	"かえって これるのかしら・・・"
	keyWait
	end
}
script 59 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	ただいま、AALの とくべつきが
	けんがくできます
	"""
	keyWait
	clearMsg
	"""
	こうくうけん もしくは、フリーパスを
	おもちのかたは、
	とうじょうぐちから どうぞ
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	うわーい!! パパだ!
	パパおかえりー!!
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"パパだっこして~"
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"パパ、もう ぽんぽん イタくない?"
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	まったく! こんな ひじょうじたいに
	あいする つまとコドモたちを
	またせるだなんて!!
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
	"\nなんてね、おかえりなさい アナタ"
	keyWait
	end
}
script 64 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 74
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	みんな、シンパイかけたな
	パパは、もう だいじょうぶだぞ!
	"""
	keyWait
	clearMsg
	"""
	とにかく、今は あまりそとに
	でないほうがいい
	"""
	keyWait
	clearMsg
	"しばらくココで、ようすをみよう"
	keyWait
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	ふぉふぉっ、
	おやこの かんどうの さいかいじゃ
	"""
	keyWait
	clearMsg
	"""
	なんて、ゆうちょうなコトをいっとる
	ばあいじゃ ないんじゃが、
	ワシは かんどうしておる!
	"""
	keyWait
	end
}
script 66 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 77
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	はじめての ニホン ゆれてます
	しょうじき、ドコにもいけまセーン
	"""
	keyWait
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"おかえりなさい!"
	keyWait
	clearMsg
	"""
	しんさなら いいですよ、
	かおパスですよ かおパス!
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	じしんも、おさまった
	みたいだから、おウチにかえろ!!
	"""
	keyWait
	clearMsg
	"""
	パパ かえったら、いっしょに
	おフロ はいろうね
	"""
	keyWait
	clearMsg
	"やくそくだよ!"
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"ワタシも はいる~!!"
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"ズルい~! ワタシも~"
	keyWait
	end
}
script 73 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	アナタ、かえりましょ
	フフ ひさしぶりね、
	かぞくが ぜんいん そろうのは
	"""
	keyWait
	clearMsg
	"""
	それじゃあ、こんやは
	ママのじっかに つたわる
	「エビのデンサンふう ミソにこみ」よ!
	"""
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"お、おまえたち・・・"
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	ううっ!! なんと
	かんどうてきなシーンじゃ!
	"""
	keyWait
	clearMsg
	"""
	おもわず、ナミダが ほほを
	つたうわい!!
	"""
	keyWait
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	やっと さいがいが
	おさまった みたいだわ
	"""
	keyWait
	clearMsg
	"""
	さぁ、きこくラッシュに
	そなえないとね!!
	"""
	keyWait
	end
}
script 77 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	きこくの日が ニアーでーす!!
	スピーディーに かんこうしないと
	いけませーーん
	"""
	keyWait
	clearMsg
	"コマりましたー"
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	ニホンの そらの げんかん、
	デンサンくうこうへ ようこそ!
	"""
	keyWait
	clearMsg
	"""
	・・・でも こんなとき ですからね、
	いそぎでない かいがいりょこうは
	なるべく おひかえ くださいね
	"""
	keyWait
	end
	keyWait
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	クニに のこしてきた
	マイファミリーが シンパイだ!
	"""
	keyWait
	clearMsg
	"""
	ネットはんざいに
	まきこまれて いなければいいが・・・
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"やっと ニホンに かえってきたぞ!"
	keyWait
	clearMsg
	"""
	はやく にょうぼうと こどものところに
	行ってやらなければ!
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportWoman
	msgOpen
	"""
	ただ今 ひこうきも
	びんすうせいげんを 行っています
	"""
	keyWait
	clearMsg
	"""
	ですので 今 アメロッパへは
	AALのびんしか とんでいないのです
	"""
	keyWait
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	今は かなりきびしい
	もちものチェックを しているよ
	"""
	keyWait
	clearMsg
	"""
	・・・でも
	フリーパスを もってるなら 話はベツだ
	"""
	keyWait
	clearMsg
	"どうぞ おすすみください"
	keyWait
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	もちものけんさに
	1じかんも かかるとは・・・
	"""
	keyWait
	clearMsg
	"""
	ネットはんざいの せいで
	イロイロ ふべんを しいられるのぅ・・・
	"""
	keyWait
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	カレ、そろそろ
	アメロッパを たつころなの・・・
	"""
	keyWait
	clearMsg
	"""
	ぶじに かえって これるかしら?
	わたし、いてもたっても いられなくて
	・・・
	"""
	keyWait
	clearMsg
	"""
	まだ なんじかんも あるのに
	バカだと おもうでしょ、
	"""
	keyWait
	clearMsg
	"""
	でも こんなキモチ
	いつか キミにも わかる日が くるはずよ
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 160
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 159
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 159
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	まいど~! あんさんが、
	ワテのいらいを、きいてくれはるんか?
	"""
	keyWait
	clearMsg
	"""
	いらいの ないよう ちゅうんは、
	「
	"""
	printChip
		buffer = 0
		chip = 136
	" "
	printCode
		buffer = 0
		code = N
	"""
	」を
	ゆずって ほしいんですわ
	"""
	keyWait
	clearMsg
	"""
	ワテは、みためは がいこくじんやけど
	うまれも、そだちも ニホンなんですわ
	"""
	keyWait
	clearMsg
	"""
	ほんで、こんかい はじめて
	かいがいに いきますねんけど
	"""
	keyWait
	clearMsg
	"""
	ホレ、かいがいって、
	なにかと ぶっそうやて いいますやろ?
	"""
	keyWait
	clearMsg
	"""
	ワテ、うでっぷしには、
	じしんありまんねんけど
	"""
	keyWait
	clearMsg
	"""
	ウイルスバスティングは
	からっきしでんねん
	"""
	keyWait
	clearMsg
	"""
	そこで、まぁ あんさんに
	いらいしたわけですねん
	"""
	keyWait
	clearMsg
	"""
	ほんで、ゆずってもらえますのんか?
	「
	"""
	printChip
		buffer = 0
		chip = 136
	" "
	printCode
		buffer = 0
		code = N
	"」"
	keyWait
	clearMsg
	"""
	ただで とは、いいまへん
	それなりの おれいは、させてもらいまっせ
	"""
	keyWait
	clearMsg
	"どないでっか?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ええで "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"あかん"
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
	あんさん、ほんまに
	しみんネットバトラーでっか?
	"""
	keyWait
	clearMsg
	"""
	いらいを うけたちゅうことは、
	ワテにチップを ゆずってくれる
	ちゅうコトと ちがうんか?
	"""
	keyWait
	clearMsg
	"たのんまっせ、ほんまに"
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 136
		code = N
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	itemTakeChip
		chip = 136
		code = N
		amount = 1
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ほんまに、ゆずってもらえるんでっか?
	いっぺんもらったもんは、
	かえせゆうたかて、かえしませんで!
	"""
	keyWait
	clearMsg
	"ははは、おおきに! おおきにやで!"
	keyWait
	clearMsg
	"""
	ほんなら、コレは、チップのだいきんや
	とっといてや
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	flagSet
		flag = 160
	flagSet
		flag = 3212
	flagClear
		flag = 82
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 50000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	熱斗は、
	「50000ゼニー」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	たしょう、ゼニはらっても
	あんぜんの じゅんびをするのは
	とうぜんやで
	"""
	keyWait
	clearMsg
	"""
	ミズとあんぜんが タダなんは、
	ニホンだけや!
	"""
	keyWait
	clearMsg
	"""
	あんさんも、かいがいにいくときは、
	きぃつけや
	"""
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"なんや、「"
	printChip
		buffer = 0
		chip = 136
	" "
	printCode
		buffer = 0
		code = N
	"""
	」を
	もってきてくれたんかいな?
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
	"そやで "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちゃいます"
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
	あんさん、ほんまに
	しみんネットバトラーでっか?
	"""
	keyWait
	clearMsg
	"""
	いらいを うけたちゅうことは、
	ワテにチップを ゆずってくれる
	ちゅうコトと ちがうんか?
	"""
	keyWait
	clearMsg
	"たのんまっせ、ほんまに"
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"なんや?"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 136
	" "
	printCode
		buffer = 0
		code = N
	"""
	」が
	どこにも あらへんがな!
	あらへんがな! あらへんがな!
	"""
	keyWait
	clearMsg
	"3かい ゆったった!"
	keyWait
	clearMsg
	"""
	もしかして、フォルダのなかに
	はいってへんやろか?
	"""
	keyWait
	clearMsg
	"""
	フォルダのなかにはいってたら
	そら みつけられへんわ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	フライトボードだ!
	ひこうきの しゅっぱつじこくが
	かかれている
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
	"どうやら、プラグインできるようだ"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	こうくうけんを いれる
	かいさつき だ!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"DEXPカウンターだ!"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"AALカウンターだ!"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"「キケンぶつ もちこみキンシの\n おねがい」"
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	にもつの中に キケンぶつなどが
	はいっていないか チェックするトコロだ
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"「かんけいしゃいがい 立ち入りキンシ!」"
	keyWait
	end
}
script 227 mmbn2 {
	jump
		target = 16
}
