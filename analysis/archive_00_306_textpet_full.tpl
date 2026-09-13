@archive 078B210
@size 15

script 0 mmbn2 {
	mugshotShow
		mugshot = FreezeMan
	msgOpen
	"""
	カハッ! まさかこのワタシが
	やぶれようとは・・・
	"""
	keyWait
	clearMsg
	"""
	しかし、もうおそい!
	だいじしん はっせいまで
	あと わずかだ!
	"""
	keyWait
	clearMsg
	"""
	ワタシを たおしたとしても
	ワクチンを つくるじかんはあるまい!
	"""
	keyWait
	clearMsg
	"""
	フハハハ! ひとあしさきに
	あのよで せかいのはめつを
	みせてもらうぞ
	"""
	keyWait
	clearMsg
	"ゴスペルよ えいえんなれ!!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	"""
	フリーズマンのカラダから
	なにかひかるモノがちらばった!
	"""
	keyWait
	clearMsg
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「あおのかけら」
	を ゲットした!!
	"""
	playerFinish
	playerAnimate
		animation = 1
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	やったよ熱斗くん、「あおのかけら」
	てにいれた・・・
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotHide
	msgOpen
	soundPlay
		track = 293
	"パキーーーン"
	wait
		frames = 60
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"あっ!!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、どうした!!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	とつぜん、「あおのかけら」が
	くだけちゃったよ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そ、そんな?
	ウソだろ?
	"""
	keyWait
	clearMsg
	"ど、どうすりゃいいんだ・・・!?"
	keyWait
	clearMsg
	"""
	せかいは、このまま
	はめつ しちまうのか?
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"そのシンパイはないぞよ"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ヤミいしゃさん!
	どうしてココに?
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	この じけんのけつまつを
	みにきたのじゃ
	"""
	keyWait
	clearMsg
	"そして、このじけんはどうやら、"
	keyWait
	clearMsg
	"ハッピーエンドみたいじゃのう"
	keyWait
	clearMsg
	"ホレ、みてみい"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"コオリがひとりでにコワれはじめた"
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	おそらく、おまえさんがたおした
	ナビは、これらのコオリすべての
	チカラのもとだったのじゃろう
	"""
	keyWait
	clearMsg
	"""
	チカラのみなもとを うしなった
	コオリが、くだけはじめたんじゃ
	"""
	keyWait
	clearMsg
	"""
	おそらく ほかのエリアにある
	コオリもくだけはじめておるじゃろう
	"""
	keyWait
	clearMsg
	"ふぃ~"
	keyWait
	clearMsg
	flagClear
		flag = 520
	"""
	ひさしぶりに シゴトしたから
	つかれてしもうたわい
	さて ウラスクエアに かえるかの
	"""
	keyWait
	clearMsg
	"""
	おっと、そのまえに ワクチンだいと
	めいわくりょうを オフィシャルに
	せいきゅうしておかんとな
	"""
	keyWait
	clearMsg
	"""
	いくら ひっぱれるかの?
	ヒャッヒャッヒャッ・・・
	"""
	keyWait
	clearMsg
	"""
	おまえさんたちも かえるがいい
	きっと みんなまっとるぞい
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"はい! ありがとうございました!"
	keyWait
	clearMsg
	"""
	さぁ、熱斗くん かえろう!
	みんなのトコロに!!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
