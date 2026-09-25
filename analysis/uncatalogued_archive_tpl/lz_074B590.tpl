@archive 074B590
@size 255

script 0 mmbn2 {
	msgOpen
	"""
	トビラには
	でんしロックが かかっている!
	そとには 出られない!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1793
	"メールだ! なんだろう?"
	keyWait
	end
}
script 5 mmbn2 {
	checkFlag
		flag = 654
		jumpIfTrue = 6
		jumpIfFalse = continue
	checkFlag
		flag = 557
		jumpIfTrue = continue
		jumpIfFalse = 7
	mugshotShow
		mugshot = Dex
	msgOpen
	printItem
		buffer = 0
		item = 3
	"か・・・"
	waitSkip
		frames = 30
	"""
	
	やいとの ことだから 人に見られない
	ようなところに かくしてると おもうぜ!
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"よし! いけガッツマン! そこだ!"
	keyWait
	clearMsg
	"""
	そのウイルスを やったら
	トビラの ロックが はずれるゼ!
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	トビラの ロックプログラムも
	ウイルスに やられちまってる!
	"""
	keyWait
	clearMsg
	"""
	だが・・・! ここは
	オレさまと ガッツマンに まかせな!
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 3215
		jumpIfTrue = 192
		jumpIfFalse = continue
	checkFlag
		flag = 165
		jumpIfTrue = 197
		jumpIfFalse = continue
	flagSet
		flag = 165
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	やあ、キミが ボクのおねがいを
	きいてくれるのかい?
	"""
	keyWait
	clearMsg
	"""
	ボクは、さいがいけいびの
	かいしゃを けいえいしてるんだ・・・
	"""
	keyWait
	clearMsg
	"""
	だけど、いまの じだい なんでも
	オフィシャルネットバトラーが
	やっちゃうから、
	"""
	keyWait
	clearMsg
	"シゴトが なくなってきたんだ"
	keyWait
	clearMsg
	"""
	それで、かいしゃの うんえいしきんも
	そこを ついてきたのさ
	"""
	keyWait
	clearMsg
	"""
	50000ゼニーあれば、
	なんとか、こんげつ のりきるコトが
	できるんだけど、
	"""
	keyWait
	clearMsg
	"""
	その おカネがないと かいしゃは
	とうさん しちゃうんだ・・・
	"""
	keyWait
	clearMsg
	"""
	というワケで、50000ゼニーを
	かしてください!!
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
	"もちろん "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"イヤです"
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
	キ、キミは ボクを
	ひやかしにきたのかい!?
	"""
	keyWait
	end
}
script 191 mmbn2 {
	checkZenny
		amount = 50000
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 196
	checkTakeZenny
		amount = 50000
		jumpIfSurplus = continue
		jumpIfExact = continue
		jumpIfDeficit = continue
	flagSet
		flag = 3215
	flagClear
		flag = 82
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	おカネを かしてくれるのかい?
	ありがとう!!
	"""
	keyWait
	clearMsg
	"""
	さっそく、PETから ぎんこうに
	おかねを ふりこむよ・・・
	"""
	keyWait
	clearMsg
	"これで よしっ!"
	keyWait
	clearMsg
	"""
	ホントたすかったよ
	ありがとうキミ!!
	"""
	keyWait
	clearMsg
	"""
	いまスグ おれいを したいんだけど、
	いまは、ちょっとムリだから、
	"""
	keyWait
	clearMsg
	"""
	おカネが はいったときに
	ドーーーンっと、おれいさせてもらうよ
	"""
	keyWait
	clearMsg
	"え? ボクがなんで ココにいるのか?"
	keyWait
	clearMsg
	"""
	じつは、しゃっきんとりから
	にげているトコロを このやしきの
	ムスメさんが、かくまってくれたんだ
	"""
	keyWait
	clearMsg
	"""
	シゴトが、きどうに のるまで
	ココに いそうろう させてもらうのさ
	"""
	keyWait
	end
}
script 192 mmbn2 {
	checkFlag
		flag = 166
		jumpIfTrue = 195
		jumpIfFalse = continue
	checkFlag
		flag = 281
		jumpIfTrue = 193
		jumpIfFalse = continue
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	いつおカネが できるか
	わからないけど
	"""
	keyWait
	clearMsg
	"""
	かならず かえせるように
	ガンバるよ
	"""
	keyWait
	end
}
script 193 mmbn2 {
	flagSet
		flag = 166
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"すごいよ キミ!"
	keyWait
	clearMsg
	"""
	ちかごろ、おこった
	しぜんさいがいの おかげで、
	シゴトが わんさか はいってきたんだ
	"""
	keyWait
	clearMsg
	"""
	そして、おカネも たんまり
	はいってきたよ
	"""
	keyWait
	clearMsg
	"それじゃ、コレ とっておいてよ"
	keyWait
	clearMsg
	jump
		target = 194
}
script 194 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 100000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	熱斗は、
	「100000ゼニー」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	みんなが、こまると もうかる
	しょうばいだから、おおよろこび するのは
	きが ひけるけど
	"""
	keyWait
	clearMsg
	"""
	さいがいの おかげで、
	かいしゃが たすかったコトは
	しんじつ だからね
	"""
	keyWait
	clearMsg
	"もちろん、キミにも かんしゃしてるよ"
	keyWait
	end
}
script 196 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	キミ、ワルいけど
	おカネがたりないよ・・・
	きもちは、うれしいんだけどね・・・
	"""
	keyWait
	clearMsg
	"""
	ハハ・・・
	50000ゼニー ひつようなんだ
	ゴメンね・・・
	"""
	keyWait
	end
}
script 197 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"50000ゼニー よういできたのかい?"
	keyWait
	clearMsg
	"ひやかしは、かんべんしてくれよ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"かすよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ひやかしです"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 191,
			jump = continue,
			jump = continue
		]
	"なら、かえってくれ!"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ホンモノとみまちがうほどに
	よくできたイヌのおきものだ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	せかいてきに ゆうめいな めいがだ・・・
	さすがに、これはレプリカのようだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkChapter
		lower = 7
		upper = 47
		jumpIfInRange = 225
		jumpIfOutOfRange = continue
	checkChapter
		lower = 5
		upper = 6
		jumpIfInRange = 224
		jumpIfOutOfRange = continue
	msgOpen
	"""
	やいとの せんぞ だろうか
	ちいさいながらも りりしい だんせいの
	どうぞう だ
	"""
	keyWait
	clearMsg
	"""
	よくみると、プラグイン できそうな
	アナが あいている
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ガスが たちこめている!
	ちかづくのは キケンだ!!
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	やいとの せんぞ だろうか
	ちいさいながらも りりしい だんせいの
	どうぞう だ
	"""
	keyWait
	clearMsg
	"""
	プラグインできそうな アナが あるが
	いまは それどころでは ない!!
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	やいとの せんぞ だろうか
	ちいさいながらも りりしい だんせいの
	どうぞう だ
	"""
	keyWait
	clearMsg
	"""
	プラグインできそうな アナが あるが
	ホコリで つまって しまっている・・・
	"""
	keyWait
	end
}
