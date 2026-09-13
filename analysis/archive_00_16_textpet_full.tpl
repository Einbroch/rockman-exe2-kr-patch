@archive 0750D38
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 23
		upper = 31
		jumpIfInRange = 1
		jumpIfOutOfRange = continue
	flagSet
		flag = 593
	wait
		frames = 1
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ロックマンと チカラを あわせて
	ガンバるんだぞ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 28
		upper = 28
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 17
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	オフィシャルネットバトラーを
	インターネットに はいび してるから
	"""
	keyWait
	clearMsg
	"""
	テキも、そう やすやすとは、
	わがクニに、しんにゅうするコトはできない
	キミも、あんしん していなさい
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 18
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	テキに、わがクニのセキュリティの
	ゆうしゅうさを、おもいしらせてやる!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 98
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 91
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 86
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 74
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 19
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	おっと、このさきは
	かんけいしゃいがい、
	たちいりきんしだよ
	"""
	keyWait
	clearMsg
	"なにがあるかって?"
	keyWait
	clearMsg
	"""
	それはね、このクニの ずのうといわれる
	マザーコンピュータがあるんだよ
	"""
	keyWait
	clearMsg
	"""
	マザーコンピュータは、このクニの
	じゅうような、きのうを
	せいぎょしているんだ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 99
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 92
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 87
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 22
		jumpIfOutOfRange = continue
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Maid
	msgOpen
	"""
	おひるの ちゅうもんを
	とりに きたんだけど・・・
	"""
	keyWait
	clearMsg
	"""
	なんか、おとりこみちゅう みたいで
	なかなか、ヘヤに はいりづらいわね
	"""
	keyWait
	end
}
script 15 mmbn2 {
	checkFlag
		flag = 622
		jumpIfTrue = 31
		jumpIfFalse = continue
	checkFlag
		flag = 620
		jumpIfTrue = 30
		jumpIfFalse = continue
	checkFlag
		flag = 616
		jumpIfTrue = 16
		jumpIfFalse = continue
	flagSet
		flag = 617
	wait
		frames = 1
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ムチャするんじゃないぞ!"
	keyWait
	end
}
script 17 mmbn2 {
	checkFlag
		flag = 620
		jumpIfTrue = 32
		jumpIfFalse = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ま、まさかオフィシャルスクエアに!?
	いったいどこから はいりこんだんだ!?
	"""
	keyWait
	end
}
script 18 mmbn2 {
	checkFlag
		flag = 620
		jumpIfTrue = 20
		jumpIfFalse = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	くそっ、まさかわがクニの
	セキュリティが こうもカンタンに
	とっぱされるだなんて!!
	"""
	keyWait
	end
}
script 19 mmbn2 {
	checkFlag
		flag = 620
		jumpIfTrue = 21
		jumpIfFalse = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	オフィシャルスクエアに
	テキがしんにゅう!?
	"""
	keyWait
	clearMsg
	"そんなバカな!?"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	はやく、マザーコンピュータルームに
	むかわないと!!
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	マザーコンピュータに
	テキがしんにゅう!?
	それは、ヤバいぞ!!
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"ど、どうしようかしら・・・"
	keyWait
	clearMsg
	"""
	ここまできて ちゅうもんをきかずに
	かえるなんて ウェイトレスの
	ホコリにかけて できないわ
	"""
	keyWait
	clearMsg
	"""
	でも、そんな じょうきょうじゃ
	なさそうだし・・・
	"""
	keyWait
	end
}
script 30 mmbn2 {
	flagSet
		flag = 621
	wait
		frames = 1
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"熱斗たのんだぞ!"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	マザーコンピュータまでやられたら
	ニホンは おわりだ・・・
	"""
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"""
	どんどん、ワルいじょうきょうに
	なってるみたいね・・・
	"""
	keyWait
	clearMsg
	"""
	ずっと、ハナシを たちぎき
	してるんだけど
	"""
	keyWait
	clearMsg
	"""
	このままじゃ、ニホンしゃかいは、
	だいこんらんよ!!
	"""
	keyWait
	clearMsg
	"""
	そうなったら、おひるの
	ちゅうもんどころじゃ なくなっちゃうわ
	"""
	keyWait
	clearMsg
	"オフィシャルさん、ガンバって!!"
	keyWait
	end
}
script 50 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	いくら じゅうようしせつ だからって
	こんなに 入りくんだ つうろに
	しなくても いいのに・・・
	"""
	keyWait
	clearMsg
	"ハァ、ハァ・・・"
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	わがクニの セキュリティは
	ゆうしゅうだと おもって いたんだが
	・・・
	"""
	keyWait
	clearMsg
	"「ゴスペル」・・・"
	waitSkip
		frames = 30
	"\nいったい なにものたち なんだろうか?"
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	あの じけんから
	マザーコンピュータの けいびを
	いっそう きょうか したんだ
	"""
	keyWait
	clearMsg
	"""
	だが、キミを
	とおさないわけには いかないな
	"""
	keyWait
	end
}
script 53 mmbn2 {
	checkChapter
		lower = 66
		upper = 72
		jumpIfInRange = 121
		jumpIfOutOfRange = continue
	checkChapter
		lower = 65
		upper = 65
		jumpIfInRange = 112
		jumpIfOutOfRange = continue
	checkChapter
		lower = 64
		upper = 64
		jumpIfInRange = 102
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	光さんなら
	さっきまで いたんですけど・・・
	"""
	keyWait
	clearMsg
	"""
	わがクニの ネットナビ かいはつの
	エース だけあって
	かなり おいそがしいんですよ
	"""
	keyWait
	clearMsg
	"""
	出ていかれるまえに パソコンの あたりで
	ゴソゴソ してましたけど・・・
	"""
	keyWait
	end
}
script 54 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 103
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	わが ぼこく アメロッパは
	ニホンと おなじか それいじょうに
	ネットワーク学が はってん しているよ
	"""
	keyWait
	end
}
script 55 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 104
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	今は マザーコンピュータの
	セキュリティを ふっきゅう しています
	"""
	keyWait
	clearMsg
	"""
	こんどこそ
	ぜったいに しんにゅう されないようにね
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	アメロッパの じけん
	よく かいけつしてくれた
	"""
	keyWait
	clearMsg
	"""
	けど、あんまり ママに
	しんぱいかけるなよ
	"""
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	アメロッパを、ねらうなんて
	なんと だいたんふてきな・・・
	"""
	keyWait
	clearMsg
	"""
	じけんの きょうあくさと
	ヤツらの つかうナビの ツヨさは
	WWWよりも うえか・・・
	"""
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	もっと、セキュリティを きょうかする
	ひつようが あるな・・・
	"""
	keyWait
	end
}
script 73 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ぜんかいの、マザーコンピュータ
	しんにゅうじけんや、
	アメロッパの じけんで
	"""
	keyWait
	clearMsg
	"""
	さらに、ゴスペルの ツヨさの
	そこが みえなくなったわ
	"""
	keyWait
	clearMsg
	"""
	あと、どれだけの せんりょくを
	もっているのかしら・・・
	"""
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	アメロッパじょうも しゅうげき
	されたらしいね
	"""
	keyWait
	clearMsg
	"""
	やはり、マザーコンピュータの
	けいびを、よりげんじゅうに
	しないとな
	"""
	keyWait
	end
}
script 80 mmbn2 {
	checkItem
		item = 34
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 81
	flagSet
		flag = 619
	wait
		frames = 1
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"今は 手が はなせないんだ・・・"
	keyWait
	clearMsg
	"""
	アトで きてくれないか?
	スマンな・・・熱斗
	"""
	keyWait
	end
}
script 82 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 95
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 88
		jumpIfOutOfRange = continue
	checkFlag
		flag = 593
		jumpIfTrue = 83
		jumpIfFalse = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	光さんなら、
	インターネットに はっせいした
	こおりの ちょうさを しにいったよ
	"""
	keyWait
	clearMsg
	"もうすぐ かえってくるんじゃないかな?"
	keyWait
	clearMsg
	"""
	「あかのなんとか」が ひつようだ、
	とかなんとか いってたかな?
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"しりょうを あつめなければ!!"
	keyWait
	end
}
script 84 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 96
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 89
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	ほとんどの オフィシャルは、
	さいがいの たいおうに おわれているよ
	"""
	keyWait
	clearMsg
	"""
	なんとしても ヒガイを
	さいしょうげんに くいとめないと
	いけないからね
	"""
	keyWait
	end
}
script 85 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 97
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	とつぜん 世界中で まきおこる
	てんぺんちい・
	"""
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	keyWait
	clearMsg
	"なんか ニオうわね・・・"
	keyWait
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	じしんの こんらんに じょうじて
	マザーコンピュータに しんにゅう
	しようとする ヤツが いるかもしれない
	"""
	keyWait
	clearMsg
	"気を つけなければ!!"
	keyWait
	end
}
script 87 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"""
	な、なんなのよ いったい!?
	いきなり、じしんがおきて
	"""
	keyWait
	clearMsg
	"""
	オフィシャルのヒトが
	「ひなんしろー」って・・・
	"""
	keyWait
	end
}
script 88 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"じしんについての しりょうは・・・!"
	keyWait
	clearMsg
	"""
	かんきょういじシステムは
	光さんが きっと なんとかしてくれる!
	"""
	keyWait
	clearMsg
	"""
	ワタシたちは、
	ワタシたちに できるコトを
	せいいっぱい やるしかないんだ!
	"""
	keyWait
	end
}
script 89 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	みんかんには ひなんかんこくを
	はつれいしたから、おそらく みな
	ひなんを はじめているだろう
	"""
	keyWait
	clearMsg
	"""
	キミの ウイルスバスティングの ウデは
	みとめるけど、あまり ムチャをしては
	いけないよ
	"""
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	まんいちに そなえて
	いりょうきぐの てはいを しなくちゃ
	・・・
	"""
	keyWait
	clearMsg
	"""
	それと
	ひじょうようの しょくりょうの かくほ、
	"""
	keyWait
	clearMsg
	"それから・・・"
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	ついに みんかんに
	ひなんかんこくが 出たか・・・
	"""
	keyWait
	clearMsg
	"""
	じょうきょうが
	かなり あっか してきたようだな
	"""
	keyWait
	clearMsg
	"""
	でも、オレは このもちばを
	はなれるわけには いかない!!
	"""
	keyWait
	clearMsg
	"""
	このトビラの けいびこそ
	オレの いきがい!!
	"""
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"""
	さっき、おくのヘヤにいるヒトの
	ハナシを たちぎき したんだけど
	かなり ヤバい じょうきょうみたいね
	"""
	keyWait
	end
}
script 95 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	光さんは
	まだ かえって こられていないよ
	"""
	keyWait
	clearMsg
	"""
	でも、かっこくの てんぺんちいも
	おさまり いっけんらくちゃく かな
	"""
	keyWait
	end
}
script 96 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	しかし、こんかいの てんぺんちいも
	ゴスペルの しわざ だったとは・・・
	"""
	keyWait
	clearMsg
	"おそろしい ヤツらだった・・・"
	keyWait
	end
}
script 97 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	じけんかいけつの
	れんらくを するときが、
	イチバン ホッとできる しゅんかんね
	"""
	keyWait
	end
}
script 98 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	じしんは おさまったか・・・
	でも、オレは ゆだんしない!
	"""
	keyWait
	clearMsg
	"""
	いつなんどき
	じゃあくな しんにゅうしゃが
	やってくるか わからないからね!!
	"""
	keyWait
	end
}
script 99 mmbn2 {
	mugshotShow
		mugshot = Maid
	msgOpen
	"""
	たすかったみたいね・・・
	さぁ、バイトにもどらなきゃ・・・
	"""
	keyWait
	clearMsg
	"""
	でも、おきゃくさんも いないわよね
	今日は、やすんじゃおっ!
	"""
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"ハァ、ハァ・・・"
	keyWait
	clearMsg
	"""
	この いそがしい ときに
	この おうふくは こたえるよ
	"""
	keyWait
	end
}
script 101 mmbn2 {
	checkChapter
		lower = 66
		upper = 72
		jumpIfInRange = 122
		jumpIfOutOfRange = continue
	checkChapter
		lower = 65
		upper = 65
		jumpIfInRange = 111
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"光さんの ムスコさんか・・・"
	keyWait
	clearMsg
	"""
	光さんが いないから いうが
	しょうじき われわれは
	キミに きたい しているんだ
	"""
	keyWait
	clearMsg
	"""
	なさけないと おもうかも しれないが、
	それほど オフィシャルの ダメージは
	大きいと いうことだ・・・
	"""
	keyWait
	end
}
script 102 mmbn2 {
	checkChapter
		lower = 65
		upper = 72
		jumpIfInRange = 112
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	光さんは べっしつで
	ゴスペルたいさくを ねっています
	"""
	keyWait
	clearMsg
	"""
	ざんねん ですが
	今は おあいできません・・・
	"""
	keyWait
	end
}
script 103 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	わが ぼこく アメロッパを はじめ
	世界中で ウイルスの ひがいが
	ひどく なってきているようです
	"""
	keyWait
	clearMsg
	"""
	このままだと 世界は
	ゴスペルの手に おちてしまいます!!
	"""
	keyWait
	end
}
script 104 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	すでに いちぶの ちいきでは
	ウイルスのせいで ネットワークが
	つかえなく なっているわ
	"""
	keyWait
	clearMsg
	"""
	ひがいのきぼは きっと これから
	ますます 大きく なっていく・・・
	"""
	keyWait
	end
}
script 110 mmbn2 {
	checkChapter
		lower = 66
		upper = 72
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	flagSet
		flag = 532
	wait
		frames = 1
	end
}
script 111 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"光さんの ムスコさんか・・・"
	keyWait
	clearMsg
	"""
	ゴスペルを たおすため われわれも
	もちろん ぜんりょくを つくしている
	"""
	keyWait
	clearMsg
	"しかし・・・"
	keyWait
	end
}
script 112 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"光さん もどられてますよ"
	keyWait
	end
}
script 120 mmbn2 {
	checkFlag
		flag = 310
		jumpIfTrue = 190
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	熱斗、くれぐれも
	ムリは するなよ・・・
	"""
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	じつの ムスコを
	コトブキ町に おくりこむなんて・・・
	"""
	waitSkip
		frames = 10
	"\n光さんは ユウキのある かたですね"
	keyWait
	end
}
script 122 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"はなしは きいていたよ・・・"
	keyWait
	clearMsg
	"""
	WWWじけんの ときに
	光さんが はなしたと おもうけど、
	"""
	keyWait
	clearMsg
	"""
	ロックマン.EXEは
	キミの ふたごのお兄さんの
	うまれかわり・・・
	"""
	keyWait
	clearMsg
	"""
	キミたちが ココロを ひとつにすれば
	そうぞうを こえた力を
	はっきすることが できるはずだ!
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 244
		jumpIfTrue = 201
		jumpIfFalse = continue
	checkFlag
		flag = 314
		jumpIfTrue = 200
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	よく ここまで、たどりついたな
	熱斗、ロックマン
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
	"やっぱりココが、せいかい だったんだね"
	keyWait
	clearMsg
	"""
	ナビ・マスター!!
	でてこーーーーい!!
	"""
	keyWait
	clearMsg
	"""
	オレたちと、ネットバトルで
	しょうぶしろい!
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ハハハ、そんなにおおきな コエを
	ださなくったって
	"""
	keyWait
	clearMsg
	"ナビ・マスターは、もう きているよ"
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ドコ? ドコ ドコ?"
	keyWait
	clearMsg
	jump
		target = 194
}
script 194 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん・・・もしかしたら・・・"
	keyWait
	clearMsg
	jump
		target = 195
}
script 195 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	さすが、ロックマン
	きが ついたか?
	"""
	keyWait
	clearMsg
	"""
	そのとおり パパが、
	「ナビ・マスター」だ!
	"""
	keyWait
	clearMsg
	"""
	パパは、ナビけんきゅうの タメに
	さまざまな、ナビのデータを
	あつめているんだ
	"""
	keyWait
	clearMsg
	"さぁ、熱斗 パパに かかってこい!"
	keyWait
	clearMsg
}
script 196 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"えーーーっ そうだったの!!"
	keyWait
	clearMsg
	"""
	でも、パパに かたなくっちゃ
	しけんに ごうかくできないし・・・
	"""
	keyWait
	clearMsg
	"""
	よーし、ロックマン
	パパに、オレたちの じつりょくを
	みせてやろうぜ!!
	"""
	keyWait
	clearMsg
	jump
		target = 197
}
script 197 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!!"
	keyWait
	clearMsg
}
script 198 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"さあ、こい!!"
	keyWait
	flagSet
		flag = 314
	flagSet
		flag = 313
	msgClose
	waitHold
}
script 199 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	どうした? 熱斗、ロックマン
	そんなんじゃ、しけんには
	ごうかくできないぞ!
	"""
	keyWait
	clearMsg
	"もう いっちょくるか!?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"もちろん! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちょっとまって"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 198,
			jump = continue,
			jump = continue
		]
	"""
	いつでも、おいで
	でも パパをたおさないと、
	だい2もん には、すすめないぞ!
	"""
	keyWait
	end
}
script 200 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	熱斗、じゅんびは、できたか?
	パパは、いつでもOKだぞ!!
	"""
	keyWait
	clearMsg
	"さ、かかってこい!\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"いくぞ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちょっとまって"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 198,
			jump = continue,
			jump = continue
		]
	"""
	いつでも、おいで
	でも パパをたおさないと、
	だい2もん には、すすめないぞ!
	"""
	keyWait
	end
}
script 201 mmbn2 {
	flagSet
		flag = 244
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	つよくなったな 熱斗、ロックマン
	おまえたちなら、きっと ごうかくできるぞ
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 22
		upper = 27
		jumpIfInRange = continue
		jumpIfOutOfRange = 236
	msgOpen
	"""
	カギがかかっていて
	ひらくコトはできない・・・
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	セキュリティようの、カードリーダーだ
	しかし、いまは つかわれていないようだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	パパが、けんきゅうにつかうモニターだ
	ナビのけんきゅうようだけに
	プラグインできる
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	エレベーターの トビラが ひらいた!
	1かいの ロビーへ 行こう!
	"""
	keyWait
	flagSet
		flag = 36
	startWarp
		warp = 1
	end
}
script 224 mmbn2 {
	msgOpen
	mugshotShow
		mugshot = MegaMan
	"熱斗くん、スイッチおさなきゃ"
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ロッカーのなかには
	インスタントしょくひんが
	ならんでいる
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	けんきゅうようの しりょうが
	ならんでいる
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	たくさんの ファイルが
	おさめられている
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"だっしゅうざい しかはいっていない"
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"""
	パパの パソコンだ
	かってに プラグイン できないように
	してある
	"""
	keyWait
	end
}
script 230 mmbn2 {
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 240
		jumpIfOutOfRange = continue
	msgOpen
	"""
	「さわらないで ください」
	と かいてある
	"""
	keyWait
	end
}
script 231 mmbn2 {
	msgOpen
	"""
	パパの けんきゅうぎだ・・・
	パパの ニオイがする
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 319
		jumpIfTrue = continue
		jumpIfFalse = 242
	jump
		target = 241
	end
}
script 232 mmbn2 {
	msgOpen
	"しゃしんたてだ・・・"
	keyWait
	clearMsg
	"""
	パパとママ、そしてこどもたちが
	うつっている
	"""
	keyWait
	end
}
script 234 mmbn2 {
	msgOpen
	"""
	デカいモニターだ
	いったい なんインチあるのだろう・・・
	"""
	keyWait
	clearMsg
	"""
	さすが、オフィシャルセンターの
	かいぎしつだ
	"""
	keyWait
	clearMsg
	"""
	はしにある、コントロールパネルから
	プラグインできる
	"""
	keyWait
	end
}
script 235 mmbn2 {
	msgOpen
	"""
	オフィシャルネットバトラーたちが
	ぎろんをかわす かいぎ つくえだ
	"""
	keyWait
	end
}
script 236 mmbn2 {
	msgOpen
	"""
	マザーコンピュータべやに
	つながるトビラだ
	"""
	keyWait
	end
}
script 240 mmbn2 {
	msgOpen
	"パパの おきがきが ある・・・"
	keyWait
	clearMsg
	"「せっかく きてもらったのに ゴメンな\n このバトルチップ、けっこう つかえる\n はずだから よかったら つかってくれ」"
	keyWait
	clearMsg
	checkFlag
		flag = 597
		jumpIfTrue = 241
		jumpIfFalse = continue
	flagSet
		flag = 597
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 119
		code = I
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 119
	" "
	printCode
		buffer = 0
		code = I
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	end
}
script 241 mmbn2s {
	end
}
script 242 mmbn2 {
	flagSet
		flag = 319
	msgOpen
	"ゴソゴソ"
	textSpeed
		delay = 10
	"・・・"
	textSpeed
		delay = 2
	keyWait
	clearMsg
	"""
	熱斗は
	ポケットの中を さぐってみた・・・
	"""
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGive
		item = 97
		amount = 1
	"""
	熱斗は、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 97
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	end
}
