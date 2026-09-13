@archive 0785400
@size 20

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ん? そろそろ
	かいぎが はじまるみたいだよ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	せかいを だいひょうする
	ネットバトラーの みなさま ようこそ!
	"""
	keyWait
	clearMsg
	"""
	ただいまより
	「オフィシャルネットバトラーかいぎ」
	を かいさいします
	"""
	keyWait
	clearMsg
	"""
	それでは まず、かがやける
	ネットバトラーである みなさまの
	しょうかいを わたしから・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	そんなの もう
	じぶんたちで やっちゃったよ
	それより はやく ほんだいに 入ろうよ
	"""
	keyWait
	clearMsg
	"""
	もりだくさん かかえてる じけんを
	ほっぽりだして きたんだからさ
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"わたくしも そうおもいます"
	keyWait
	clearMsg
	"""
	「ゴスペル」に かんする
	じゅうだいな じょうほう
	"""
	keyWait
	clearMsg
	"""
	それを つたえるために
	わたしたちを よびだしたのでしょう?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	しかし ニホンは なにかんがえてんだー?
	こんな キッズを・・・しかも ふたりも
	よこすなんてなー?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	フン、なんなら そのキッズとやらと
	いまここで ネットバトル してみるか?
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	そりゃ ファンキーだ!
	カモナ ベイビー!!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"おとなげないぞ ジョンソン!"
	keyWait
	clearMsg
	"とにかく かいぎを さきにすすめよう!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	soundStop
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	は はい、それでは 「ゴスペル」に
	かんする じゅうだいな じょうほうの
	ないようについて せつめいします
	"""
	keyWait
	clearMsg
	soundPlayBGM
		track = 20
	"""
	「ゴスペル」は、おそろしい ことに
	「きゅうきょくのナビ」を かいはつ
	しています
	"""
	keyWait
	clearMsg
	"""
	それは・・・
	「すべてにおいて かんぜんな ナビ」
	"""
	keyWait
	clearMsg
	"""
	そして「ゴスペル」は それを つかって
	いよいよ ほんかくてきに げんじつと
	でんのう、
	"""
	keyWait
	clearMsg
	"""
	りょうほうの せかいを
	せいふくしようと しているのです
	"""
	keyWait
	clearMsg
	"""
	「きゅうきょくのナビ」が かんせい
	されれば、りろん上 それを
	デリートすることは ふかのうです
	"""
	keyWait
	clearMsg
	"""
	われわれは なんとしてでも
	そのかいはつを そしせねば なりません
	"""
	keyWait
	clearMsg
	"""
	そして、そのための
	じゅうだいな じょうほうを ほんぶでは
	にゅうしゅ しました
	"""
	keyWait
	clearMsg
	"""
	それでは、
	ぜんぽうの スクリーンを ごらん下さい
	"""
	keyWait
	flagSet
		flag = 552
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"これが そのじょうほう・・・アレ?"
	keyWait
	clearMsg
	soundStop
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"なにも・・・うつりませんね?"
	keyWait
	end
}
script 11 mmbn2 {
	msgOpen
	soundDisableTextSFX
	"ゴゴゴ・・・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 12
}
script 12 mmbn2 {
	soundPlayBGM
		track = 14
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"! みんな 気をつけて!"
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"わーーーー!!!"
	keyWait
	end
}
script 14 mmbn2 {
	msgOpen
	soundDisableTextSFX
	"ゴゴゴゴゴゴゴゴゴ!"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	む! イカン!
	みんな にげるんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"ダメだ もうおそい!"
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"わーーーーーーー!"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"キャーーーーーー!"
	keyWait
	clearMsg
	jump
		target = 19
}
