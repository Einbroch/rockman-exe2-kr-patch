@archive 074FD74
@size 255

script 0 mmbn2 {
	checkItem
		item = 60
		amount = 1
		jumpIfEqual = 40
		jumpIfGreater = 40
		jumpIfLess = continue
	checkChapter
		lower = 16
		upper = 18
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkItem
		item = 59
		amount = 1
		jumpIfEqual = 10
		jumpIfGreater = 10
		jumpIfLess = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	その先は、ライセンスしけんを
	うけるための へやだよ
	かってに入っちゃ ダメだぞ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 83
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 75
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 45
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 16
		upper = 31
		jumpIfInRange = 21
		jumpIfOutOfRange = continue
	checkItem
		item = 59
		amount = 1
		jumpIfEqual = 11
		jumpIfGreater = 11
		jumpIfLess = continue
	checkFlag
		flag = 596
		jumpIfTrue = 2
		jumpIfFalse = continue
	flagSet
		flag = 596
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	ん? それは じゅけんひょう、
	へぇ、キミも しけんをうけにきたんだ
	"""
	keyWait
	clearMsg
	"""
	じゃあ そこのトビラを あけるから
	中に入って プラグイン するんだよ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	トビラ あいてないかい?
	しけんを うけるなら その中だよ
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 32
		upper = 33
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	checkItem
		item = 59
		amount = 1
		jumpIfEqual = 12
		jumpIfGreater = 12
		jumpIfLess = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	オレは まっている・・・
	オレにふさわしい てごわい じけんの
	いらいが くるまで・・・
	"""
	keyWait
	end
}
script 4 mmbn2 {
	checkItem
		item = 59
		amount = 1
		jumpIfEqual = 13
		jumpIfGreater = 13
		jumpIfLess = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	「いらいけいじばん」に いらいが
	いっけんも ないなんて めずらしいよ
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	こんどキミが しけんべやに 入れるのは
	Aライセンスしけんの ときだぞ
	そう あせらないことだな
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	Bライセンスを とったんだね
	しみんネットバトラー としての かつやく
	きたい しているよ!
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	あのていどの いらい なら
	オレが やるまでも ない
	キミに まかせるよ
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ひとつの いらいを うけたら、
	それを かいけつするまで ほかの
	いらいは うけられないの
	"""
	keyWait
	clearMsg
	"""
	しみんネットバトラー としての
	せきにんを もって、
	いらいを うけなきゃ ダメってコトよね
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	その先は、ライセンスしけんを
	うけるための へやだよ
	かってに入っちゃ ダメだぞ
	"""
	keyWait
	end
}
script 21 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 26
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 43
		jumpIfOutOfRange = continue
	checkChapter
		lower = 19
		upper = 19
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	checkFlag
		flag = 538
		jumpIfTrue = 32
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 31
		jumpIfFalse = continue
	checkChapter
		lower = 17
		upper = 17
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	ここは、しみんネットバトラー
	ライセンスしけんの うけつけだよ
	"""
	keyWait
	clearMsg
	"え? 知ってるって?"
	keyWait
	end
}
script 22 mmbn2 {
	checkChapter
		lower = 18
		upper = 21
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	checkChapter
		lower = 17
		upper = 17
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	さぁ、きょうも しみんの
	あんぜんを まもるぜ!!
	"""
	keyWait
	end
}
script 25 mmbn2 {
	flagSet
		flag = 518
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	キミは
	どのライセンスを うけに きたんだい?
	"""
	keyWait
	clearMsg
	"""
	Aライセンスか、
	小学生が ごうかくするのは
	タイヘンだと おもうけど ガンバレよ!
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	けいけんをつむのも、
	ネットバトラーの
	しごとのうちだぞ!
	"""
	keyWait
	end
}
script 31 mmbn2 {
	checkFlag
		flag = 3200
		jumpIfTrue = continue
		jumpIfFalse = 30
	checkFlag
		flag = 3201
		jumpIfTrue = continue
		jumpIfFalse = 30
	checkFlag
		flag = 3202
		jumpIfTrue = continue
		jumpIfFalse = 30
	flagSet
		flag = 537
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"がんばりたまえ"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	いらいの なかには、
	バトルチップを わけてくれという
	ないようの ものも あるんだ
	"""
	keyWait
	clearMsg
	"""
	もし、そのての いらいを
	うけるばあいは、
	"""
	keyWait
	clearMsg
	"""
	いらいにんが、ほしがってる
	チップを てにいれてから
	いらいを うけたほうがいい
	"""
	keyWait
	clearMsg
	"""
	いらいは うけたが、
	ゆずるチップが ありませんじゃ、
	かっこうが つかないからね
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"どうだ、がんばっているか?"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	その先は、ライセンスしけんを
	うけるための へやだよ
	かってに入っちゃ ダメだぞ
	"""
	keyWait
	end
}
script 41 mmbn2 {
	flagSet
		flag = 651
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	おめでとう!
	しけん がんばった みたいだな
	これは わたしからの プレゼントだ
	"""
	keyWait
	clearMsg
	jump
		target = 42
}
script 42 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 124
		code = *
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 124
	" "
	printCode
		buffer = 0
		code = *
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
script 43 mmbn2 {
	checkFlag
		flag = 651
		jumpIfTrue = continue
		jumpIfFalse = 41
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	その先は、ライセンスしけんを
	うけるための へやだよ
	かってに入っちゃ ダメだぞ
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	いまは、しけんができる
	じょうたいじゃないんだ・・・
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	タ、タイヘンなコトに
	なってしまった・・・
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	オフィシャルスクエアの つぎは、
	マザーコンピュータか・・・
	"""
	keyWait
	clearMsg
	"このままでは ニホンはいったい!?"
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"Sライセンスを とりたい?"
	keyWait
	clearMsg
	"""
	大きなじけんを かいけつしたと いっても
	まだ キミは しみんネットバトラーに
	なったばかり だからな
	"""
	keyWait
	clearMsg
	"""
	今は そのときでは ないけど
	そのうち しけんを うけられるように
	きっと なるさ
	"""
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	あいかわらず
	いらいが へる けはいは ない・・・
	"""
	keyWait
	clearMsg
	"""
	オフィシャルを まもったと いうだけで
	ゴスペルに 大したダメージは
	あたえられていない ということか・・・
	"""
	keyWait
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	さいきん ひんぱつする
	きょうあく ネットワークはんざいの
	えいきょうで、
	"""
	keyWait
	clearMsg
	"""
	オフィシャルネットバトラーの
	ひとでが、ふそくしているんだ
	"""
	keyWait
	clearMsg
	"""
	そこで、しみんネットバトラーを
	ふやして、ちいき レベルの ぼうはんを
	きょうか することに なったんだ
	"""
	keyWait
	clearMsg
	"""
	なるべく おおくのヒトに
	じゅけんしてもらえるように
	しけんべやを かいほうしたんだ
	"""
	keyWait
	clearMsg
	"""
	それによって インターネットから
	ちょくせつ じゅけんしにいくコトが
	できるように なったんだよ
	"""
	keyWait
	clearMsg
	"""
	じゅけんできるか どうかは、
	オフィシャルスクエアにいる
	しけんかんのナビに きいてみたらいいよ
	"""
	keyWait
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ここに かかれる いらいを
	みていれば、いまの、ニホンのちあんが
	なんとなく みえてくるわね
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	ほとんどの オフィシャルが
	さいがいの たいおうに あたっている
	いま だからこそ、
	"""
	keyWait
	clearMsg
	"""
	ゆうしゅうな じんざいが
	ひとりでも ほしいんだ
	"""
	keyWait
	clearMsg
	"""
	なので、しけんべやは
	いまも かいほうしているんだ
	"""
	keyWait
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	じけんが、かいけつして
	みんなが、ゆだんしたころが
	いちばん あぶない
	"""
	keyWait
	clearMsg
	"""
	もしもの ときのための じんざいが
	より おおく ひつようなんだ
	"""
	keyWait
	clearMsg
	"""
	しけんべやは、いつだって
	はいれるぞ!
	"""
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	こんなとき だからね、
	ここも となりのへやも
	かんさんと しているよ
	"""
	keyWait
	end
}
script 101 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 76
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = YoungWoman
	msgOpen
	"""
	ロビーの うけつけの人も いそがしくて
	なかなか コッチに いらいが
	アップ されないのよね・・・
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 262
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 261
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 261
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"はあい ボク!"
	keyWait
	clearMsg
	"""
	バトルチップの
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
	」って
	もってないかしら?
	"""
	keyWait
	clearMsg
	"""
	よかったらで いいんだけど
	「
	"""
	printChip
		buffer = 0
		chip = 84
	" "
	printCode
		buffer = 0
		code = Z
	"""
	」と、
	こうかんしてくれないかしら?
	"""
	keyWait
	clearMsg
	"いい?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"よろこんで "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ヤだ!"
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
	あら、そう・・・
	ザンネンねえ・・・
	"""
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 138
		code = N
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 262
	itemTakeChip
		chip = 138
		code = N
		amount = 1
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	まぁ、こうかんしてくれるのね!
	うれしいわ~!
	"""
	keyWait
	clearMsg
	"""
	こうかんする ワタシのチップよ
	ハイ!
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
		chip = 84
		code = Z
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 84
	" "
	printCode
		buffer = 0
		code = Z
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
		mugshot = CampWoman
	msgOpen
	"""
	ココでまってたら、
	チップを こうかんしてくれるヒトが
	ぜったい きてくれると、おもってたのよ!
	"""
	keyWait
	clearMsg
	"ビンゴね!"
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"はあい ボク!"
	keyWait
	clearMsg
	"""
	また、おねえさんに、
	はなしかけてくれたってコトは、
	チップを こうかんしてくれるのかな?
	"""
	keyWait
	clearMsg
	"ボクの「"
	printChip
		buffer = 0
		chip = 138
	" "
	printCode
		buffer = 0
		code = N
	"""
	」と
	おねえさんの「
	"""
	printChip
		buffer = 0
		chip = 84
	" "
	printCode
		buffer = 0
		code = Z
	"""
	」を
	こうかんするのよね?
	"""
	keyWait
	clearMsg
	"それで いいかしら?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ハイ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"イイエ!"
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
	アラ、そうなの・・・
	ちょっと きたいしたんだけどな
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	ねえ、ボク
	「
	"""
	printChip
		buffer = 0
		chip = 138
	" "
	printCode
		buffer = 0
		code = N
	"」はドコに あるのかな?"
	keyWait
	clearMsg
	"""
	リュックのなかには ないみたいだから
	もしかして、フォルダのなか かしら?
	"""
	keyWait
	clearMsg
	"""
	こうかんするときは、こうかんするチップを
	リュックに いれておかないとね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 18
		upper = 18
		jumpIfInRange = 222
		jumpIfOutOfRange = continue
	checkChapter
		lower = 0
		upper = 255
		jumpIfInRange = 223
		jumpIfOutOfRange = 223
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	ライセンスしけんを うけにきた人の
	じょうほうが つまったパソコンだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkFlag
		flag = 521
		jumpIfTrue = 223
		jumpIfFalse = continue
	flagSet
		flag = 520
	end
}
script 223 mmbn2 {
	startBBS
		bbs = 0
}
script 224 mmbn2 {
	flagSet
		flag = 3264
	flagSet
		flag = 82
	msgOpen
	"いらい1をうけた"
	keyWait
	end
}
script 225 mmbn2 {
	flagSet
		flag = 3265
	flagSet
		flag = 82
	msgOpen
	"いらい2をうけた"
	keyWait
	end
}
script 226 mmbn2 {
	flagSet
		flag = 3266
	flagSet
		flag = 82
	msgOpen
	"いらい3をうけた"
	keyWait
	end
}
