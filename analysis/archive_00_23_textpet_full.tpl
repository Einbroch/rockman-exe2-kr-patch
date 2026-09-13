@archive 0755FFC
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 12
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	さっきの バクハツで
	ダムのいちぶが はかい されたんだ!
	"""
	keyWait
	clearMsg
	"ワタシの よかんでは・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"\nつぎの バクハツは かならずくる!"
	keyWait
	clearMsg
	"そして そのとき・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"\nダムは けっかいする!!!!"
	keyWait
	clearMsg
	"だから ワタシは ニゲル!"
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	さっき ダムの かんりとうの 中に
	しょうねんが 入っていったんだが
	まだ 出てこない・・・
	"""
	keyWait
	clearMsg
	"""
	たすけ出すべきか ひとりで にげるべきか
	・・・う~ん
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 11
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	わたしが ダムを
	バクハツ させたんじゃ ないかって?
	"""
	keyWait
	clearMsg
	"""
	わ、わたしは ちがいますよ!
	めっそうも ない!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	そうかい、あの しょうねんは
	オフィシャルネットバトラー だったのかい
	"""
	keyWait
	clearMsg
	"なら にげても だいじょうぶかな・・・"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"きいてましたよ!"
	keyWait
	clearMsg
	"""
	これまでの キャンプで みにつけた
	テクニックを つかえば、きばくそうちを
	見つけられるんじゃ ないでしょうか?
	"""
	keyWait
	clearMsg
	"たいへんですが がんばって ください!"
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ワタシだって かがくしゃの はしくれだ!
	にげるまえに これだけは
	つたえておくぞ!
	"""
	keyWait
	clearMsg
	"""
	・・・ウイルスと バトルチップは
	「ぞくせい」 という
	せいしつを もっている
	"""
	keyWait
	clearMsg
	"""
	ぞくせいには あいしょうがあって、
	ゆうりな ぞくせいの バトルチップで
	ウイルスに こうげきを くらわせると、
	"""
	keyWait
	clearMsg
	"""
	なんと! つうじょうの
	2ばいのダメージを あたえられるんだ!!
	"""
	keyWait
	clearMsg
	"""
	ちなみに、ファイアは ウッドに、
	ウッドは エレキに、エレキは アクアに
	アクアは ファイアに、あいしょうが いい
	"""
	keyWait
	clearMsg
	"""
	むぞくせい・・・いわゆる ノーマルは
	どれにも つよくないし よわくもない
	"""
	keyWait
	clearMsg
	"""
	ぞくせいの つかいかた しだいでは
	つよいウイルスも かんたんに
	たおせるんだ
	"""
	keyWait
	clearMsg
	"と いうことで あとは マカセタ!"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	こんごの ために
	じけんに つかわれた きばくそうちの
	かいせきを しています
	"""
	keyWait
	clearMsg
	"""
	・・・それにしても せいちに つくられた
	きばくそうちですよ、コイツらは
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	ひさびさの オフ なんだ
	できれば かまわないでくれ
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 45 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	じしんが、おきたんで
	ここに ひなんしてきたんだが
	このダムが、ほうかいしたら・・・
	"""
	keyWait
	clearMsg
	"かんがえただけで ゾッとするね"
	keyWait
	end
}
script 46 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	あ~、きっとダンナがしんぱい
	してるんだろうな~
	"""
	keyWait
	end
}
script 47 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	まさか、キャンプじょうに きて
	こんなメにあうとは おもわなかったよ
	"""
	keyWait
	end
}
script 48 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 63
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	せっかく、おくデンだにまで
	きたのに、ざんねんでーーす
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	にんむ中だ・・・
	それに おまえに きょうりょくする
	すじあいも ないんでな
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 60 mmbn2 {
	mugshotShow
		mugshot = CampMan
	msgOpen
	"""
	もう、よしんは ないな
	たぶん、もうだいじょうぶだな
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"いそいで、ダンナに れんらくしなきゃ"
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = OrangeShirtBoy
	msgOpen
	"""
	あ~、たいへんな、いちにちだったけど、
	いっしょうわすれられない
	おもいでになったよ
	"""
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"さぁ! かんこうするわよ!"
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	クイックマンに おそわれてから
	われわれも ネットテロたいさくを
	きょうか しました
	"""
	keyWait
	clearMsg
	"""
	だから わたしも
	ダムしゅうへんに ふしんなものが ないか
	こうして 見まわりをしている わけです
	"""
	keyWait
	end
}
script 160 mmbn2 {
	checkChapter
		lower = 56
		upper = 63
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	end
}
script 161 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、炎山くんに
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
		flag = 186
		jumpIfTrue = 165
		jumpIfFalse = continue
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	バトルデータを あつめておくのも
	わるくない・・・
	"""
	waitSkip
		frames = 15
	"か"
	keyWait
	clearMsg
	jump
		target = 163
}
script 163 mmbn2 {
	flagSet
		flag = 186
	msgClose
	waitHold
}
script 164 mmbn2 {
	flagClear
		flag = 187
	flagClear
		flag = 188
	flagClear
		flag = 189
	mugshotShow
		mugshot = Chaud
	msgOpen
	"おくびょうかぜに ふかれたか・・・"
	keyWait
	end
}
script 165 mmbn2 {
	flagClear
		flag = 187
	flagClear
		flag = 188
	flagClear
		flag = 189
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	やめておくんだな・・・
	今までの しょうりが フロックだった
	ことを おもいしるだけだ・・・
	"""
	keyWait
	end
}
script 166 mmbn2 {
	checkFlag
		flag = 187
		jumpIfTrue = 167
		jumpIfFalse = continue
	checkFlag
		flag = 188
		jumpIfTrue = 169
		jumpIfFalse = continue
	checkFlag
		flag = 189
		jumpIfTrue = 171
		jumpIfFalse = 171
}
script 169 mmbn2 {
	checkFlag
		flag = 192
		jumpIfTrue = 174
		jumpIfFalse = continue
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	・・・りろんてきには
	ありえない けっかだが・・・
	"""
	keyWait
	clearMsg
	jump
		target = 170
}
script 170 mmbn2 {
	flagSet
		flag = 192
	flagClear
		flag = 188
	end
}
script 175 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	マグレは
	そう つづくものでは ない・・・
	"""
	waitSkip
		frames = 15
	"\nそれを しょうめいしたに すぎん・・・"
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 17
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	じつは、ワタシ は
	サブチップしょうにんなんだよ・・・
	みていくかい?
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
		shop = 17
}
script 181 mmbn2 {
	clearMsg
	"また、きておくれよ"
	keyWait
	end
}
script 182 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	すまないね、
	いま、しなぎれちゅうなんだよ
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 149
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 149
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ココでナニをやってるのかって?
	べ、べつに た、ただのかんこうさベイベー
	なんでそんなコトきくんだい ボーイ?
	"""
	keyWait
	clearMsg
	"""
	ぜ、ぜんぜん アヤしくないぜ
	どこからみても、ふつうの
	がいこくじん かんこうきゃくだろ?
	"""
	keyWait
	clearMsg
	"HAHAHA・・・"
	keyWait
	clearMsg
	"""
	ヘイ!!
	このまま おとなしくかえったほうが
	みのためだぜ
	"""
	keyWait
	end
}
script 191 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	ボーーーーーーーーーーーーーーーーイ
	きょうのオレは
	すこぶる きげんがワルいんだ
	"""
	keyWait
	clearMsg
	"はやく おウチにかえりな"
	keyWait
	clearMsg
	"""
	そして、ここでオレにあったコトも
	わすれるんだ わかったな
	"""
	keyWait
	end
}
script 193 mmbn2 {
	flagSet
		flag = 305
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	キミは、SSSライセンスしけん の
	じゅけんしゃだね
	"""
	keyWait
	clearMsg
	"これが、ワタシの キーワードだ"
	keyWait
	clearMsg
	"「きょだいな トリのずのう」"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ものすごい いきおいでミズが
	ながれおちている ようすがみえる
	"""
	keyWait
	clearMsg
	"ぜっけいとは、まさにこのコトだろう"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	おくデンだに マップだ
	したのほうに ちいさくナニか
	かいてある・・・
	"""
	keyWait
	clearMsg
	"「クマに ちゅうい!」"
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"いきどまりだ・・・"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ものすごい ごうおんと ともに
	ミズが ながれおちている
	"""
	keyWait
	clearMsg
	"""
	このミズは、かわとなり
	やがて デンサンシティへながれつく
	"""
	keyWait
	end
}
script 225 mmbn2 {
	checkChapter
		lower = 15
		upper = 15
		jumpIfInRange = 226
		jumpIfOutOfRange = continue
	checkChapter
		lower = 14
		upper = 14
		jumpIfInRange = 227
		jumpIfOutOfRange = continue
	msgOpen
	"""
	ダムの かんりとうの中に
	入っていける ドアだ
	"""
	keyWait
	end
}
script 226 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ここは 炎山くんに まかせて
	ボクたちは きばくそうちを さがしに
	行こう!
	"""
	keyWait
	end
}
script 227 mmbn2 {
	checkFlag
		flag = 640
		jumpIfTrue = 226
		jumpIfFalse = continue
	flagSet
		flag = 641
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	はんこうに つかわれた PETだ
	今は 1つめの 電脳世界に プラグイン
	するように せってい してある
	"""
	keyWait
	end
}
script 229 mmbn2 {
	msgOpen
	"""
	はんこうに つかわれた 水とうだ
	今は 2つめの 電脳世界に プラグイン
	するように せってい してある
	"""
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"""
	はんこうに つかわれた PETだ
	今は 3つめの 電脳世界に プラグイン
	するように せってい してある
	"""
	keyWait
	end
}
script 231 mmbn2 {
	msgOpen
	"""
	はんこうに つかわれた PETだ
	今は 4つめの 電脳世界に プラグイン
	するように せってい してある
	"""
	keyWait
	end
}
