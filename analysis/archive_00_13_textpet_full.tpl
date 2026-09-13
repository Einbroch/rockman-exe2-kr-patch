@archive 074DC28
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 140
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 130
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 110
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 47
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 17
		upper = 17
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 31
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkItem
		item = 59
		amount = 1
		jumpIfEqual = 15
		jumpIfGreater = 15
		jumpIfLess = continue
	checkItem
		item = 4
		amount = 1
		jumpIfEqual = 7
		jumpIfGreater = 7
		jumpIfLess = continue
	checkFlag
		flag = 590
		jumpIfTrue = continue
		jumpIfFalse = 15
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ようこそ オフィシャルセンターへ"
	keyWait
	clearMsg
	"どうしたの ボク? "
	waitSkip
		frames = 30
	"""
	まさか
	ライセンスしけんを うけにきた
	わけじゃ ないわよね?
	"""
	keyWait
	clearMsg
	mugshotHide
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"うん、ちがうよ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ううん、しけんを うけにきたんだ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = continue,
			jump = 1,
			jump = continue
		]
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	そうよね
	じゃあ オフィシャルの 人の
	ジャマに ならないように、しずかにね
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	あら、ボク
	まだ 小学生にしか 見えないけど?
	"""
	keyWait
	clearMsg
	"じゃあ PETを 見せてくれる?\n"
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
			jump = 2,
			jump = continue,
			jump = continue
		]
	"""
	う~ん、じゃあ しけんの
	じゅけんひょうは わたせないわね
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ほんとだ、ちゃんと\n"
	printItem
		buffer = 0
		item = 58
	" もってるのね"
	waitSkip
		frames = 30
	"\nうたがって ゴメンね"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 4
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 4
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
		target = 7
}
script 4 mmbn2 {
	checkFlag
		flag = 590
		jumpIfTrue = continue
		jumpIfFalse = 16
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	おっと キミ、この先は
	Bより上の ライセンスを もっている
	ネットバトラーしか 行けないんだ
	"""
	keyWait
	clearMsg
	printItem
		buffer = 0
		item = 58
	"""
	じゃ ダメなんだ
	しけんの じゅけんひょうでも もってれば
	ベツ だけどね
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 131
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 111
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 44
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 19
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	checkItem
		item = 59
		amount = 1
		jumpIfEqual = 20
		jumpIfGreater = 20
		jumpIfLess = continue
	checkItem
		item = 4
		amount = 1
		jumpIfEqual = 6
		jumpIfGreater = 6
		jumpIfLess = continue
	checkFlag
		flag = 590
		jumpIfTrue = continue
		jumpIfFalse = 16
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	キミ、どこ行くんだい? この先は
	Bより上の ライセンスを もっている
	ネットバトラーしか 行けないんだ
	"""
	keyWait
	clearMsg
	printItem
		buffer = 0
		item = 58
	"""
	じゃ ダメなんだ
	しけんの じゅけんひょうでも もってれば
	ベツ だけどね
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	printItem
		buffer = 0
		item = 4
	"""
	 もらったのかい?
	じゃ この先で てつづきを うけてね
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	しけんかいじょうへは
	このカウンターの むかいにある つうろを
	すすんでね
	"""
	keyWait
	end
}
script 8 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 133
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 113
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 103
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 89
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	オフィシャルセンターでは
	ネットバトラーの ライセンスしけんを
	おこなったり、
	"""
	keyWait
	clearMsg
	"""
	しみんから よせられた
	ネットじけん かいけつの いらいなどを
	うけおっています
	"""
	keyWait
	clearMsg
	"""
	もちろん 上のフロアには
	ネットはんざいに たいこうする
	ほんぶそしき なども あります
	"""
	keyWait
	end
}
script 9 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 141
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 132
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 122
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 112
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 102
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 83
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 21
		jumpIfInRange = 34
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	さいきん また ネットはんざいが
	ふえてきて、たくさんの人が いらいを
	もちこんでくるように なりました
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ウチのレンジが 火を ふいたんだよ!
	はやく たすけに きとくれよ!
	"""
	keyWait
	clearMsg
	"""
	え、ハナシが ふるい?
	なんのことだい?
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	ボクのラジコン こわれちゃったの
	なおしてもらったんだ!
	"""
	keyWait
	clearMsg
	"ウイルスが わるさ してたんだって"
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	小学生で Sきゅうを とった
	すごウデの オフィシャルネットバトラーが
	いるって ハナシ らしいですよ
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	それなら ワシも きいたことがある
	たしか名を 炎山とか なんとか・・・
	"""
	keyWait
	end
}
script 14 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 142
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 93
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	オレたち オフィシャルネットバトラーは
	ちゅうやを とわず、ネットはんざい
	ぼくめつのために かつどうしている
	"""
	keyWait
	clearMsg
	"""
	たとえ ネットマフィアが
	このクニに やってきても
	オレたちが いれば あんしんさ!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ようこそ オフィシャルセンターへ"
	keyWait
	end
}
script 16 mmbn2 {
	checkItem
		item = 4
		amount = 1
		jumpIfEqual = 6
		jumpIfGreater = 6
		jumpIfLess = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	キミ、どこ行くんだい? この先は
	Bより上の ライセンスを もっている
	ネットバトラーしか 行けないんだ
	"""
	keyWait
	clearMsg
	printItem
		buffer = 0
		item = 58
	"""
	を もっていれば
	そのうち Bライセンスの しけんの
	あんないが とどくはずだよ
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	あら? アタシだって
	オフィシャルネットバトラー なのよ
	"""
	keyWait
	clearMsg
	"""
	見かけで はんだんしたら
	イタイ目に あっちゃうかもね!
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	さいきん じけんが おおいから
	オフィシャルネットバトラーは
	みんな いそがしそうだよ
	"""
	keyWait
	clearMsg
	"""
	われわれの エースネットバトラーの
	炎山くんなんかは とくにね
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ようこそ、オフィシャルセンターへ"
	keyWait
	end
}
script 31 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 144
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 117
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 31
		jumpIfInRange = 54
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	やあ! ネットバトルの れんしゅうは
	やってるかい?
	まいにち やらないと ウデがにぶるぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 32 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	キミは、たしか ライセンスを
	もっているよね
	"""
	keyWait
	clearMsg
	"""
	ここ オフィシャルセンターは、
	ニホンの セキュリティシステムと
	いわれているのは、しっているかい?
	"""
	keyWait
	clearMsg
	"""
	ここは、しみんの あんしんと
	あんぜんの しょうちょうなんだ
	"""
	keyWait
	clearMsg
	"""
	ネットバトラーの ライセンスを
	もつというコトは、
	"""
	keyWait
	clearMsg
	"""
	オフィシャルの カンバンを せおう
	というコトだ
	"""
	keyWait
	clearMsg
	"""
	それだけの、せきにんかんを
	もって こうどうして くれたまえ
	"""
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	WWWじけん いこう、
	きょうあくな ネットはんざいが
	きゅうぞう しています
	"""
	keyWait
	clearMsg
	"""
	オフィシャルが いそがしいと いうコトは
	それだけ ネットワークしゃかいが
	みだれている というコト なんです
	"""
	keyWait
	clearMsg
	"""
	・・・それより そこのヘンなきかい、
	今日きたら きゅうに おいてあったけど
	いったい だれが おいていったんだ?
	"""
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	はんざいは、おきてから
	たいしょしていては、おそいのです
	"""
	keyWait
	clearMsg
	"""
	みんかんのかたに、「ぼうはん いしき」を
	たかめてもらうように、よびかけています
	"""
	keyWait
	end
}
script 35 mmbn2 {
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	きょうだけで 3けんの じけんを
	かいけつ してきたよ
	"""
	keyWait
	clearMsg
	"""
	オフィシャルにくる、いらいは、
	ウイルスバスティングだけじゃなく
	"""
	keyWait
	clearMsg
	"""
	まいごさがしや、チップこうかんとか
	いろいろあるから、タイヘンだよ
	"""
	keyWait
	end
}
script 36 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 136
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 116
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 46
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	ボク、オフィシャルセンター
	だーーいすき!!
	"""
	keyWait
	clearMsg
	"だって、カッコイイんだもん!"
	keyWait
	end
}
script 37 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 134
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 114
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 104
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 47
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	電脳せかいでは、オトナも コドモも
	かんけい ないから、
	"""
	keyWait
	clearMsg
	"""
	もしかすると コドモのほうが、
	ウイルスバスティングの ウデは
	うえなのかも しれませんね
	"""
	keyWait
	end
}
script 38 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 135
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 115
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 105
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 48
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	それは、いえるかもしれん
	コドモは、かわいたスポンジみたいに
	"""
	keyWait
	clearMsg
	"""
	あたらしい、ちしきや ぎじゅつを
	きゅうしゅう するからの~
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ようこそ、オフィシャルセンターへ"
	keyWait
	clearMsg
	"アラ、Aライセンスうけにきたの?"
	keyWait
	clearMsg
	"""
	このあいだ、Bライセンス
	とったばかりでしょ?
	"""
	keyWait
	clearMsg
	"がんばってるんだね"
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"お? "
	printItem
		buffer = 0
		item = 60
	"""
	を、
	とったのかい?
	"""
	keyWait
	clearMsg
	"""
	そいつは、たいしたものだ
	これからも、もっとウデを
	みがくんだぞ
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	printItem
		buffer = 0
		item = 60
	"""
	をゲットした?
	キミまだ、しょうがくせい だろ?
	"""
	keyWait
	clearMsg
	"""
	炎山くんと、おないどし くらいだよね
	しかし、さいきんの しょうがくせいは、
	スゴいなあ
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	オフィシャル・デ・バルバロッサ・
	デンジャラス・キャノーーーン!!
	"""
	keyWait
	clearMsg
	"""
	ぶいいいいいいいん!!
	ドカーーーーーン!!
	"""
	keyWait
	clearMsg
	"きゃはははははは!"
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ききましたか?
	しょうがくせいで 
	"""
	printItem
		buffer = 0
		item = 60
	"\nごうかくしゃが、でたらしいですよ"
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"それは、すごいのう!"
	keyWait
	clearMsg
	"""
	このぶんじゃと、ニホンの しょうらいは、
	あんたい じゃな フォフォフォフォ
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"アジーナスクエアに ダレもいなかった?"
	keyWait
	clearMsg
	"""
	きっと、おまつりか ナニかで
	ダレも プラグインしてなかった
	だけじゃないのかい?
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"アジーナスクエアに、いってきたのかい?"
	keyWait
	clearMsg
	"""
	あそこは、いつでも たくさんのヒトが、
	アツまって たのしいよね
	"""
	keyWait
	clearMsg
	"え・・・? ダレもいなかった?"
	keyWait
	clearMsg
	"""
	ハハハ! そんなワケないよ
	ユメでも、みたんじゃないのかい?
	"""
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	ニホンを まもるために
	めいじんが できること・・・
	"""
	keyWait
	clearMsg
	"""
	それは キミたち ネットバトラーを
	きたえることだ!
	めいじんは そう しんじているぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 55 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	いままでに ない、
	げんかい たいせいね・・・
	"""
	keyWait
	clearMsg
	"""
	あ、キミ あぶないから、
	インターネットには、プラグイン
	しちゃだめよ!
	"""
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	もしも、オフィシャルスクエアが
	おそわれたとして、
	"""
	keyWait
	clearMsg
	"""
	ワタシたちだけで、まもりとおせる
	ものなのか・・・
	"""
	keyWait
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	いつもは、うけつけ だけど
	やるときは、やるわよ!
	"""
	keyWait
	clearMsg
	"いつでも、いらっしゃい!"
	keyWait
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	まったく、ワタシは
	ウイルスバスティングが
	にがてなんだが・・・
	"""
	keyWait
	clearMsg
	"しかし、そうも いってられないか"
	keyWait
	end
}
script 59 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	ココは、オレたちが
	ぜったいに、まもる!
	"""
	keyWait
	end
}
script 60 mmbn2 {
	checkChapter
		lower = 27
		upper = 31
		jumpIfInRange = 69
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	オフィシャルが あんなに
	さわいでるんだから、
	"""
	keyWait
	clearMsg
	"""
	きっと、おおきな じけんが
	あったに ちがいないわ!
	"""
	keyWait
	clearMsg
	"どうしましょ!"
	keyWait
	end
}
script 61 mmbn2 {
	checkChapter
		lower = 27
		upper = 31
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	なあに、たしょうのじけんなら
	オフィシャルの ヒトたちが、
	なんとか してくれるさ
	"""
	keyWait
	clearMsg
	"""
	おじさんは、なんの しんぱいも
	していないよ ハハハハハハ
	"""
	keyWait
	end
}
script 62 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 78
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	ひさしぶりに、オフィシャルセンターに
	きてみれば・・・
	"""
	keyWait
	clearMsg
	"なんの さわぎかしら?"
	keyWait
	end
}
script 63 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 79
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 72
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	ハハハ、きっと うんどうかい か
	なんかの れんしゅう じゃないか?
	"""
	keyWait
	clearMsg
	"""
	ぜんいん せいれつ!
	なんちってな
	"""
	keyWait
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 73
		jumpIfOutOfRange = continue
	"""
	し、しんじられないわ・・・
	まさか、オフィシャルスクエアが
	せんりょう されるなんて・・・
	"""
	keyWait
	end
}
script 65 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 74
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	すまない・・・
	ワタシたちの チカラでは
	まったく かなわなかった・・・
	"""
	keyWait
	end
}
script 66 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	うけつけばかり やっていて
	ウデが おちていたみたいね・・・
	"""
	keyWait
	clearMsg
	"それは、ともかく・・・"
	keyWait
	clearMsg
	"""
	オフィシャルスクエアを
	せんりょうしたナビを、たおさないと
	キケンだわ!!
	"""
	keyWait
	end
}
script 67 mmbn2 {
	checkFlag
		flag = 652
		jumpIfTrue = continue
		jumpIfFalse = 99
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 76
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	だから、ウイルスバスティング
	ニガテだっていったのに・・・
	"""
	keyWait
	end
}
script 68 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 77
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	くそっ!!
	オレは、ナニを やっていたんだ!!
	"""
	keyWait
	clearMsg
	"""
	たいした ウデでもないのに
	ちょうしに、のってたんじゃないのか・・・
	"""
	keyWait
	end
}
script 69 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	え? なに なに?
	どう なっちゃったの?
	"""
	keyWait
	clearMsg
	"・・・オフィシャルが!?"
	keyWait
	clearMsg
	"""
	マジで!?
	それって かなりヤバくない?
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"オフィシャルが やられた?"
	keyWait
	clearMsg
	"""
	コイツは、オオゴトだぞぅ!!
	あわわ あわわわ
	"""
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	なんか、さくせんに しっぱいした
	みたいよ・・・
	"""
	keyWait
	end
}
script 72 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	ナニか じけんが あったのかな?
	オレは、てっきり うんどうかいの
	れんしゅうだと、おもってたんだが
	"""
	keyWait
	end
}
script 73 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	マザーコンピュータは、
	ニホンの ちゅうすうなのよ
	"""
	keyWait
	clearMsg
	"""
	あそこを やられると
	ニホンの キノウは
	ほぼ マヒしてしまうわ
	"""
	keyWait
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	なにっ! てきが
	マザーコンピュータに!?
	"""
	keyWait
	clearMsg
	"ばんじ、きゅうすだな・・・"
	keyWait
	clearMsg
	"""
	ただ、オフィシャルスクエアを
	おそった ナビを たおしてくれた ヒトが
	すけっとに、きてくれれば・・・
	"""
	keyWait
	clearMsg
	"あるいは、なんとかなる かもしれん"
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	もう、伊集院くんが きてくれるコトを
	いのるしか ないわ・・・
	"""
	keyWait
	clearMsg
	"""
	でも、伊集院くんでも、
	かてるか どうか・・・
	"""
	keyWait
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	オフィシャルスクエアを
	おそったナビ・・・
	"""
	keyWait
	clearMsg
	"たしか、ゴスペルとか なのっていたな"
	keyWait
	clearMsg
	"""
	ヤツらが、ホンキになれば
	せかいじゅうの ネットワークが
	キケンに さらされるぞ・・・
	"""
	keyWait
	clearMsg
	"ヤツらは、のばなしに しちゃいけない!"
	keyWait
	end
}
script 77 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	オフィシャルじゅうの ナビが、
	ほとんど やられちまってるのに、
	"""
	keyWait
	clearMsg
	"""
	どうやって、マザーコンピュータを
	まもれば いいんだ!?
	"""
	keyWait
	clearMsg
	"""
	ダレか、スゴウデのネットバトラーは
	いないのか・・・
	"""
	keyWait
	end
}
script 78 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	どうやら、きこえてくる ハナシを
	まとめると、こうね
	"""
	keyWait
	clearMsg
	"""
	オフィシャルセンターに、
	「ゴスペル」を なのるナビが やってきて、
	"""
	keyWait
	clearMsg
	"""
	オフィシャルセンターを のっとったの
	それで、ダレかが そのナビを
	やっつけたんだって
	"""
	keyWait
	clearMsg
	"""
	だけど、それは てきの さくせんで、
	てきの ホントの ねらいは、
	マザーコンピュータだったの
	"""
	keyWait
	clearMsg
	"""
	つまり、オフィシャルスクエアに
	のりこんだ ナビは、オトリだったってワケ
	"""
	keyWait
	clearMsg
	"""
	それで、いま、その ゴスペルっていうのが
	マザーコンピュータに もぐりこんでいるの
	"""
	keyWait
	clearMsg
	"""
	でも、オフィシャルのナビは、
	オフィシャルスクエアを おそったナビに
	ほとんど デリートされちゃって
	"""
	keyWait
	clearMsg
	"てもあしも、でない じょうたいなんだって"
	keyWait
	end
}
script 79 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"なるほど なぁ~"
	keyWait
	clearMsg
	"""
	え!? そんなに タイヘンなコトに
	なっているのか!?
	"""
	keyWait
	clearMsg
	"えらいこっちゃ~!!"
	keyWait
	end
}
script 80 mmbn2 {
	checkItem
		item = 23
		amount = 1
		jumpIfEqual = 88
		jumpIfGreater = 88
		jumpIfLess = continue
	checkFlag
		flag = 515
		jumpIfTrue = 81
		jumpIfFalse = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ようこそ オフィシャルセンターへ
	なにか ごよう ですか?
	"""
	keyWait
	clearMsg
	mugshotHide
	msgOpen
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"パスポート つくりたいんですけど\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"おねえさん キレイですね\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"なんでも ないです"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 81,
			jump = 82,
			jump = continue,
			jump = continue
		]
	mugshotShow
		mugshot = OfficialWoman
	"あら へんなコね"
	keyWait
	end
}
script 81 mmbn2 {
	flagSet
		flag = 515
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	パスポートの しんせいね
	じゃあ 右手のカウンターへ どうぞ
	"""
	keyWait
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"フフ・・・ありがと "
	waitSkip
		frames = 30
	"""
	でも
	デートは もうすこし 大きくなってからね
	"""
	keyWait
	end
}
script 83 mmbn2 {
	checkItem
		item = 23
		amount = 1
		jumpIfEqual = 87
		jumpIfGreater = 87
		jumpIfLess = continue
	checkFlag
		flag = 515
		jumpIfTrue = 84
		jumpIfFalse = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ごめんなさいね
	ごようのさいは まず うけつけへ どうぞ
	"""
	keyWait
	end
}
script 84 mmbn2 {
	flagSet
		flag = 598
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"パスポートの しんせい ですね"
	keyWait
	clearMsg
	"""
	わかりました
	じゃあ PETを そこのパソコンに
	つないでもらって と・・・
	"""
	keyWait
	clearMsg
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 259
	"カタカタカタ・・・"
	wait
		frames = 30
	keyWait
	clearMsg
	soundEnableTextSFX
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"はい できましたよ!"
	keyWait
	clearMsg
	jump
		target = 85
}
script 85 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 23
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 23
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
		target = 86
}
script 86 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	パスポートは データの かたちにして
	PETの中に 入れてあります
	"""
	keyWait
	clearMsg
	"""
	パスポートを なくしたら
	がいこくから かえって これなくなるから
	PETを おとしたり しないようにね
	"""
	keyWait
	end
}
script 87 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"さっきも いったけど・・・"
	keyWait
	clearMsg
	jump
		target = 86
}
script 88 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"パスポート もらえたみたいね"
	waitSkip
		frames = 30
	"\n・・・ニコニコ"
	keyWait
	end
}
script 89 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	オフィシャルネットバトラーと
	しみんネットバトラーの パスポートは
	ここで はっこう しているのです
	"""
	keyWait
	clearMsg
	"""
	ネットバトラーの みなさんの
	べんりを かんがえての ことです
	"""
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	ところで キミは パスポートが
	どういうものか しっているのかい?
	
	"""
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
			jump = 91,
			jump = continue,
			jump = continue
		]
	"""
	パスポートは
	キミが ニホンの人 だということを
	しょうめい するものなんだ
	"""
	keyWait
	clearMsg
	"""
	かいがいりょこうの ときには
	イノチの つぎに だいじなもの と
	かんがえたほうが いいかもな
	"""
	keyWait
	clearMsg
	"""
	なくしたら
	ニホンに かえって これなかったり
	いろいろ こまったことに なるぞ
	"""
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	うむ、しっているのなら
	もんだいは ないんだ
	"""
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"光さんの ムスコさん じゃないか!"
	keyWait
	clearMsg
	"""
	キミの かつやくの おかげで
	オフィシャルセンターは 今日も
	いつもどおり かつどう しているよ!
	"""
	keyWait
	end
}
script 93 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	オフィシャルネットバトラーと して
	まいにち きびしい くんれんを している
	つもり だったが・・・
	"""
	keyWait
	clearMsg
	"""
	「ゴスペル」を たおすには
	もっと くんれんを きびしくしなくては
	・・・
	"""
	keyWait
	end
}
script 94 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 143
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OldMan
	msgOpen
	"みな おぬしに かんしゃ しておる"
	keyWait
	clearMsg
	"じゃが わすれるで ないぞ・・・"
	keyWait
	clearMsg
	"""
	炎山はじめ みなの きょうりょくが
	あったればこそ おぬしが
	ダーク・ミヤビを たおせたと いうことを
	"""
	keyWait
	end
}
script 95 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 96 mmbn2 {
	flagAddMail
		flag = 1815
	jump
		target = 95
}
script 97 mmbn2 {
	flagAddMail
		flag = 1816
	jump
		target = 95
}
script 99 mmbn2 {
	flagSet
		flag = 652
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"やられてしまった・・・"
	keyWait
	clearMsg
	"""
	これ、
	ワタシが もっていても しかたないから
	キミが つかってくれ・・・
	"""
	keyWait
	clearMsg
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 29
		code = R
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 29
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
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	オフィシャルセンターへ
	ようこそ!!
	"""
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	アメロッパじょうで、ゴスペルによる
	じけんが はっせいしたと
	きいているが・・・
	"""
	keyWait
	clearMsg
	"""
	オフィシャルの ほんぶを
	たてつづけに ねらうとは・・・
	"""
	keyWait
	clearMsg
	"いったい なにものなんだ?"
	keyWait
	end
}
script 102 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ゴスペルの はんこうは
	どんどん きょうあくに
	なっていくわね・・・
	"""
	keyWait
	clearMsg
	"""
	しかし、いまの オフィシャルで
	たいおうしきれるかどうか・・・
	"""
	keyWait
	end
}
script 103 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	きょうあく ネットはんざいを
	ぼくめつする
	"""
	keyWait
	clearMsg
	"""
	われわれの さいだいの
	もくひょうです
	"""
	keyWait
	end
}
script 104 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	なんだか、オフィシャルのひとたち、
	みんな きあいの はいった カオ
	していますね
	"""
	keyWait
	end
}
script 105 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	ウム!! しめいかんにもえた
	よいカオじゃ!
	"""
	keyWait
	end
}
script 106 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 137
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	さいきん、ぶっそうなじけんが
	おおいって きくから、
	"""
	keyWait
	clearMsg
	"""
	オフィシャルの みなさんには
	ガンバってもらわないとね!
	"""
	keyWait
	end
}
script 110 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	おおきな じしんのアトには
	ツナミが はっせいするコトがあるの
	"""
	keyWait
	clearMsg
	"""
	オフィシャルセンターは、
	ごらんのとおり うみにめんして
	たっているから とてもキケンなのよ
	"""
	keyWait
	clearMsg
	"""
	けど、ワタシたちが にげだすワケには
	いかないのよ
	"""
	keyWait
	end
}
script 111 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	インターネットに いじょうが
	あるみたいなんだが・・・
	"""
	keyWait
	clearMsg
	"""
	ヘタに てをだして
	じたいが あっかしたらマズいしな・・・
	"""
	keyWait
	end
}
script 112 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	みんかんから じしんに ついての
	といあわせが さっとうしているわ
	"""
	keyWait
	end
}
script 113 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	せかいじゅうで、どうじに
	いじょうきしょうが はっせい・・・
	"""
	keyWait
	clearMsg
	"まさか あのシステムが・・・?"
	keyWait
	end
}
script 114 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	さっき、きいたんですけど
	このオフィシャルセンターも
	アブないらしいですよ
	"""
	keyWait
	end
}
script 115 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	ツナミがくる かのうせいが
	あるそうじゃな
	"""
	keyWait
	clearMsg
	"""
	ワシは およげんからの
	はやめに ひなんするとしようか
	"""
	keyWait
	end
}
script 116 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"ニホンは、どうなっちゃうの~?"
	keyWait
	clearMsg
	"""
	もちろん、オフィシャルネットバトラーが
	いるから、だいじょうぶだよね?
	"""
	keyWait
	end
}
script 117 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	じしんが おきても
	めいじんに まよいは ないぞ!
	"""
	keyWait
	clearMsg
	"""
	さあ!
	今日も ネットバトルで しょうぶだ!
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 120 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	あんぜんかくほの ため
	ひなんかんこくを 出しました
	"""
	keyWait
	clearMsg
	"""
	みんかんの かたは
	みんな ひなん されています
	"""
	keyWait
	end
}
script 121 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	じしんの こんらんに じょうじて
	がいぶからの しんにゅうしゃが ないか
	チェック しなければ!
	"""
	keyWait
	end
}
script 122 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	さいしん じょうほうを
	みんかんの かたに ていきょうしなきゃ
	"""
	keyWait
	clearMsg
	"""
	さいがいじの じょうほうは、
	とても じゅうようなのよ!
	"""
	keyWait
	end
}
script 123 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	かんきょういじシステムが
	フリーズ したという
	じょうほうが 入ったんだ
	"""
	keyWait
	clearMsg
	"""
	今、光さんが しゅうふくに
	あたっているそうだ
	"""
	keyWait
	clearMsg
	"""
	かなり てごわいシステムらしいが、
	光さんなら ぜったい
	なんとか してくれるさ!
	"""
	keyWait
	end
}
script 124 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"ったく! やっかいな じけんだぜ!"
	keyWait
	clearMsg
	"""
	この さいがいは、ネットワークしゃかいの
	べんりさの ウラにある キケンなぶぶんが
	モロに 出ちまってるな!
	"""
	keyWait
	end
}
script 130 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ようこそ!
	オフィシャルセンターへ!!
	"""
	keyWait
	clearMsg
	"""
	もう、じしんも ツナミのしんぱいも
	ありませんよ!
	"""
	keyWait
	end
}
script 131 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	ゴスペルの ほんぶが
	コトブキスクエアに あっただなんて
	"""
	keyWait
	clearMsg
	"""
	「とうだい もとくらし」とは、
	まさに このコトだね
	"""
	keyWait
	end
}
script 132 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	じしんによる ひがいほうこくは
	ほとんど きてないですよ
	"""
	keyWait
	clearMsg
	"ほんと、ホッとしています"
	keyWait
	end
}
script 133 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	ゴスペルは、かいめつした・・・
	これで、せかいに へいわが
	おとずれるのか・・・
	"""
	keyWait
	end
}
script 134 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"それにしても、ヒドい じしんでしたね"
	keyWait
	clearMsg
	"""
	じしんの げんいんは、
	またしても、ゴスペルだったそうですよ
	"""
	keyWait
	end
}
script 135 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	しかし、そのゴスペルも
	かいめつした らしいじゃないか
	"""
	keyWait
	clearMsg
	"""
	これで、あんしんして
	せいかつできるってもんじゃ
	"""
	keyWait
	clearMsg
	"""
	しかし、ネットマフィア ゴスペル
	おそろしい ヤツらじゃったのう!
	"""
	keyWait
	end
}
script 136 mmbn2 {
	mugshotShow
		mugshot = BlueShirtBoy
	msgOpen
	"""
	やっぱり、オフィシャルネットバトラーが
	なんとかしてくれたんだよ!!
	"""
	keyWait
	clearMsg
	"""
	よーし! ボクもオフィシャルに
	なれるようにガンバるぞ!!
	"""
	keyWait
	end
}
script 137 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	じしんは、おさまったんだね?
	ふう、ホントに コワかったよ
	"""
	keyWait
	clearMsg
	"""
	でも、いつ だい2、だい3の
	ゴスペルがあらわれるか わからないから
	ゆだんは、できないね
	"""
	keyWait
	end
}
script 140 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ようこそ オフィシャルセンターへ・・・"
	keyWait
	clearMsg
	"""
	ごらんのとおり、わたしたちは
	おおくの オフィシャルネットバトラーを
	うしなって しまいました・・・
	"""
	keyWait
	end
}
script 141 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ネットバトラーの 人手が たりないのに
	こんなに いらいに くる人が 
	おおいなんて・・・
	"""
	keyWait
	end
}
script 142 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"クッ・・・"
	waitSkip
		frames = 30
	"オフィシャルの なかまが・・・"
	waitSkip
		frames = 15
	"\nみんな やられちまったんだ・・・"
	keyWait
	end
}
script 143 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	オペレーションの ウデなら
	今でも わかいモンに まけてはおらん
	"""
	keyWait
	clearMsg
	"""
	・・・じゃが きょうあくな ウイルスと
	たたかうには、ワシの ナビは
	いささか きゅうがた すぎるのじゃ・・・
	"""
	keyWait
	end
}
script 144 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	やっぱり めいじんだって
	ゴスペルと たたかいたいぞ!!
	"""
	keyWait
	clearMsg
	"""
	でも・・・ネットバトルが
	めいじんの ニンム なんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 145 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"わたしの ばんは まだかい~?"
	keyWait
	end
}
script 146 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	マイ ホンヤクシステム ワズ
	ブロークン デース!!
	"""
	keyWait
	end
}
script 147 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	ナビが しごとの だいじな データを
	もったまま ゆくえふめい なんだ!
	"""
	keyWait
	end
}
script 160 mmbn2 {
	checkFlag
		flag = 182
		jumpIfTrue = 31
		jumpIfFalse = continue
	flagSet
		flag = 182
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	やあ! ワタシは ネットバトルめいじん!
	ヒカリけんきゅうしょ から
	ここに はけん されているぞ!
	"""
	keyWait
	clearMsg
	"""
	ネットバトルなら まかせてくれ!
	なんたって ネットバトルが
	めいじんの しごと だからな!!
	"""
	keyWait
	clearMsg
	"""
	さあ こい!! でんせつの
	69れんしょうを ほこる このワタシに
	キミは かつことが できるのか!?
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 161 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、めいじんに
	ネットバトルを もうしこむ?
	
	"""
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
	"いいえ\n"
	select
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = 162,
			jump = 164,
			jump = continue
		]
	end
}
script 162 mmbn2 {
	checkFlag
		flag = 178
		jumpIfTrue = 165
		jumpIfFalse = continue
	checkFlag
		flag = 185
		jumpIfTrue = 178
		jumpIfFalse = continue
	checkFlag
		flag = 184
		jumpIfTrue = 177
		jumpIfFalse = continue
	checkFlag
		flag = 183
		jumpIfTrue = 176
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	よし! だが・・・いきなり
	ワタシの ゲートマンに かつのはムリだ!
	ハンデは これくらいで・・・
	"""
	waitSkip
		frames = 30
	"いくぞ!"
	keyWait
	clearMsg
	jump
		target = 163
}
script 163 mmbn2 {
	flagSet
		flag = 178
	msgClose
	waitHold
}
script 164 mmbn2 {
	flagClear
		flag = 179
	flagClear
		flag = 180
	flagClear
		flag = 181
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	めいじんは いつでも
	キミの ちょうせんを まっているぞ!!
	"""
	keyWait
	end
}
script 165 mmbn2 {
	flagClear
		flag = 179
	flagClear
		flag = 180
	flagClear
		flag = 181
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	ちょっと まってくれ!
	今 スゴい せんぽうを
	おもいつきそうなんだ!
	"""
	keyWait
	end
}
script 166 mmbn2 {
	checkFlag
		flag = 179
		jumpIfTrue = 167
		jumpIfFalse = continue
	checkFlag
		flag = 180
		jumpIfTrue = 169
		jumpIfFalse = continue
	checkFlag
		flag = 181
		jumpIfTrue = 171
		jumpIfFalse = 171
}
script 167 mmbn2 {
	checkFlag
		flag = 183
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	ハンデせん とはいえ いいウデだ!
	よし! めいじんからの プレゼントを
	おくろう!!
	"""
	keyWait
	clearMsg
	jump
		target = 168
}
script 168 mmbn2 {
	flagSet
		flag = 183
	flagClear
		flag = 179
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
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 173
}
script 169 mmbn2 {
	checkFlag
		flag = 184
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	やるな!
	今のは けっこう ホンキだったぞ!
	"""
	keyWait
	clearMsg
	"""
	・・・その ウデまえなら
	フォルダの つかいわけも できそうだな!
	"""
	keyWait
	clearMsg
	"これを つかってみるんだ!!"
	keyWait
	clearMsg
	jump
		target = 170
}
script 170 mmbn2 {
	flagSet
		flag = 184
	flagClear
		flag = 180
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	startGiveFolder
		folder = 0
	soundPlay
		track = 133
	"""
	熱斗は、
	「めいじんの フォルダ」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 179
	end
}
script 171 mmbn2 {
	checkFlag
		flag = 185
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	まさか・・・
	アノ人 いがいの 人間に
	このワタシが まけるとは・・・
	"""
	keyWait
	clearMsg
	jump
		target = 172
}
script 172 mmbn2 {
	flagSet
		flag = 185
	flagClear
		flag = 181
	end
}
script 173 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	なかなかの ウデまえ だったぞ!
	さらに ウデを みがいて
	また ワタシに ちょうせんするんだ!
	"""
	keyWait
	end
}
script 174 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	めいじんが なんども まけるなど・・・
	これはユメだ! きっとそうだ!
	"""
	keyWait
	end
}
script 175 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	ハハハハハ!!
	おちこむことは ない!
	なかなかの ウデまえ だったぞ!
	"""
	keyWait
	end
}
script 176 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	よし! こんかいは
	ちょっとだけ ホンキを 出すぞ!
	つよすぎたら いってくれよ!
	"""
	keyWait
	clearMsg
	jump
		target = 163
}
script 177 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	いいだろう・・・
	めいじんでんせつの しんずい
	その目で たしかめるんだ!!
	"""
	keyWait
	clearMsg
	jump
		target = 163
}
script 178 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	めいじんの しょうごうを これいじょう
	キズつける わけには いかない!
	ぜんりょくで キミを たおす!
	"""
	keyWait
	clearMsg
	jump
		target = 163
}
script 179 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	msgOpen
	"""
	フォルダの つかいわけに ついては・・・
	今から メールで おくるぞ!
	"""
	keyWait
	clearMsg
	"よくよんで うまく つかいこなすんだ!"
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 16
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ワタシの サブチップ・・・
	すこしでしたら おわけしますが
	ごらんに なりますか?
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
	"みる "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"みない"
	select
		default = 0
		disableB = false
		clear = false
		targets = [
			jump = continue,
			jump = 181,
			jump = continue
		]
	startShop
		shop = 18
}
script 181 mmbn2 {
	clearMsg
	"「そなえあれば うれいナシ」 ですよ"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	む・・・よく かんがえたら
	いまは もっていませんでした・・・
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 3205
		jumpIfTrue = 196
		jumpIfFalse = continue
	checkFlag
		flag = 144
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 144
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ぼうやが チップを
	こうかんしてくれるのかい?
	"""
	keyWait
	clearMsg
	"""
	おばさんのウチの
	ゆわかしプログラムがこわれちゃってねえ
	"""
	keyWait
	clearMsg
	"そこで、「"
	printChip
		buffer = 0
		chip = 26
	" "
	printCode
		buffer = 0
		code = F
	"""
	」が、
	ほしいんだよ
	"""
	keyWait
	clearMsg
	"""
	いくらあつい きせつだからって
	まいにち、ぎょうずいも
	イヤだしねえ
	"""
	keyWait
	clearMsg
	"おばさんの「"
	printChip
		buffer = 0
		chip = 38
	" "
	printCode
		buffer = 0
		code = L
	"""
	」と
	こうかんしておくれよ
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"いいすよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いやだ"
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
	アンタ、ちょっと!
	これは、いらい なんだからね!
	"""
	keyWait
	clearMsg
	"いらいを うけたいじょう"
	keyWait
	clearMsg
	"""
	せきにんをもって
	こうかんしてもらわないと
	こまるじゃないかい
	"""
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 26
		code = F
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagClear
		flag = 82
	itemTakeChip
		chip = 26
		code = F
		amount = 1
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	こうかんしてくれるのかい
	ありがとうね~
	"""
	keyWait
	clearMsg
	"""
	それじゃ、やくそくどおり
	これをもっておいき
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
		chip = 38
		code = L
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 38
	" "
	printCode
		buffer = 0
		code = L
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 193
}
script 193 mmbn2 {
	flagSet
		flag = 3205
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	これで、アツ~いおふろに
	はいれるよ
	"""
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"「"
	printChip
		buffer = 0
		chip = 26
	" "
	printCode
		buffer = 0
		code = F
	"""
	」を、
	もってきてくれたのかい?
	"""
	keyWait
	clearMsg
	"おばさんの「"
	printChip
		buffer = 0
		chip = 38
	" "
	printCode
		buffer = 0
		code = L
	"""
	」と
	こうかんしておくれよ
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"いいすよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いやだ"
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
	アンタ、ちょっと!
	これは、いらい なんだからね!
	"""
	keyWait
	clearMsg
	"いらいを うけたいじょう"
	keyWait
	clearMsg
	"""
	せきにんをもって
	こうかんしてもらわないと
	こまるじゃないかい
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ぼうや、リュックのなかに
	「
	"""
	printChip
		buffer = 0
		chip = 26
	" "
	printCode
		buffer = 0
		code = F
	"""
	」は、
	はいってないんじゃないのかい?
	"""
	keyWait
	clearMsg
	"フォルダのなかにも ないのかい?"
	keyWait
	clearMsg
	"""
	もし もってるんだったら、
	リュックにいれておいてね
	"""
	keyWait
	clearMsg
	"""
	でないと、おばさんも
	こうかんできないからね
	"""
	keyWait
	end
}
script 196 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	アツいときに、アツいおふろにはいる
	ソレが いいんだよ!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	コーヒーサーバーだ
	なにやら プラグイン できそうだ!
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"おいしそうな コーヒーだ"
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	これが オフィシャルセンターの
	ホストコンピュータ だ
	ただし かずあるうちの ひとつだ
	"""
	keyWait
	end
}
script 223 mmbn2 {
	checkChapter
		lower = 22
		upper = 255
		jumpIfInRange = 235
		jumpIfOutOfRange = continue
	msgOpen
	"""
	スイッチを おしても はんのうがない
	こうどな セキュリティが
	ほどこされているようだ・・・
	"""
	keyWait
	end
}
script 224 mmbn2 {
	checkChapter
		lower = 22
		upper = 255
		jumpIfInRange = 236
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、エレベーターに のるなら
	スイッチ おさなきゃ
	"""
	keyWait
	clearMsg
	"""
	でも
	セキュリティが ほどこされてるから
	ボクたちは つかえない みたいだね
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	さいしんモデルの パソコン
	かなり たかそうだ・・・
	"""
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	パソコンだ・・・
	ちょっとまえの モデルだが
	せいのうは、さいこうだ
	"""
	keyWait
	end
}
script 227 mmbn2 {
	msgOpen
	"""
	ちょうぼだ
	しかし らいかんしゃの かんりは
	パソコンで やっているようだ
	"""
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	このパソコンの なかには、
	いっぱんに、しられてはいけない
	じょうほうが、つめこまれている
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"""
	さすが、オフィシャルセンターだけに
	つかっているパソコンは、いちりゅうだ
	"""
	keyWait
	end
}
script 235 mmbn2 {
	msgOpen
	"""
	エレベーターの トビラが ひらいた!
	パパの けんきゅうしつが ある
	フロアへ 行こう!
	"""
	keyWait
	flagSet
		flag = 36
	startWarp
		warp = 2
	end
}
script 236 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、エレベーターに のるなら
	スイッチ おさなきゃ
	"""
	keyWait
	end
}
