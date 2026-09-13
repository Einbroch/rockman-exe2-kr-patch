@archive 0786B78
@size 8

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"プリンセス・プライド!?"
	keyWait
	clearMsg
	"""
	おまえが 「ゴスペル」の
	ネットバトラー だったのか!!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	ふふっ、そのとおり
	わたくしは 「ゴスペル」の かんぶ・・・
	"""
	keyWait
	clearMsg
	"""
	ボスの めいれいで
	みなさんの中に まぎれこみましたの
	"""
	keyWait
	clearMsg
	"""
	でも オフィシャルネットバトラーも
	大したこと ありませんね
	みんな かんたんに だまされるんですもの
	"""
	keyWait
	clearMsg
	"""
	・・・それにしても、
	あなたが くるなんてね
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
	"どういうことだよ!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	わたくしを たおしに くるのは
	てっきり あの炎山て しょうねんかと
	おもってたものだから・・・
	"""
	keyWait
	clearMsg
	"""
	だとしたら ちょっとやっかいかなって
	おもってましたのよ
	"""
	keyWait
	clearMsg
	"""
	・・・それで あなた、どうやって
	わたくしを たおそうと いうのかしら?
	"""
	keyWait
	clearMsg
	"""
	そちらの ユカ、さっきみたいに
	もうすぐ ぬけちゃいますわよ・・・
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おなじ手は なんども くらわない!!"
	waitSkip
		frames = 15
	"""
	
	こっちには ワイヤレスプラグが
	あるんだ!!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	ふふっ
	それぐらいは やってもらいませんとね
	"""
	keyWait
	clearMsg
	"""
	ナイトマンが まちかねてますわよ
	ロックマン だったかしら?
	はやく いらっしゃい
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、行くぜ!!"
	keyWait
	clearMsg
	jump
		target = 7
}
