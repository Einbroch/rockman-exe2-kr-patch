@archive 078A3B4
@size 17

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	パパたいへんだよ!!
	インターネットで、ロールが
	ゆくえふめいに なっちゃったんだ!
	"""
	keyWait
	clearMsg
	"""
	それに、ヘンな こおりみたいなモノが
	たくさんおちてて・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ロールがゆくえふめい・・・
	おそらく、その こおりがげんいんだろう
	"""
	keyWait
	clearMsg
	"""
	インターネットにおきた
	いへんを しらべてみて
	タイヘンなコトがわかった
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"タイヘンなコト?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	いま、せかいじゅうで てんぺんちいが
	おきている
	"""
	keyWait
	clearMsg
	"""
	あまり しられてはいないコトだが、
	せかいじゅうの かんきょうは、
	"""
	keyWait
	clearMsg
	"""
	かっこくにある
	「かんきょういじシステム」によって
	"""
	keyWait
	clearMsg
	"""
	しぜんさいがいが おきないように
	かんりされているんだ
	"""
	keyWait
	clearMsg
	"""
	しかし、インターネットに
	はっせいしたこおりは、
	"""
	keyWait
	clearMsg
	"""
	「かんきょういじシステム」を
	フリーズさせるチカラをもつ
	とくしゅなウイルスだったんだ
	"""
	keyWait
	clearMsg
	soundPlayBGM
		track = 13
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ウイルス? あれが?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ああ じょきょさぎょうにあたった
	オフィシャルのナビはほとんど
	やられてしまった・・・
	"""
	keyWait
	clearMsg
	"それほどキケンなシロモノなんだ"
	keyWait
	clearMsg
	"""
	こおりがたウイルスは、
	しろ、あか、あお、きいろの4しゅるい
	あるコトがわかった
	"""
	keyWait
	clearMsg
	"""
	さらに あのこおりを とりのぞくには
	とくしゅなワクチンがひつようなんだ
	"""
	keyWait
	clearMsg
	"""
	そして、いま われわれに
	つくるコトができるワクチンは
	"""
	keyWait
	clearMsg
	"""
	あかい こおりをこわすための
	「
	"""
	printItem
		buffer = 0
		item = 35
	"」だけなんだ・・・"
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 35
	"""
	」を つくるのにも
	あかい こおりがたウイルスの
	サンプルデータが ひつようなんだ
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	サンプルってもしかして
	コレのコト?
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotHide
	msgOpen
	itemTake
		item = 34
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 34
	"""
	」を
	パパにわたした!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	おお、コレをもとに
	「
	"""
	printItem
		buffer = 0
		item = 35
	"""
	」をつくることができる
	ちょっとまっていてくれ
	"""
	keyWait
	clearMsg
	flagSet
		flag = 520
	mugshotAnimate
		animation = 0
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタカタカタ"
	soundEnableTextSFX
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"よしできた!!"
	keyWait
	flagClear
		flag = 520
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 35
	"」ができたぞ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotHide
	msgOpen
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 35
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 1
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	いっこくもはやく、
	インターネットじゅうに はっせいした
	こおりを じょきょしてしまわないと
	"""
	keyWait
	clearMsg
	"""
	なんじゅうねんも プログラムのちからで
	おさえられてきたしぜんのチカラが、
	ぼうそうし そして・・・
	"""
	keyWait
	clearMsg
	"せかいは、はめつにむかうだろう・・・"
	keyWait
	clearMsg
	"""
	これからパパは、ちょくせつ
	「かんきょういじシステム」を
	しゅうふくしに いってくる
	"""
	keyWait
	clearMsg
	"しばらく、ココにはもどらないだろう"
	keyWait
	clearMsg
	"""
	インターネットの こおりは
	おまえたちにまかせた
	"""
	keyWait
	clearMsg
	"""
	じゅうだいな にんむを
	まかせるコトになるが、
	"""
	keyWait
	clearMsg
	"""
	ふたりのチカラを あわせれば
	かならず せいこうするとしんじている
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	パパ、まかせといてよ!
	せかいは、オレたちがまもってみせるよ!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"たのんだぞ!"
	keyWait
	clearMsg
	"""
	パパは「かんきょういじシステム」を
	みにいってくる
	"""
	keyWait
	clearMsg
	"たのんだぞ熱斗、ロックマン!"
	keyWait
	flagSet
		flag = 520
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、いそごう!"
	keyWait
	clearMsg
	jump
		target = 16
}
