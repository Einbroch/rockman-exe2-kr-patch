@archive 078F5A0
@size 26

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん だいじょうぶ? "
	waitSkip
		frames = 30
	"熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"手は うごくぜ・・・"
	waitSkip
		frames = 30
	"""
	
	オペレーションなら しんぱい いらない
	・・・
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"ハ! ハハッ! "
	waitSkip
		frames = 30
	"できたぞ!!"
	waitSkip
		frames = 30
	"\nこれが ホンモノの フォルテだ!"
	keyWait
	clearMsg
	"フォルテ! "
	waitSkip
		frames = 30
	"""
	そいつを デリートしろ!!
	こんどは しくじるなよ!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	だれが あいてでも、これいじょう
	熱斗くんを くるしませるもの
	ボクが ゆるさない!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"・・・グ "
	waitSkip
		frames = 30
	"ゴガギギ・・・"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"!?"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"おい! どうしたんだよ!?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"ギグ・"
	waitSkip
		frames = 30
	"ガゲゴ・・"
	waitSkip
		frames = 30
	"ゴ"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"フ! ハ! ハハハハハハハハ!"
	waitSkip
		frames = 30
	"\nそれが オマエの ほんとうの すがたか!"
	keyWait
	clearMsg
	"いいじゃんか! つよそうじゃんか!"
	waitSkip
		frames = 30
	"""
	
	おい! そんなヤツ
	そっこう デリート しちゃうんだ!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"なんだよ!?"
	waitSkip
		frames = 30
	"\nオレの メイレイが きこえないのかよ!"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"熱斗! "
	waitSkip
		frames = 30
	"ロックマン!"
	waitSkip
		frames = 30
	"\nきこえるか!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"パパ!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	たった 今
	たいへんなことが わかったんだ!
	よくきいてくれ!
	"""
	keyWait
	clearMsg
	"""
	ゴスペルの
	「きゅうきょくナビかいはつけいかく」には
	大きな けっかんが あったんだ
	"""
	keyWait
	clearMsg
	"""
	「バグゆうごう」から
	きゅうきょくのナビ なんて
	つくれやしない!
	"""
	keyWait
	clearMsg
	"もし、できるとしたら・・・"
	waitSkip
		frames = 30
	"""
	それは
	「きゅうきょくのバグゆうごうたい」 だ!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"パパ! それより 熱斗・・・"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマンは だまってて!"
	keyWait
	clearMsg
	"""
	パパ! じゃ 今 ここにいるのは
	フォルテ じゃないってこと!?
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	なんだって!?
	もう 「バグゆうごうたい」 は
	うまれて しまったのか!
	"""
	keyWait
	clearMsg
	"""
	そいつは ほおっておくと
	世界中の ネットワークに
	バグを まきちらす
	"""
	keyWait
	clearMsg
	"世界は だれでもない、"
	waitSkip
		frames = 30
	"""
	
	バグに しはい されてしまうことに
	なるぞ!
	"""
	keyWait
	clearMsg
	"""
	熱斗! 「バグゆうごうたい」を
	デリート するんだ!
	"""
	waitSkip
		frames = 30
	"\nロックマンの 力に なってやれよ!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"パパ・・"
	waitSkip
		frames = 30
	"まか・・・"
	waitSkip
		frames = 30
	"せて"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"熱斗! おまえ どうかしたのか!"
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんでも・・・"
	waitSkip
		frames = 30
	"ないよ"
	waitSkip
		frames = 30
	"\nパパ・・・"
	waitSkip
		frames = 30
	"ありがと・・・"
	waitSkip
		frames = 30
	"もう きるよ"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん・・・"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"もう オレたちが やるしかないんだ・・・"
	waitSkip
		frames = 30
	"""
	
	パパに よけいな しんぱいは
	かけられない・・・
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"わかった・・・"
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"グワーーーー!!"
	keyWait
	clearMsg
	jump
		target = 24
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだ・・・"
	waitSkip
		frames = 30
	"ガハッ!!!"
	keyWait
	clearMsg
	jump
		target = 25
}
