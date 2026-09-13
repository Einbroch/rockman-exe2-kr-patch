@archive 0749AC0
@size 255

script 15 mmbn2 {
	checkChapter
		lower = 56
		upper = 61
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 31
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 17
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	世界中を たびしてきたけど
	やっぱり ウチがいちばん おちつくわね
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	アジーナは、インターネットよりも
	じっさい いったほうが いいわよ
	"""
	keyWait
	clearMsg
	"""
	たべものが、おいしいし
	うみも キレイだし
	"""
	keyWait
	clearMsg
	"""
	でも まだ、3かい くらいしか
	いったコトないけどね
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	グライドから きいたんだけど、
	インターネットで、なにかじけんが
	おこってるみたいね
	"""
	keyWait
	clearMsg
	"""
	そんな ときは、
	インターネットなんか しないで
	"""
	keyWait
	clearMsg
	"""
	ゆうがに どくしょでも
	するにかぎるわね
	"""
	keyWait
	clearMsg
	"「くんし あやうきに ちかよらず」よ"
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	あたしに とっちゃ
	今さら アメロッパなんて
	めずらしくも なんとも ないわけ
	"""
	keyWait
	clearMsg
	"""
	ま あそこは
	ちあんの わるいところが あるから
	そういうところには ちかづかないことね
	"""
	keyWait
	clearMsg
	"""
	・・・あと おみやげは いらないわよ
	すくない おこづかいを これいじょう
	つかわしちゃ かわいそうだしね
	"""
	keyWait
	end
}
script 30 mmbn2 {
	checkFlag
		flag = 575
		jumpIfTrue = 33
		jumpIfFalse = continue
	checkItem
		item = 27
		amount = 1
		jumpIfEqual = 31
		jumpIfGreater = 31
		jumpIfLess = continue
	flagSet
		flag = 575
	mugshotShow
		mugshot = Yai
	msgOpen
	"あら かえってきたの?"
	keyWait
	clearMsg
	"""
	はじめての、かいがいりょこうは
	どうだった?
	"""
	keyWait
	clearMsg
	"""
	アメロッパって、けっこうせわしない
	カンジが するじゃない?
	あまり、リラックスできないのよね
	"""
	keyWait
	clearMsg
	"""
	こんど、かいがいに いくんだったら
	アジーナがいいわよ
	"""
	keyWait
	end
}
script 31 mmbn2 {
	flagSet
		flag = 575
	itemTake
		item = 27
		amount = 1
	mugshotShow
		mugshot = Yai
	msgOpen
	"あら かえってきたの?"
	keyWait
	clearMsg
	"""
	はじめての、かいがいりょこうは
	どうだった?
	"""
	keyWait
	clearMsg
	"""
	アラ? ワタシに おみやげ?
	そんなに きを つかわなくても
	いいのに
	"""
	keyWait
	clearMsg
	"でも、ありがたく いただいとくわ"
	keyWait
	clearMsg
	"""
	ま、コレは ほんのキモチよ
	とっといて
	"""
	keyWait
	clearMsg
	jump
		target = 32
}
script 32 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 10000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	熱斗は、
	「10000ゼニー」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	かいがいに いくと、
	モノの みえかたが、かわるわよね
	"""
	keyWait
	clearMsg
	"""
	アナタ、ワタシに いっぽ
	ちかづいたわね
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	このいえは、さいしんの
	たいしん ぎじゅつを くしして
	つくられているから、
	"""
	keyWait
	clearMsg
	"""
	どんなに おおきな じしんがきても
	あんしんよ
	"""
	keyWait
	clearMsg
	"""
	じつは、秋原町で いちばん
	あんぜんな ばしょなのよ ウチは
	"""
	keyWait
	clearMsg
	"""
	ひなんするんだったら、
	ウチに きなさいよ
	"""
	keyWait
	end
}
script 40 mmbn2 {
	checkChapter
		lower = 65
		upper = 72
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	これだけ モノが おおいと
	ウイルスたいさくも たいへんな わけよ
	"""
	keyWait
	clearMsg
	"光くん・・・"
	waitSkip
		frames = 30
	"""
	あんた
	ホントに ゴスペルを やっつけたの?
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	じつは
	グライドは こうせいのうな わけよ
	"""
	keyWait
	clearMsg
	"""
	だから、
	アタシが ゴスペルを やっつけるわよ!
	"""
	keyWait
	clearMsg
	"と いいたい とこだけど・・・"
	keyWait
	clearMsg
	"""
	PETが 大きくて うまく
	グライドを そうさできない わけよ・・・
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	コブンの ライバル、
	データの にんぎょうだ
	"""
	keyWait
	clearMsg
	"ぐったりしている・・・"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	アンティークな しょっきが
	ならんでいる・・・
	"""
	keyWait
	clearMsg
	"""
	ぜんぶで いったい いくらに
	なるんだろう
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkItem
		item = 3
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 230
	msgOpen
	"""
	やいとの せんすコレクションが
	ならんでいる
	"""
	keyWait
	end
}
script 223 mmbn2 {
	checkChapter
		lower = 6
		upper = 6
		jumpIfInRange = 237
		jumpIfOutOfRange = continue
	msgOpen
	"""
	やいとの パソコンだ
	プラグインできる
	"""
	keyWait
	end
}
script 224 mmbn2 {
	checkChapter
		lower = 6
		upper = 6
		jumpIfInRange = 238
		jumpIfOutOfRange = continue
	msgOpen
	"""
	ねんだいモノの でんわだ
	プラグイン できるようだ
	"""
	keyWait
	end
}
script 225 mmbn2 {
	checkChapter
		lower = 7
		upper = 7
		jumpIfInRange = 234
		jumpIfOutOfRange = continue
	checkChapter
		lower = 6
		upper = 6
		jumpIfInRange = 233
		jumpIfOutOfRange = continue
	checkItem
		item = 82
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 236
	msgOpen
	"""
	ふかふかの うもうブトンだ
	このふとんのために ぎせいに なった
	トリさんたちに がっしょう・・・
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	こだい メルポポスぶんめい の
	たたかいの カミだ・・・
	"""
	keyWait
	clearMsg
	"じゃあくなモノを かんじる・・・"
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"やいとの しょうぞうが だ"
	keyWait
	clearMsg
	"""
	ほんにんより 3わりまし くらい
	かわいく えがかれている
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"小さな きょうだいだ"
	keyWait
	clearMsg
	"""
	しかし、
	やいとには ピッタリのサイズだ
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"ナゾのどうぶつの アタマだ・・・"
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"ゴソゴソゴソ・"
	waitSkip
		frames = 10
	"・"
	waitSkip
		frames = 10
	"・"
	keyWait
	clearMsg
	jump
		target = 231
}
script 231 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あった! コレだ!"
	keyWait
	clearMsg
	jump
		target = 232
}
script 232 mmbn2 {
	flagSet
		flag = 654
	mugshotHide
	msgOpen
	playerAnimate
		animation = 24
	itemGive
		item = 3
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 3
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	end
}
script 233 mmbn2 {
	msgOpen
	"""
	ふかふかの うもうブトンだ
	このふとんのために ぎせいに なった
	トリさんたちに がっしょう・・・
	"""
	keyWait
	end
}
script 234 mmbn2 {
	checkItem
		item = 82
		amount = 1
		jumpIfEqual = 235
		jumpIfGreater = 235
		jumpIfLess = continue
	msgOpen
	"""
	やいとは また
	スヤスヤと ねむっている・・・
	"""
	keyWait
	clearMsg
	"""
	・・・まくらもとに
	メモようしが おちている
	"""
	keyWait
	clearMsg
	"熱斗は それを よんでみた・・・"
	waitSkip
		frames = 30
	"""
	
	なにかの パスコードと
	やいとの メモがきが してある
	"""
	keyWait
	clearMsg
	"「わたしの パソコンの パスコード\n こんど 光くんに おしえてあげよう\n よろこんで くれるかな?」"
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGive
		item = 82
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 82
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	end
}
script 235 mmbn2 {
	msgOpen
	"""
	やいとは また
	スヤスヤと ねむっている・・・
	"""
	keyWait
	clearMsg
	"""
	・・・まくらもとに
	メモようしが おちている
	"""
	keyWait
	clearMsg
	"熱斗は それを よんでみた・・・"
	waitSkip
		frames = 30
	"""
	
	なにかの パスコードと
	やいとの メモがきが してある
	"""
	keyWait
	clearMsg
	"「わたしの パソコンの パスコード\n こんど 光くんに おしえてあげよう\n よろこんで くれるかな?」"
	keyWait
	end
}
script 236 mmbn2 {
	msgOpen
	"""
	ふかふかの うもうブトンだ
	このふとんのために ぎせいに なった
	トリさんたちに がっしょう・・・
	"""
	keyWait
	clearMsg
	"""
	・・・よく見ると まくらもとに
	メモようしが おちている
	"""
	keyWait
	clearMsg
	"熱斗は それを よんでみた・・・"
	waitSkip
		frames = 30
	"""
	
	なにかの パスコードと
	やいとの メモがきが してある
	"""
	keyWait
	clearMsg
	"「わたしの パソコンの パスコード\n こんど 光くんに おしえてあげよう\n よろこんで くれるかな?」"
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGive
		item = 82
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 82
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	end
}
script 237 mmbn2 {
	msgOpen
	"""
	やいとの パソコンだ
	プラグイン できるようだが
	いまは それどころでは ない!!
	"""
	keyWait
	end
}
script 238 mmbn2 {
	msgOpen
	"""
	ねんだいモノの でんわだ
	プラグイン できるようだが
	いまは それどころでは ない!!
	"""
	keyWait
	end
}
