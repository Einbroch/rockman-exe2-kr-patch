@archive 07954FC
@size 8

script 0 mmbn2 {
	msgOpen
	"""
	おおくのナビを すべるものよ、
	さきに すすむのだ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"トビラがひらくよ!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NapalmMan
	msgOpen
	"""
	おきゃくさんか めずらしいな
	ココまできたってコトは、
	ファラオマンをたおしたのか
	"""
	keyWait
	clearMsg
	flagSet
		flag = 318
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"お、おまえは だれだ!!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = NapalmMan
	msgOpen
	"""
	オイオイ、
	かってにヒトのエリアに はいっておいて、
	とんだごあいさつだな
	"""
	keyWait
	clearMsg
	"""
	まあいい オレさまはナパームマン
	このエリアを まもっている
	"""
	keyWait
	clearMsg
	"""
	このエリアにしんにゅうしたヤツを
	ブッたおす・・・
	それがオレのしごとだ
	"""
	keyWait
	clearMsg
	"""
	ま、ここまでくるヤツも
	めったにいないがな
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
	"ロックマン、ゆだんするなよ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = NapalmMan
	msgOpen
	"""
	しかし、ひさしぶりのエモノが
	こんな コドモだとはな
	ファラオマンも どうかしてるぜ
	"""
	keyWait
	clearMsg
	"""
	カラダも なまってたトコロだ
	ちょうどいい うんどうになるだろう
	"""
	keyWait
	clearMsg
	"じゃあ そろそろ おっぱじめるか"
	keyWait
	clearMsg
	"""
	・・・・・・
	いのちがけのバトルをよ!!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
