@archive 077DEA0
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	あ キ キミ、
	そこは かんけいしゃ いがい
	立ち入り キンシだよ!
	"""
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
	んなこと いったって
	炎山 ここにいるかも しれないんだ!
	"""
	keyWait
	clearMsg
	"""
	くそ! あいつ
	いったい なに やってんだよっ!?
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん!! 炎山くんからだよ!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	おい! おまえ この中に いるのか!?
	こんなときに なに やってんだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	たしかに オレは ダムの中だ
	それより 光、オレの ハナシを きけ
	"""
	keyWait
	clearMsg
	"""
	じつは きのうの よる、ダムばくはの
	よこくが オフィシャルスクエアの
	けいじばんに あった
	"""
	keyWait
	clearMsg
	"""
	つまり オレが キャンプに きたのは
	じけんの ごくひそうさを するため
	だったんだ
	"""
	keyWait
	clearMsg
	"""
	そして いま、ダムの 中に
	たいりょうの じげんバクダンが
	セットされているのを はっけんした
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	マジかよ! じゃ オレも行く!
	ドア あけてくれ!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	はやがてん するな
	おまえには べつに
	やってほしいことが ある
	"""
	keyWait
	clearMsg
	"""
	バクダンの中に、がいぶから
	きばくそうちを つかって バクハツさせる
	タイプのものが いくつかある
	"""
	keyWait
	clearMsg
	"""
	おまえには、その きばくそうちを
	さがしだして きばくプログラムを
	ムコウに してもらいたいんだ
	"""
	keyWait
	clearMsg
	"できるか?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	バカに すんな! ロックマンが いれば
	それくらい かるいもんさ!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	だといいが・・・
	とにかく これは ほんらい
	オフィシャルである オレの しごとだ
	"""
	keyWait
	clearMsg
	"""
	ダムの中の バクダンを
	すべて しょりしたら そっちに 行く!
	"""
	keyWait
	clearMsg
	"""
	それまでに ひとつでも 多く
	きばくそうちを さがしだしてくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
