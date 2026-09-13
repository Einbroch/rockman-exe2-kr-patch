@archive 0752A30
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 66
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 64
		upper = 65
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 65
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 32
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 26
		upper = 31
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 25
		jumpIfInRange = 22
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 16
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 19
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"いらっしゃいませー!"
	keyWait
	clearMsg
	"""
	しぜんしょくの おべんとうは
	いかがですかー?
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"う~~~~~~~~~~"
	waitSkip
		frames = 30
	"ん!!"
	keyWait
	clearMsg
	"""
	いや~~ やっぱり
	山のクウキは きもちえ~なぁ~
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 6
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampMan
	msgOpen
	"カミを シロくそめた しょうねん?"
	keyWait
	clearMsg
	"""
	いや・・・
	こっちには きてないと おもうぞ
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"みんな もう ヒナンしたぞ!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	カラダに やさしい
	しぜんは べんとう!
	いかがですか?
	"""
	keyWait
	end
}
script 11 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 17
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"""
	ハイハイハイハイハイキングー♪
	ハハハハハハハハハイキングー♪
	"""
	keyWait
	clearMsg
	"""
	きょうは たのしい♪
	ハイキングー♪
	"""
	keyWait
	clearMsg
	"ヘイ!"
	keyWait
	end
}
script 12 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 18
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Girl
	msgOpen
	"""
	コラ、あんまり はしゃがないの!
	ころんだって しらないよ!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	カラダにやさしい しぜんは べんとう
	うれゆきは、いまひとつね・・・
	"""
	keyWait
	clearMsg
	"でも、まけないもん!"
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = CampBoy
	msgOpen
	"はやくいこうよ おねえちゃん!"
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Girl
	msgOpen
	"もう、せっかちなんだから"
	keyWait
	clearMsg
	"""
	せっかく ここまできたんだから
	もっとしぜんを ジックリ
	たのしみましょうよ
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	なんとか、あじに かいりょうを
	くわえなきゃ・・・
	"""
	keyWait
	clearMsg
	"""
	うーーん・・・どうすれば
	おいしく なるのかな・・・
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	まえに、しぜんほごかつどう を
	いっしょに やっていた おんなのこから
	おしえてもらった
	"""
	keyWait
	clearMsg
	"""
	ひでんの おべんとうを つくってみたの
	これが、もう ゼッピンなのよ!!
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"このヒト だれかしら?"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"このべんとうは、ウマイぞ!!"
	keyWait
	clearMsg
	"""
	ゼヒ、らいげつごうの
	「げっかん BENTO」に
	のせなければ!!
	"""
	keyWait
	clearMsg
	"ん? ワタシかい?"
	keyWait
	clearMsg
	"""
	ワタシは、さすらいの
	べんとう ひょうろんか だ
	"""
	keyWait
	clearMsg
	"""
	このみせの べんとうは、
	ひじょうに うまいぞ!
	"""
	keyWait
	clearMsg
	"いつつボシ だ!!"
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	こんなに、ぎょうれつが できるなんて!
	このみせ はじまっていらいの
	できごとよ!!
	"""
	keyWait
	clearMsg
	"みなさん おさないで くださいね~"
	keyWait
	end
}
script 51 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 66
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	「げっかん BENTO」に
	のってたぐらいだから、
	そうとう、ウマイんだろなあ
	"""
	keyWait
	end
}
script 52 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 67
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	これからの、しょくせいかつは
	カラダに やさしくないと、
	いけないぞい!
	"""
	keyWait
	end
}
script 53 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 68
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	ぐうぜん とおりがかったんだけど、
	ニホンじんは、ぎょうれつが
	スキだっていうけど、ホントね!
	"""
	keyWait
	clearMsg
	"""
	ワタシも きねんに
	ならんでいるの!
	"""
	keyWait
	end
}
script 54 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 69
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"ワタシも ならぶの~~"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	じしんの、えいきょうか しらないけど、
	きゃくあしが、とだえちゃったわー!
	"""
	keyWait
	clearMsg
	"""
	このぶんだと、とうぶん
	りんじ きゅうぎょうね
	"""
	keyWait
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	ぎょうれつ ふっかつよ!!
	さ、みんな ならんでください!
	"""
	keyWait
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ココの べんとうは ヤバいくらい
	ウマいよ!!
	"""
	keyWait
	clearMsg
	"""
	きめた!
	これから まいにち ここにかよう!
	"""
	keyWait
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	このべんとうを たべはじめてから
	きゅうに ようつうが なおっての!
	"""
	keyWait
	clearMsg
	"もう ピンピンじゃ!!"
	keyWait
	end
}
script 68 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"また たべに きちゃったデース!"
	keyWait
	end
}
script 69 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"ワタシも たべる~~!"
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	べんとうを かいに きたんだけれど
	こんなとき だからかな、
	えいぎょう してない みたいだね・・・
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 3209
		jumpIfTrue = 201
		jumpIfFalse = continue
	checkFlag
		flag = 153
		jumpIfTrue = 199
		jumpIfFalse = continue
	checkFlag
		flag = 152
		jumpIfTrue = 198
		jumpIfFalse = continue
	flagSet
		flag = 152
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	おふぉぉぉ おぬしがワシの
	キューピッドちゃんか?
	そう、いらいしゃは、このワシじゃ
	"""
	keyWait
	clearMsg
	"""
	ワシもこのトシで こいにおちるとは
	おもいも よらんかったんじゃが
	"""
	keyWait
	clearMsg
	"""
	こいとは、えてして トツゼンうまれる
	ものなのじゃよ
	"""
	keyWait
	clearMsg
	"""
	あの じょせいに であったしゅんかん
	カラダに でんりゅうが ながれたんじゃ!
	"""
	keyWait
	clearMsg
	"しんぞうが とまるかとおもったくらいじゃ"
	keyWait
	clearMsg
	"""
	そのヒトは、えがおが ステキなんじゃぁ
	カノジョは、ワシの たいようじゃ
	"""
	keyWait
	clearMsg
	"""
	しかし・・・このおもいを
	つたえたいんじゃが
	いかんせん、うちきな せいかくでのう
	"""
	keyWait
	clearMsg
	"""
	ほんにんの まえにたつと
	コトバが でなくてな
	"""
	keyWait
	clearMsg
	"""
	おもいをつたえる よいてだては
	ないかのう?
	"""
	keyWait
	clearMsg
	jump
		target = 191
}
script 191 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おもいきって いっちゃえばいいのに"
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	それが できとりゃ
	さいしょから いらいなんぞ しとらんわ
	"""
	keyWait
	clearMsg
	"""
	それに、そんなコト しようもんなら
	しんぞうが とまってしまうわい!!
	"""
	keyWait
	clearMsg
	"""
	たのむから、ナニか よいちえを
	かしてくれい
	"""
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ねぇ、熱斗くん
	ラヴレターなんてどう?
	"""
	keyWait
	clearMsg
	"""
	やっぱり、あいのこくはくは
	むかしから ラヴレターが
	しゅりゅうだよね!
	"""
	keyWait
	clearMsg
	jump
		target = 194
}
script 194 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	お、それいいな!
	それいただき!
	"""
	keyWait
	clearMsg
	"おじいさん、ラヴレターを かくんだよ!"
	keyWait
	clearMsg
	jump
		target = 195
}
script 195 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"こいぶみか・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"\nいける!!"
	keyWait
	clearMsg
	"それは、いけるぞ!! おぬし!!"
	keyWait
	clearMsg
	"""
	ようし、さっそくかくぞい!!
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
	しかし、
	なんと かけば よいのかのう?
	"""
	keyWait
	clearMsg
	jump
		target = 196
}
script 196 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	カンタンさ! おじいさんの
	アツいおもいを てがみに
	ぶつけるんだよ
	"""
	keyWait
	clearMsg
	"""
	それに、かみに かくだけなら
	キンチョウしないだろ?
	"""
	keyWait
	clearMsg
	jump
		target = 197
}
script 197 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	そ、そうじゃな!!
	よっしゃぁ~!!
	かくぞい~!!
	"""
	keyWait
	clearMsg
	"""
	ぬおおおおおおおおおおおお!!
	そりゃああああああああああ!!
	ほりゃああああああああああ!!
	"""
	keyWait
	clearMsg
	"""
	で、でけたぞい~!!
	わが じんせい さいこうの
	ぶんしょうじゃ
	"""
	keyWait
	clearMsg
	"""
	では、しょうねんよ
	わしからの いらいじゃ!!
	"""
	keyWait
	clearMsg
	"""
	このてがみを、
	その じょせいの トコロに
	もって行って ほしいんじゃ
	"""
	keyWait
	clearMsg
	"""
	そして、てがみを よんでもらって
	へんじを もらってきてほしいのじゃ
	"""
	keyWait
	clearMsg
	"""
	その じょせいが
	いま どこにいるかは わからんが
	"""
	keyWait
	clearMsg
	"""
	ただ、カノジョは、ハナが とてもすきでの
	ハナの さくトコロに あらわれるのじゃ
	"""
	keyWait
	clearMsg
	"""
	ニックネームは
	「ひまわりちゃん」じゃ!!
	"""
	keyWait
	clearMsg
	"""
	それでは、たのんだぞい!!
	ワシの じんせい さいだいの
	しょうぶじゃ!!
	"""
	keyWait
	clearMsg
	"たのんだぞ!!"
	keyWait
	clearMsg
	jump
		target = 202
}
script 198 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"い、いらいの かくにん じゃな!"
	keyWait
	clearMsg
	"""
	さっき わたした てがみを、
	その じょせいの トコロに
	もって行って ほしいんじゃ
	"""
	keyWait
	clearMsg
	"""
	そして、てがみを よんでもらって
	へんじを もらってきてほしいのじゃ
	"""
	keyWait
	clearMsg
	"""
	と、とりあえず ハナの さいている
	ばしょを さがすのじゃ
	そこには、きっと カノジョがいる
	"""
	keyWait
	clearMsg
	"""
	とても うつくしい じょせいじゃ
	ヘンな気を おこすでないぞ
	"""
	keyWait
	clearMsg
	"""
	と、とにかくだ!
	は、はやく行ってきてくれ
	気が気で ならーーん!
	"""
	keyWait
	end
}
script 199 mmbn2 {
	flagSet
		flag = 3209
	flagClear
		flag = 82
	mugshotShow
		mugshot = OldMan
	msgOpen
	"ど・どうじゃった?"
	keyWait
	clearMsg
	"お、おともだちから?"
	keyWait
	clearMsg
	"""
	ヒャッホーーーー!!!
	きょうは、じんせいさいこうの 日じゃ!!
	"""
	keyWait
	clearMsg
	"""
	おまえさんの おかげじゃあ!!
	ありがとう!! ありがとう!!
	もう、しんだっていいわい!!
	"""
	keyWait
	clearMsg
	"""
	そうじゃ そうじゃ、おまえさんに
	おれいをしないとな
	"""
	keyWait
	clearMsg
	"コレをうけとっておくれ"
	keyWait
	clearMsg
	jump
		target = 200
}
script 200 mmbn2 {
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
script 201 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"にんげん、ながいきはするもんじゃのう!!"
	keyWait
	end
}
script 202 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 52
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 52
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
script 220 mmbn2 {
	msgOpen
	"中から ことりの さえずりが きこえる"
	keyWait
	clearMsg
	"「 ようこそ! おくデンだにへ!! 」"
	keyWait
	clearMsg
	"と、いっているように きこえなくもない"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	りっぱな 木をつかった ゲートだ
	このゲートを くぐると、いやおうなしに
	キャンプな きぶんがたかまってくるようだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"「 ようこそ! しぜんの ほうこ\n  おくデンだに へ!! 」"
	keyWait
	clearMsg
	"キャンプじょう このおく"
	keyWait
	end
}
script 223 mmbn2 {
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 226
		jumpIfOutOfRange = continue
	checkChapter
		lower = 14
		upper = 14
		jumpIfInRange = 225
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	せっかく キャンプに きたんだから
	かえるのは まだにしようよ
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"バスてい だ"
	keyWait
	clearMsg
	"""
	さすが おくデンだに
	つぎの バスは とうぶん きそうにない
	・・・
	"""
	keyWait
	end
}
script 225 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、
	炎山くんを 見すてて かえっちゃうの?
	"""
	keyWait
	end
}
script 226 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、かえっちゃ ダメだよ!
	きばくそうち さがさなきゃ!!
	"""
	keyWait
	end
}
