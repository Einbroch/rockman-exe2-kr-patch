@archive 07796DC
@size 255

script 0 mmbn2 {
	checkFlag
		flag = 1808
		jumpIfTrue = 1
		jumpIfFalse = continue
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ふふ~ん♪ オレはこのマチ イチバンの
	ジョウホウヤ~♪ ふふふ~ん♪
	"""
	keyWait
	clearMsg
	"""
	ドコかに、いいネタ オチてナいかな
	へへへ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkFlag
		flag = 638
		jumpIfTrue = 6
		jumpIfFalse = continue
	checkFlag
		flag = 639
		jumpIfTrue = 5
		jumpIfFalse = continue
	flagSet
		flag = 639
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	オレは、ウラでもユウメイな
	ジョウホウヤだ
	"""
	keyWait
	clearMsg
	"""
	ナンだ? ヤミいしゃを
	ヨびダすキーワードをサガしてる?
	"""
	keyWait
	clearMsg
	"""
	キーワードはシらねえが、
	キーワードをシってるヤツならシってるぜ
	"""
	keyWait
	clearMsg
	"""
	このジョウホウなら・・・
	10000ゼニーでウってやるぜ
	ヤスいモンだろ?
	"""
	keyWait
	clearMsg
	"カうか?"
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"かった! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちょっとムリ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 2,
			jump = continue,
			jump = continue
		]
	"カネが デキたらまたキな"
	keyWait
	end
}
script 2 mmbn2 {
	checkZenny
		amount = 10000
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 4
	checkTakeZenny
		amount = 10000
		jumpIfSurplus = continue
		jumpIfExact = continue
		jumpIfDeficit = continue
	flagSet
		flag = 638
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「10000ゼニー」を
	しはらった!!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"ヘヘッ マイドあり!"
	keyWait
	clearMsg
	"それじゃあ、ジョウホウだが"
	keyWait
	clearMsg
	"""
	キーワードをしっているナビが
	アメロッパスクエアに、いるってハナシを
	キいたコトがあるぜ
	"""
	keyWait
	clearMsg
	"""
	タシか、ムラサキのナビで
	かなり、ガメついヤツらしいぜ
	"""
	keyWait
	clearMsg
	"オレとどっちが、ガメついかな?"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ニイちゃん ワルいがカネが
	タりねえみたいだ
	"""
	keyWait
	clearMsg
	"""
	コツコツ チョキンでもして
	デナオしてキな
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	オウ、ニイちゃん!
	ジョウホウ、カうキになったかい!
	"""
	keyWait
	clearMsg
	"""
	おネダン スエオきの10000ゼニーだ
	だいサービスだぜ!
	"""
	keyWait
	clearMsg
	"カうかい?"
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"かうぜ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ちょっとムリ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 2,
			jump = continue,
			jump = continue
		]
	"カネが デキたらまたキな"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"カネにナるジョウホウ ナいかなあ"
	keyWait
	end
}
script 7 mmbn2 {
	checkChapter
		lower = 61
		upper = 72
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 34
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ココは、おマエさん みたいな
	コドモガタナビが、クるトコロ
	じゃないぜ
	"""
	keyWait
	clearMsg
	"""
	・・・・・・おマエ、ドコかで
	ミたコトが あるような・・・
	"""
	keyWait
	end
}
script 8 mmbn2 {
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	オモテじゃ、ゴスペルとか イう
	ヤツラが、ハバを キかせている
	らしいじゃねえか
	"""
	keyWait
	clearMsg
	"""
	でもな、アイツらはな ムレなきゃ
	ナニも デキない ヤツらなんだよ!
	"""
	keyWait
	clearMsg
	"""
	もし、オレが ゴスペルのヤツに
	デアったら、コイチジカンほど
	セッキョウ してやるのによ!
	"""
	keyWait
	end
}
script 9 mmbn2 {
	checkChapter
		lower = 61
		upper = 72
		jumpIfInRange = 42
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 36
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"オイ ボウズ!"
	keyWait
	clearMsg
	"""
	シにたくなきゃ オモテに
	カエるんだな!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	checkChapter
		lower = 61
		upper = 72
		jumpIfInRange = 43
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 37
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"ウラアアアァァァァ!!!"
	keyWait
	clearMsg
	"オラァァァァァァァ!!!"
	keyWait
	clearMsg
	"""
	アイテをイカクするには、
	まずは キアイからだ!!
	"""
	keyWait
	clearMsg
	"""
	オラアアアッ・・・
	ゲフンッ!!
	"""
	keyWait
	end
}
script 20 mmbn2 {
	checkItem
		item = 37
		amount = 1
		jumpIfEqual = 31
		jumpIfGreater = 31
		jumpIfLess = continue
	checkFlag
		flag = 643
		jumpIfTrue = 28
		jumpIfFalse = continue
	checkFlag
		flag = 644
		jumpIfTrue = 30
		jumpIfFalse = continue
	flagSet
		flag = 644
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"ヒョッホッホッホッ!"
	keyWait
	clearMsg
	"""
	これまた、かわいらしい
	おきゃくさんじゃのう
	"""
	keyWait
	clearMsg
	"""
	きょうは、どうした?
	ポンポンでもイタいのか
	ホホホ
	"""
	keyWait
	clearMsg
	"""
	・・・ナニ? ワクチンをつくれとな?
	おまえさんみたいな ワッパがワクチン
	なんぞもって どうするつもりじゃ?
	"""
	keyWait
	clearMsg
	"おいしゃさんごっこかい?"
	keyWait
	clearMsg
	"""
	ナニ? あのコオリをこわすのか?
	ほほう・・・それは、おもしろい
	"""
	keyWait
	clearMsg
	"""
	しかし、ワシのところに
	きたというコトは
	それなりのカクゴがあるんじゃろう?
	"""
	keyWait
	clearMsg
	"""
	ワクチンだいとして、
	おまえさんの そうびしている
	パワーアップパーツと、
	"""
	keyWait
	clearMsg
	"""
	バトルチップを ぜんぶ もらうが
	それでもよいか?
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
	"ハイ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ムリ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 21,
			jump = continue,
			jump = continue
		]
	flagSet
		flag = 643
	"なら、ワクチンはつくらん"
	keyWait
	clearMsg
	"""
	ワシにワクチンをいらいするには
	それなりのカクゴをきめてから
	くるコトじゃな
	"""
	keyWait
	end
}
script 21 mmbn2 {
	flagClear
		flag = 643
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"それでは、えんりょなくいただくぞい"
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンのパワーアップパーツと、
	バトルチップをすべてもっていかれた!
	"""
	keyWait
	clearMsg
	"ロックマンのレベルが1になった!!"
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
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
	うむ! よい どきょうじゃ!
	気にいった、ワクチンを つくってやろう
	"""
	keyWait
	clearMsg
	"""
	そのまえに、ホレ!
	コレは かえすぞい、りしつきじゃ!
	"""
	keyWait
	clearMsg
	jump
		target = 32
}
script 24 mmbn2 {
	checkItem
		item = 36
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 29
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	それじゃあ、ワクチンをつくってやるから
	それをよこすのじゃ
	"""
	keyWait
	clearMsg
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotHide
	msgOpen
	itemTake
		item = 36
		amount = 1
	"""
	ロックマンは、
	「しゃくねつデータ」を
	てわたした!!
	"""
	keyWait
	clearMsg
	jump
		target = 26
}
script 26 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"よっしゃ、"
	soundPlay
		track = 266
	"カタカタカタの\n"
	soundPlay
		track = 219
	"ピピピのピじゃ!"
	keyWait
	clearMsg
	"ホレでけたぞい!"
	keyWait
	clearMsg
	"ワシって てんさいじゃのう!!"
	keyWait
	clearMsg
	jump
		target = 27
}
script 27 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 37
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 37
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	clearMsg
	mugshotShow
		mugshot = OfficialNavi
	"それで、キイろい コオリがコワせるぞい"
	keyWait
	clearMsg
	"""
	そういや、アメロッパエリア2に
	ワシの チジンが、おっての、
	"""
	keyWait
	clearMsg
	"""
	ソイツのオトウトが、コオリを
	コワそうと イロイロしらべて
	おったらしいわ
	"""
	keyWait
	clearMsg
	"""
	ナニか ジョウホウがエられるかも
	しれんの
	"""
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ん? どうした?
	パワーアップパーツと、バトルチップぜんぶ
	わたすきになったか?
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
	"ハイ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ムリ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 21,
			jump = continue,
			jump = continue
		]
	flagSet
		flag = 643
	"なら、ワクチンはつくらん"
	keyWait
	clearMsg
	"""
	ワシにワクチンをいらいするには
	それなりのカクゴをきめてから
	くるコトじゃな
	"""
	keyWait
	clearMsg
	"なんども いわせるでない!"
	keyWait
	end
}
script 29 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	なんじゃ、もっとらんではないか
	ミエをはるでない!
	"""
	keyWait
	clearMsg
	"""
	どこか、ほのおをおこすプログラムの
	なかにあるはずじゃ
	とにかくさがしだして、もってきな
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	お、「しゃくねつデータ」を
	もってきたか!
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"ハイ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"まだです"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 24,
			jump = continue,
			jump = continue
		]
	"""
	どこか、ほのおをおこすプログラムの
	なかにあるはずじゃ
	とにかくさがしだして、もってきな
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"ホホホ、ガンバれば ミチはヒラけるぞい"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	きょうかプログラムと バトルチップ
	を かえしてもらった!!
	"""
	keyWait
	clearMsg
	"ロックマンのレベルが もとにもどった!"
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 187
		code = D
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 187
	" "
	printCode
		buffer = 0
		code = D
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
		target = 33
}
script 33 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	じつは、ワシもあのコオリのちょうさを
	しておったのじゃ
	"""
	keyWait
	clearMsg
	"""
	キイロのコオリをコワす
	「
	"""
	printItem
		buffer = 0
		item = 37
	"」をつくるには、"
	keyWait
	clearMsg
	"""
	「きいろのかけら」と
	「
	"""
	printItem
		buffer = 0
		item = 36
	"」がひつようなのじゃ"
	keyWait
	clearMsg
	"いま、わかっておるのは、それだけじゃ"
	keyWait
	clearMsg
	"""
	いまワシのてもとに「きいろのかけら」は
	あるんじゃ・・・
	"""
	keyWait
	clearMsg
	"あと、「"
	printItem
		buffer = 0
		item = 36
	"""
	」があれば
	「
	"""
	printItem
		buffer = 0
		item = 37
	"」はできるが・・・"
	keyWait
	clearMsg
	"おまえさん、「"
	printItem
		buffer = 0
		item = 36
	"""
	」は
	もっておるか?
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
	"ハイ! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ないです"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 24,
			jump = continue,
			jump = continue
		]
	"""
	どこか、ほのおをおこすプログラムの
	なかにあるはずじゃ
	とにかくさがしだして、もってきな
	"""
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	おマエ やっぱりどこかで
	ミたコトあるぞ・・・
	"""
	keyWait
	clearMsg
	"""
	タシか・・・WWWジケンのトキに・・・
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
	"!"
	waitSkip
		frames = 20
	"\nオモいダしたぞ!!"
	keyWait
	clearMsg
	"""
	よ、ようこそ ウラスクエアへ
	・・・ハハ
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	コオリの ヒガイなんて
	ゼンゼン ウけてねえんだ!
	"""
	keyWait
	clearMsg
	"ワカるか?"
	keyWait
	clearMsg
	"""
	ココは、ナくコも ダマる
	ウラインターネットだぜ
	"""
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ウラインターネットには、
	オレたちも ハイれないエリアが
	あるんだ
	"""
	keyWait
	clearMsg
	"""
	まぁ、イけたとしても、イきてカエれる
	ホショウはナいけどな
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	オレの オペレータは よぉ!!
	フダツきの ワルだからよぉ!!
	"""
	keyWait
	clearMsg
	"""
	これクライの テンペンチイで
	プラグアウト するホド
	ヤワじゃねえっつーの!!
	"""
	keyWait
	clearMsg
	"オラァ! ゲッ、ゲフンッ!"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	しかし、アンタほどのオトコが、
	なんで こんなトコロに?
	"""
	keyWait
	clearMsg
	"""
	まさか、オレたちを ケしに・・・
	それは、カンベンしてくれ!!
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ミチにマヨってココまで
	キたけど・・・
	"""
	keyWait
	clearMsg
	"""
	どうやら、キちゃ いけない
	トコロに キてしまったみたいだ
	"""
	keyWait
	clearMsg
	"""
	ミンナ ガラのワルい カオツきしてるし
	これって ヤバい?
	"""
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	なんだ? サイキンは、
	オモテのヤツが よくハイって
	クるな・・・
	"""
	keyWait
	clearMsg
	"""
	ウラの オソろしさを
	ガツンと ミせてやろうか?
	"""
	keyWait
	end
}
script 43 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ゴスペルのホンブが
	カイメツしたって ウワサが
	ナガれてるぜ
	"""
	keyWait
	clearMsg
	"ケッ! ザマあミろってんだ!"
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 14
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ワタシは ネットショウニン・・・
	イいモノ ありますよ?
	
	"""
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
		shop = 14
}
script 181 mmbn2 {
	clearMsg
	"マタ おコしクダさい!"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ワタシは ネットショウニンですが、
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 183 mmbn2 {
	checkShopStock
		shop = 15
		jumpIfStocked = continue
		jumpIfSoldOut = 185
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは サブチップショウニン・・・
	イいモノ ありますよ?
	
	"""
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
			jump = 184,
			jump = continue
		]
	startShop
		shop = 15
}
script 184 mmbn2 {
	clearMsg
	"マタ おコしクダさい"
	keyWait
	end
}
script 185 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシは サブチップショウニンですが、
	イマは イいモノ ありません・・・
	"""
	keyWait
	end
}
script 220 mmbn2 {
	jump
		target = 180
}
script 221 mmbn2 {
	jump
		target = 183
}
script 222 mmbn2 {
	msgOpen
	"かりです"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"かりです"
	keyWait
	end
}
