@archive 078589C
@size 19

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! "
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
	"う "
	waitSkip
		frames = 30
	"うーん"
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
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ここは・・・"
	waitSkip
		frames = 30
	"どこ?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	おしろの 地下のへや かな、
	ボクたち けっこう おちてきたみたい
	・・・
	"""
	keyWait
	clearMsg
	"だいじょうぶ? うごける?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん・・・"
	waitSkip
		frames = 30
	"あイテっ!"
	waitSkip
		frames = 30
	"""
	
	ちょっと すりむいた みたいだけど・・・
	でも へいき!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	msgOpen
	"ピピピピピ!"
	wait
		frames = 60
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだろ?"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"みなさん・・・"
	waitSkip
		frames = 30
	"ごぶじですか?"
	keyWait
	clearMsg
	"""
	ほんぶからの れんらくに よりますと、
	こんかいの かいぎ、すでに
	「ゴスペル」に バレていたようです
	"""
	keyWait
	clearMsg
	"""
	そして 「ゴスペル」は ネットバトラーを
	おくりこみ、かいぎを ぼうがいしたのです
	"""
	keyWait
	clearMsg
	"""
	ざんねんながら 「きゅうきょくのナビ」の
	かいはつを そしするための データも
	ぬすまれて しまいました・・・
	"""
	keyWait
	clearMsg
	"""
	さらに 「ゴスペル」の ネットバトラーは
	おしろの 「しんにゅうしゃ げきたい
	システム」 にハッキングし、
	"""
	keyWait
	clearMsg
	"おしろの トラップを さどうさせました"
	keyWait
	clearMsg
	"""
	そうです、そいつは
	みなさんの イノチを ねらっているのです!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 127
	"ビュン!!!"
	wait
		frames = 10
	" "
	soundPlay
		track = 277
	"ドス!!"
	soundEnableTextSFX
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"グワーーーーーー!!!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 260
	"ツー "
	wait
		frames = 57
	soundPlay
		track = 260
	"ツー "
	wait
		frames = 57
	soundPlay
		track = 260
	"ツー"
	wait
		frames = 58
	keyWait
	clearMsg
	soundPlay
		track = 282
	"ピピ!"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 11
}
script 11 mmbn2 {
	soundPlayBGM
		track = 36
	mugshotShow
		mugshot = Raoul
	msgOpen
	"きいたか? みんな!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"うん! とんでもないことに なったね"
	keyWait
	clearMsg
	"いまの人も きっと・・・"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	とにかく こりつするのは きけんだ
	なにかあったら すぐ れんらくを
	とりあうように しよう! いいな?
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = PrincessPride
	msgOpen
	"""
	そうですね、そうすれば 「ゴスペル」の
	ネットバトラーの いばしょも
	はやく つきとめられる はずです
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	ったく、こんな うすぐらいところに
	いつまでも いるのは ゴメンだね!
	"""
	keyWait
	clearMsg
	"""
	とっとと だっしゅつして
	オレが そいつを 見つけ出してやる!
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Raoul
	msgOpen
	"""
	ニホンの しょうねんたちも
	それで いいな?
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"ええ・・・"
	keyWait
	clearMsg
	jump
		target = 18
}
