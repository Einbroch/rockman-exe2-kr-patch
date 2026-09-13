@archive 0761EBC
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 85
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 69
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 21
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"うわー、おそと キレイ!"
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 86
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 36
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 22
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"ワタシも おそと みたいよー!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"ザコです"
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 102
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 87
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 37
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 23
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	ほんとは、パパがこのとなりに
	すわるはずだったんだけど
	"""
	keyWait
	clearMsg
	"""
	ひこうきに のるまえに
	きゅうに おなかがイタくなって
	びょういんに いっちゃったんだ
	"""
	keyWait
	clearMsg
	"""
	それで、ボクたちだけで
	かえってきたんだ
	"""
	keyWait
	clearMsg
	"""
	むこうに すわってるのが、
	ボクの いもうとたちさ
	"""
	keyWait
	clearMsg
	"ふたごなんだよ"
	keyWait
	end
}
script 4 mmbn2 {
	checkFlag
		flag = 661
		jumpIfTrue = continue
		jumpIfFalse = 12
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 103
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 88
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 72
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 38
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 24
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	これから、ニホン りょこうデース
	そのタメに ニホンご
	れんしゅう してきまシタ
	"""
	keyWait
	clearMsg
	"もう、ペラペラ デース"
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 104
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 89
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 73
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 54
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 39
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ZZZ・・・
	ZZZ・・・
	ムニャムニャ・・・
	"""
	keyWait
	clearMsg
	"フガッ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ねむってるみたいだな・・・"
	keyWait
	clearMsg
	"""
	おこすのもワルいから、
	このまま そっとしておこう
	"""
	keyWait
	end
}
script 7 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 105
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 66
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	ひこうきってのは
	えらく たかいトコロを とぶんだねえ
	"""
	keyWait
	clearMsg
	"""
	アメロッパにいくときは、
	まんなかの せきに すわってたから
	きづかなかったよ
	"""
	keyWait
	end
}
script 8 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 106
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 91
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 74
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 56
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 27
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ワタシは、アメロッパでも ゆうめいな
	ひこうきマニアでね、
	"""
	keyWait
	clearMsg
	"""
	この ひこうきに のるのが
	ながねんの ユメだったんだよ
	"""
	keyWait
	clearMsg
	"""
	この ひこうきに のれる にんずうは、
	とてもすくないんだけど、
	"""
	keyWait
	clearMsg
	"""
	とても サービスがよくて、
	のりごこちも さいこうなんだ
	"""
	keyWait
	clearMsg
	"""
	あと、この ひこうきにしか
	くみこまれていない
	プログラムがあるらしいよ
	"""
	keyWait
	end
}
script 9 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 107
		jumpIfOutOfRange = continue
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 92
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 57
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 42
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 28
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	はやく、ニホンに つかないかしら
	スシ、フジヤマ、サムライ、ゲイシャが
	アタシを まってるわーーー
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"アマさんです"
	keyWait
	end
}
script 11 mmbn2 {
	checkChapter
		lower = 54
		upper = 54
		jumpIfInRange = 93
		jumpIfOutOfRange = continue
	checkChapter
		lower = 53
		upper = 53
		jumpIfInRange = 76
		jumpIfOutOfRange = continue
	checkChapter
		lower = 52
		upper = 52
		jumpIfInRange = 58
		jumpIfOutOfRange = continue
	checkChapter
		lower = 51
		upper = 51
		jumpIfInRange = 43
		jumpIfOutOfRange = continue
	checkChapter
		lower = 50
		upper = 50
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
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
script 12 mmbn2 {
	flagSet
		flag = 661
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	オー
	はじめて はなしかけて くれましたネー
	"""
	keyWait
	clearMsg
	"これは おちかづきの しるしデース"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 140
		code = L
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 140
	" "
	printCode
		buffer = 0
		code = L
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"たびは みちづれ、よは なさけデース!"
	keyWait
	end
}
script 20 mmbn2 {
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
	"""
	・
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
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	keyWait
	flagSet
		flag = 525
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	いっぱい ゆれたよ~!
	こわかったよう
	"""
	keyWait
	clearMsg
	"ウルウル・・・"
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	こ、こわかったけど
	な、なかないよ
	"""
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	さ、さっきの ゆれは すごかったね
	ちょ、ちょっと チビっちゃった・・・
	ブルル・・・
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	けっこう ゆれましタね!!
	ハハーッ!!
	びっくりしました
	"""
	keyWait
	clearMsg
	"""
	しんのぞうが とびでるかと
	おもいまシータ!
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	? ? ?
	ナニか あったのかい?
	みんな ざわついてるけど・・・
	"""
	keyWait
	clearMsg
	"おかげで 目が さめちゃったよ"
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"へいじょうしん へいじょうしん じゃ"
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ハハハ、ひこうきが エアポケットに
	ハマるのは よくあるコト!
	"""
	keyWait
	clearMsg
	"""
	ワタシは これっぽっちも
	おどろかなかったよ!
	"""
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"あー おどろいた!"
	keyWait
	clearMsg
	"""
	まったく ニホンには
	いつ つくのかしら!
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"わーい、おそとがみえる~!"
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	あのね、「おそとがみたい」っていうから、
	セキをね、かわってあげたの
	"""
	keyWait
	clearMsg
	"えらい?"
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"あ~あ、タイクツだな~"
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ニホンのけしきは、
	とてもキレイだと ききました
	"""
	keyWait
	clearMsg
	"たのしみデース!!"
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"ふあ~ぁ・・・"
	keyWait
	clearMsg
	"""
	さっきまでねてたけど、
	また ねむく なってきちゃったよ
	"""
	keyWait
	clearMsg
	"""
	きのうまでの かいがいしゅっちょう の
	つかれが、のこってる みたいだよ
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	この ひこうきの きないしょくは
	とびきり おいしいね
	"""
	keyWait
	clearMsg
	"ちょっと、たべすぎちゃったかねえ"
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ゴハンは たべたし、ながめは いいし
	ここは、てんごくだね!
	"""
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	どんどん ニホンが ちかづいてくるわ!
	カミングスーンよ!
	"""
	keyWait
	clearMsg
	"まってなさいよ、ニホンしょく!!"
	keyWait
	clearMsg
	"うどん、テンプラ、ちゃんこナベ!"
	keyWait
	clearMsg
	"たべつくすわよ!!"
	keyWait
	end
}
script 43 mmbn2 {
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
	waitSkip
		frames = 20
	"・"
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	おそと くも ばっかりで
	つまんなーーい
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"おにいちゃん あそんでちょうだい"
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
	"ダメ?"
	keyWait
	clearMsg
	"ウルウル・・・"
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"いもうとたちが さわぎだした みたいだ"
	keyWait
	clearMsg
	"コラ、ふたりとも しずかにしなさーい!"
	keyWait
	clearMsg
	"""
	いまは、ボクが、ほごしゃ だからね!
	しっかりしなきゃ!
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	さっき、うしろのほうから、
	さけびごえ みたいなのが きこえマシタ
	"""
	keyWait
	clearMsg
	"なんだったんでしょう?"
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ぬがーー! ぬがーー!!
	やめて、やめて! わーー!
	た、たすけてーーーーー
	"""
	keyWait
	clearMsg
	"ハッ!!"
	keyWait
	clearMsg
	"""
	ゆ、ユメか・・・
	こんなトコロで シゴトの
	ユメをみるとは・・・
	"""
	keyWait
	clearMsg
	"つかれてるんだな・・・オレ・・・"
	keyWait
	clearMsg
	"ムニャムニャ・・・グー"
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	さっきから となりのヒトの
	ねごとが スゴいんだよ・・・
	"""
	keyWait
	clearMsg
	"よっぽど おつかれなのかねえ"
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	さいこうの ながめだ・・・
	すべてが・・・パーフェクト・・・
	さいこうの ひこうきだ・・・
	"""
	keyWait
	clearMsg
	"うっとり・・・"
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	さっき、この うしろの ヘヤから
	さけびごえと、ナニかがたおれるような
	おとがしたけど、
	"""
	keyWait
	clearMsg
	"""
	ひこうきの なかだけに
	そらみみ よね
	なんちゃって!
	"""
	keyWait
	clearMsg
	"やーね! アメロピアンジョークよ!"
	keyWait
	end
}
script 58 mmbn2 {
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
script 66 mmbn2 {
	checkItem
		item = 31
		amount = 1
		jumpIfEqual = 68
		jumpIfGreater = 68
		jumpIfLess = continue
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"ん? どうしたのかえ?"
	keyWait
	clearMsg
	"・・・このワリバシかえ?"
	keyWait
	clearMsg
	"""
	あぁ~、このワリバシはの、
	ウチのジイさんがつくったものなんじゃ
	"""
	keyWait
	clearMsg
	"""
	ワタシとジイさんは、ふたりで
	ワリバシを つくって45ねん なんじゃ
	"""
	keyWait
	clearMsg
	"ワタシとジイさんには ユメがあっての、"
	keyWait
	clearMsg
	"""
	ふたりでつくったワリバシをもって
	がいこくを りょこうして、
	"""
	keyWait
	clearMsg
	"""
	がいこくのヒトにワリバシの よさを
	しってもらうコトだったんじゃ・・・
	"""
	keyWait
	clearMsg
	"""
	くろうして、おカネをためて
	いざしゅっぱつ と、おもった やさき
	ジイさんは、とつぜんいってしもうた・・・
	"""
	keyWait
	clearMsg
	"""
	ワタシら ふうふは、
	ふたりで ひとつじゃった
	"""
	keyWait
	clearMsg
	"""
	でもの、とつぜんワタシたちは
	ひきはなされてしもうた・・・
	"""
	keyWait
	clearMsg
	"""
	ほんとに、ワリバシみたいな
	ふうふじゃの・・・
	"""
	keyWait
	clearMsg
	"""
	ジイさんが しんだときは ホントに
	かなしかった
	"""
	keyWait
	clearMsg
	"でもの、ジイさんとのユメを かなえるため"
	keyWait
	clearMsg
	"""
	ヒトリで アメロッパに
	行くことにしたんじゃ
	"""
	keyWait
	clearMsg
	"""
	さすが、ジイさんの つくったワリバシじゃ
	アメロッパのヒトたちも、このハシの
	よさを、わかってくれたようでの・・・
	"""
	keyWait
	clearMsg
	"ワタシは、うれしくてうれしくて・・・"
	keyWait
	clearMsg
	"ヨヨヨ・・・"
	keyWait
	clearMsg
	"""
	・・・すまないね、ながながと
	はなしこんでしまって
	"""
	keyWait
	clearMsg
	"""
	「ジイさんとの であい」へん もあるけど
	きくかい?
	"""
	keyWait
	clearMsg
	"""
	ん? いそいでるのかい・・・
	そうかい ざんねんだねぇ
	"""
	keyWait
	clearMsg
	"""
	で、このワリバシが ほしいんじゃな?
	たくさんあるでの、
	いくらでも もっておいきよ
	"""
	keyWait
	clearMsg
	jump
		target = 67
}
script 67 mmbn2 {
	msgOpen
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 31
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 31
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
script 68 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	ジイさんのコトおもいだして
	きちまったよ
	"""
	keyWait
	end
}
script 69 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	あっ! しまがみえる~
	すご~い!!
	"""
	keyWait
	clearMsg
	"""
	わぁ~スゴいな~
	キャッキャッ
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	ずるいよ~!
	あたしも おそとみる~!
	"""
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	おお! ホントにしまがみえるよ!
	ちず みたいだ~!
	"""
	keyWait
	clearMsg
	"すっげ~"
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ヘイ、さっきから あちこち
	うごきまわってマスけど、
	"""
	keyWait
	clearMsg
	"ナニかあったんデスか~?"
	keyWait
	end
}
script 73 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"う、ううん・・・"
	keyWait
	clearMsg
	"""
	ね、ねむい・・・しかし、
	ねむるワケには いかん!
	"""
	keyWait
	clearMsg
	"""
	ねむると また、あの オニしゃちょうが
	ユメに・・・
	"""
	keyWait
	clearMsg
	"うううん・・・グーーー・・・"
	keyWait
	clearMsg
	"""
	た、たすけて たすけて!
	ヒイイイイイイイ!!
	"""
	keyWait
	clearMsg
	"ううん・・・ムニャムニャ・・・"
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ハァ、ニホンについてしまうと、
	この ひこうきから、おりないと
	いけないんだね・・・
	"""
	keyWait
	clearMsg
	"ハァ・・・"
	keyWait
	clearMsg
	"もっと のっていたいのに"
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	ニホンじゅうの かんこうめいしょの
	しゃしんを とりまくるわよ~!!
	"""
	keyWait
	clearMsg
	"""
	とくに、オフィシャルセンターの
	しゃしんは いっぱいとるわよ~
	"""
	keyWait
	clearMsg
	"この じまんのキャメラでね・・・"
	keyWait
	clearMsg
	"""
	あーーーーーー!!
	カメラ わすれてきちゃった!!
	"""
	keyWait
	end
}
script 76 mmbn2 {
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
script 85 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	こわいよ~!
	エーーーン! エーーーン!
	"""
	keyWait
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	パパ~!!
	ワーーーーーーーン!!
	"""
	keyWait
	end
}
script 87 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ふたりとも!!"
	keyWait
	clearMsg
	"""
	シートベルトにしっかり
	つかまってろ!!
	"""
	keyWait
	clearMsg
	"にいちゃんが ついてるぞ!!"
	keyWait
	end
}
script 88 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	オー!! いったいなにが
	おこったのですか!!?
	"""
	keyWait
	end
}
script 89 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	しゃ、しゃちょー!!
	そんなに ゆらさないでくださーーーい!
	"""
	keyWait
	clearMsg
	"""
	ハ、まだゆれてる・・・?
	ん・
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
	ワ、ワーー
	ゆ、ユメじゃなーーーーい!!
	"""
	keyWait
	clearMsg
	"たーすーけーてー!!"
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	はわわわわわわわ
	じいさんや~
	もうすぐ そっちに行くぞい
	"""
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"""
	ハハハハ!
	たびにトラブルは つきものさ・・・
	"""
	keyWait
	clearMsg
	"""
	って、でも こんかいは、
	フツーじゃなーい!
	"""
	keyWait
	clearMsg
	"わーーーーーーーーっ!!"
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	きゃー! しぬのはイヤーー
	ぜったい いきてニホンに
	いくんだから~!!
	"""
	keyWait
	end
}
script 93 mmbn2 {
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
script 100 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	こわかったよーーー
	ヒーーーーン!!
	"""
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	もう、だいじょうぶ なんだよね?
	ヒック、ヒック
	"""
	keyWait
	end
}
script 102 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	たすかったんだね~!
	よかったぁぁぁぁぁ
	"""
	keyWait
	clearMsg
	"ワーーーーン"
	keyWait
	end
}
script 103 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ブラボーー!!
	ウイ アー アライブ!!
	"""
	keyWait
	clearMsg
	"ホーーー!!"
	keyWait
	end
}
script 104 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	まったく、ユメのような
	じけんだった・・・
	"""
	keyWait
	clearMsg
	"""
	なには ともあれ、たすかったワケだ
	フーーー・・・
	"""
	keyWait
	end
}
script 105 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	じいさんが、まもってくれたんじゃ・・・
	じいさんや、ありがとう・・・
	"""
	keyWait
	end
}
script 106 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportMan
	msgOpen
	"おお、カミよ ありがとうございます!!"
	keyWait
	end
}
script 107 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"こ、こしがぬけちゃったわ・・・"
	keyWait
	end
}
script 110 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 125
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ひこうきの てんじを はじめた
	やさきに、この じしん・・・
	"""
	keyWait
	clearMsg
	"おきゃくさんが、ぜんぜんきません"
	keyWait
	end
}
script 120 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	こんなときは、のんびり
	じしんが おさまるのをまつのが、
	きちですね
	"""
	keyWait
	clearMsg
	"""
	この ひこうきの中は、あんぜんだから
	いえるコトなんですけどね
	"""
	keyWait
	end
}
script 125 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	じしんが、おさまって
	じょじょに おきゃくさんが
	くるようになりました
	"""
	keyWait
	end
}
script 130 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"""
	ウイルスの しんぱいは もちろんですが
	ふしんぶつの チェックも
	おろそかには できませんからね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 55
		upper = 255
		jumpIfInRange = 221
		jumpIfOutOfRange = continue
	msgOpen
	"""
	熱斗のざせきだ
	ほかのせきと、なんら かわりはない
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	エコノミークラスの ざせきだ
	それなりに、すわりごこちは
	よさそうだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	プラグインできるタイプの テレビだ
	しかし、ひとむかしまえの カタだ
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	カーテンがしまっているので、
	はいっては いけない
	"""
	keyWait
	end
}
script 224 mmbn2 {
	checkChapter
		lower = 55
		upper = 255
		jumpIfInRange = 227
		jumpIfOutOfRange = continue
	msgOpen
	"""
	うつくしいうみに うかぶ
	しまじまが みえる
	"""
	keyWait
	clearMsg
	"まるで、「はこにわ」のようだ"
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"そとへ でるタメのトビラだ"
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	エアコンをちょうせいするタメの
	コントロールパネルだ・・・
	"""
	keyWait
	clearMsg
	"プラグインはできない"
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	くうこうのようすが みえる
	たくさんのひこうきが ならんでいる
	"""
	keyWait
	end
}
