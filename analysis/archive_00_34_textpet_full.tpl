@archive 075F6BC
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	わがアメロッパの れきしの しょうちょう
	アメロッパじょうへ ようこそ!!
	"""
	keyWait
	clearMsg
	"""
	かこから げんざいまで
	アメロッパは さいせんたんの ぶんめいを
	ほこっているのです!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"フム・・・"
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 61
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"ンダ オイラは アメロッパ人ダ・・・"
	keyWait
	clearMsg
	"""
	今日は はじめて イナカから 出てきたダ
	やっぱ とかいは すごいダナ
	"""
	keyWait
	end
}
script 10 mmbn2 {
	flagSet
		flag = 545
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"あら・・・"
	waitSkip
		frames = 30
	"""
	
	アナタ おなかま みたいね
	アタシには わかるよ
	"""
	keyWait
	clearMsg
	"""
	アタシは もう 見つけたよ、
	かいぎじょうへの かくしつうろ
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ぼうやも あさから
	おしろの かんこうかい?
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	すばらしい おしろだ
	これは いい みやげばなしに なるぞ
	"""
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = PigtailsGirl
	msgOpen
	"""
	わぁ~ スゴイ スゴイ
	おしろ、おしろ!
	キャッ キャッ!
	"""
	keyWait
	end
}
script 32 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 54
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 56
		jumpIfInRange = 37
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	この おしろは
	オフィシャルセンターの こくさいほんぶ
	で あると どうじに、
	"""
	keyWait
	clearMsg
	"""
	世界てきに ゆうめいな
	かんこうめいしょ でもあります
	"""
	keyWait
	clearMsg
	"""
	・・・でも
	オフィシャルの ほんぶ ということは
	いっぱんの人には ナイショなんです
	"""
	keyWait
	end
}
script 33 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	この ビロッコようしきの はしら
	タマらないわ・・・
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	今日は かんこうきゃくが
	いように すくないわね・・・
	こんなコト、いちどもなかったのに
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	みんな、そとから ひなんしてきた
	みたいなのよ
	"""
	keyWait
	clearMsg
	"""
	なんでも、とてつもなく ひざしが
	つよいらしいわね
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	そとに くらべたら
	ここは、ごくらく じゃわい
	はやく、ひが しずまんかの?
	"""
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = NetopiaGirl
	msgOpen
	"""
	なんとか、ひなんできたのは
	いいけど、しばらくは
	ココから でられないわね・・・
	"""
	keyWait
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	そうか、この いじょうきしょうは、
	しぜんの いかりなのじゃ
	"""
	keyWait
	clearMsg
	"""
	しぜんを キズつけすぎた
	にんげんに たいする
	しぜんからの せいさい なのじゃ!
	"""
	keyWait
	end
}
script 49 mmbn2 {
	mugshotShow
		mugshot = BlackKid
	msgOpen
	"""
	まいったぜ こりゃ
	こんな いじょうきしょう
	はじめてだぜ!
	"""
	keyWait
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	てんこうも、もとどおりになって
	かんこうきゃくも、きてくれるように
	なったの
	"""
	keyWait
	clearMsg
	"とりあえず、ひとあんしんね"
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	このおしろの なかにいると、
	ナニか、しんせいな きぶんになれるわ
	"""
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"""
	オゥ イェー
	ビューティーだぜ!
	"""
	keyWait
	clearMsg
	"""
	いってみれば、おしろは
	げいじゅつさくひんの
	しゅうごうたいだな
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	こんなに こくみんに あいされている
	アメロッパじょう・・・
	"""
	keyWait
	clearMsg
	"""
	かりに ここに オフィシャルのほんぶが
	ないとしても、わたしは イノチを かけて
	まもりぬきます!
	"""
	keyWait
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	アメロッパじょうを まもるために
	イナカから でてきたダ!
	"""
	keyWait
	clearMsg
	"""
	キャッスルは
	ゴスペルの すきに させないダ!
	"""
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"そうでゴワス!"
	keyWait
	clearMsg
	"""
	アメロッパじょうは
	ワシらの ハートの よりどころでゴワス!
	"""
	keyWait
	end
}
script 180 mmbn2 {
	checkShopStock
		shop = 19
		jumpIfStocked = continue
		jumpIfSoldOut = 182
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	りょこう中の ハプニングに そなえ
	サブチップは すこしでも もっていたい
	もの・・・どうです?
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
	"かう "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"かわない"
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
		shop = 19
}
script 181 mmbn2 {
	clearMsg
	"""
	たびは ハプニングを たのしむもの・・・
	そういう かんがえかたも あります
	"""
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
script 220 mmbn2 {
	msgOpen
	"""
	こうごうしい めがみぞうだ
	よくみると、プラグインできそうだ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	うえにあがる かいだんだが、
	たちいりきんしのようだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkFlag
		flag = 545
		jumpIfTrue = 223
		jumpIfFalse = continue
	msgOpen
	"""
	おうけの もんしょう だろうか
	ここにだけ かかげられている・・・
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	熱斗は もんしょうの あたりを
	ちゅういぶかく しらべてみた
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	"""
	なんと! もんしょうの まわりは
	ホログラムにうつされた えいぞうだった!
	ここから オクに すすめそうだ!
	"""
	keyWait
	end
}
