@archive 07871E8
@size 15

script 0 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	あなたたちの おかげで
	オフィシャルきょうかい かいめつの
	ピンチを ふせぐことが できました
	"""
	keyWait
	clearMsg
	"おれいを いいます"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	それより ラウルさんは!?
	だいじょうぶなの?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	いまごろは びょういんでしょう
	はっけんが はやかったのが
	なによりでした
	"""
	keyWait
	clearMsg
	"""
	ほかの みなさんも たすけだしています
	キズは ふかいですが
	なんとか いちめいを とりとめたようです
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	プリンセスは・・・?
	やっぱり しんじゃった?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"かのじょも たすけだしています"
	keyWait
	clearMsg
	"""
	ただ、ケガのかいふくを まって
	オフィシャルの きびしい とりしらべが
	あるでしょう
	"""
	keyWait
	clearMsg
	"""
	とうぶん
	あうことは できないと おもいますよ
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
	"こんな話を きいたことがある・・・"
	keyWait
	clearMsg
	"""
	インターネットが ふきゅう しだしたころ
	クリームランドは どのクニよりも はやく
	ネットを はってんさせた
	"""
	keyWait
	clearMsg
	"""
	それが せいこうして、
	キタの 小さなクニが いちやく
	せんしんこくの なかま入りを したんだ
	"""
	keyWait
	clearMsg
	"""
	しかし それもつかのま、大きなクニが
	それをマネして ネットを ほんかくてきに
	ふきゅう させると、
	"""
	keyWait
	clearMsg
	"""
	クリームランドは 
	ジャマもの あつかいを うけ
	ふたたび すいたい していった・・・
	"""
	keyWait
	clearMsg
	"""
	そのうらみが あったから
	プリンセスは ゴスペルに 入ったのかも
	しれんな・・・
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そんなことが あったんだ・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	だからといって プリンセスが
	ただしかったとは オレは おもわん・・・
	だが・・・
	"""
	keyWait
	clearMsg
	"""
	ハッキリしているのは、オレたちが
	ほんとうに にくむべきは ネットマフィア
	「ゴスペル」 だということだ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ!"
	keyWait
	clearMsg
	"""
	ロックマンと ブルースが 力をあわせて
	ゴスペルに たちむかわないとな!
	"""
	keyWait
	clearMsg
	"""
	って、ゴメン・・・
	オレ ブルースを・・・
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"フンッ"
	keyWait
	clearMsg
	"""
	わすれてもらっては こまるな・・・
	オレは おまえとは こんぽんてきに
	ちがうんだ・・・
	"""
	keyWait
	clearMsg
	"""
	ブルースの すべてのプログラムは
	おれの アタマの中に 入っている・・・
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"え! じゃあ ブルースは!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	・・・きさまに よろこばれる
	すじあいは ない
	"""
	keyWait
	clearMsg
	"""
	それに、ハッキリ 言っておくが
	オレは おまえと きょうりょくする
	つもりもない
	"""
	keyWait
	clearMsg
	"""
	つぎに あうときは
	オレが・・・ブルースが ロックマンを
	たおすときだ・・・
	"""
	keyWait
	clearMsg
	"じゃあな"
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"チェッ 炎山のやつ・・・"
	keyWait
	clearMsg
	"""
	・・・でも ゴスペル、なんてヤツらだ!
	ぶっつぶしてやる!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん! ボクも ぜったいにまけない!
	やろう 熱斗くん!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
