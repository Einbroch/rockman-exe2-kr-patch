@archive 078E7B8
@size 22

script 0 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"おまえ・・・"
	waitSkip
		frames = 30
	"""
	
	オフィシャルの エースネットバトラー
	伊集院炎山!?
	"""
	keyWait
	clearMsg
	"""
	かいがいの ようどうぶたいは
	なにを やっているんだ!?
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"フン そいつらなら 今ごろ おねんねさ"
	waitSkip
		frames = 30
	"\nま、ちょっと てこずっちまったがな"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"チッ!!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山! "
	waitSkip
		frames = 30
	"たすかった!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	flagSet
		flag = 595
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	れいを いわれる すじあいはない
	オレは かりを・・・
	"""
	waitSkip
		frames = 30
	"""
	アメロッパでの
	かりを かえしに きただけだ
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	りょーーかい!
	そういうことに しといてやるよ!
	"""
	keyWait
	clearMsg
	"でもな さんきゅ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"""
	ムッ!
	みんな ゆだんするな!
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"きゃ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだコレ!? ヤバそうだぜ!!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"フフフフハハハハハハハ!!!!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なにが おかしいんだ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	flagClear
		flag = 526
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"ここまで おまえらが やるとはな!"
	waitSkip
		frames = 30
	"\nだが もうおそい! "
	waitSkip
		frames = 30
	"""
	たったいま
	「バグゆうごう」が かんりょうした!!
	"""
	keyWait
	clearMsg
	"""
	あとは このボタンを クリックすれば
	「きゅうきょくのナビ」が きどうする!!
	"""
	keyWait
	clearMsg
	"「きゅうきょくのナビ」・・・"
	waitSkip
		frames = 30
	"\nその名も 「フォルテ」だ!!!!"
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"なんだとっ!?"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"ほう、さすが オフィシャル・・・"
	waitSkip
		frames = 30
	"\n「フォルテ」のことを しっているようだな"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	flagSet
		flag = 526
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山? なんだよ 「フォルテ」って!?"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	手に入れた チップのデータを とりこみ
	いつでも はつどうすることが できる
	という、かんぜんむてきの ナビ・・・
	"""
	keyWait
	clearMsg
	"まさか じつざいするとは・・・"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	flagClear
		flag = 526
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"わがゴスペルの 「フォルテプロジェクト」"
	waitSkip
		frames = 30
	"""
	
	・・・ただ フォルテを
	つくりだした だけではないぞ
	"""
	keyWait
	clearMsg
	"""
	オレは ついに
	フォルテの むげんぞうしょくに
	せいこう したのだ!!
	"""
	keyWait
	clearMsg
	"""
	・・・これより むすうのフォルテを
	つかい、ぜん世界の ネットワークを
	しゅんじに しはいする!!
	"""
	keyWait
	clearMsg
	"""
	そうすれば、世界中の ぐんじ力も カネも
	オレのもの・・・
	"""
	waitSkip
		frames = 30
	"\nオレは このちきゅうの 王になるのだ!!"
	keyWait
	clearMsg
	"""
	これで 「フォルテプロジェクト」は
	カンペキに せいこうだ!!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そんなこと ぜったいに させやしない!!"
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン!!"
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん・・・
	あいては かんぜんむてきの ナビ・・・
	"""
	keyWait
	clearMsg
	"たとえ かてなくても・・・"
	waitSkip
		frames = 30
	"\nボクは まけない!"
	waitSkip
		frames = 30
	"\nかくごは できてる!!"
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	オレの オペレーションで
	ぜったい ロックマンを
	デリート させたりなんか するもんか!
	"""
	keyWait
	clearMsg
	"""
	オレたちが
	フォルテを デリートするんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 21
}
