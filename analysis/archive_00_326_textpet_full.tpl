@archive 078DAF8
@size 21

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだ これ・・・"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"サーバーが こんなに いっぱい・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"""
	ようこそ! わがゴスペルの
	メインサーバールームへ!
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
	"!!!!!!"
	keyWait
	end
}
script 4 mmbn2 {
	soundPlayBGM
		track = 1
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"よくきたな"
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
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ヘヘッ やっと あえたな・・・"
	waitSkip
		frames = 30
	"\nおまえが ゴスペルの ボスだなっ!?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"フッ・・・"
	waitSkip
		frames = 30
	"そうだ 光熱斗・・・"
	waitSkip
		frames = 30
	"""
	
	ネットマフィア 「ゴスペル」は
	オレのもの・・・
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
	って、
	なんで オレのこと しってんだよ!?
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"""
	ゴスペルの ネットワークを つかえば
	オレに わからぬことなど ない
	"""
	keyWait
	clearMsg
	"""
	このモニターさえ 見ていれば
	世界の すべての じょうほうが
	手に 入るのだ
	"""
	keyWait
	clearMsg
	"そして・・・"
	waitSkip
		frames = 30
	"""
	
	オレは ここから いつでも 世界中に
	メイレイを くだすことができる
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そのせいで・・・おまえの せいで
	おおくの人が じけんに まきこまれて
	くるしんで いるんだ!!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"そうらしいが よくは しらんな・・・"
	keyWait
	clearMsg
	"""
	オレは ここで メイレイしているだけで
	じぶんの手を よごすわけでは ないのでな
	・・・
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	くるしんでいる人と
	いちどでも はなしたこと あるのかよ!?
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"そんなことをして なんになる?"
	keyWait
	clearMsg
	"""
	ひとびとは みな じぶんを かくし
	かざっていて、ほんとうの じぶんを
	さらけだそうと しない
	"""
	keyWait
	clearMsg
	"""
	ここで 手に入る じょうほうだけで
	オレには じゅうぶんだ
	"""
	keyWait
	clearMsg
	"""
	そう・・・げんじつなんて
	大した カチのある モノではない!
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
	ちがう!
	そんなの まちがってる!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"だったら どうだと いうのだ?"
	keyWait
	clearMsg
	"""
	オレは 「きゅうきょくのナビ」を
	もう 手に入れた・・・
	"""
	waitSkip
		frames = 30
	"\nオレは 世界のしはいしゃと なるのだ!"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"""
	どうだ 光熱斗? オレと くむ気・・・
	ゴスペルに 入る気は ないか?
	"""
	keyWait
	clearMsg
	"""
	オレの 「きゅうきょくのナビ」と
	おまえの ロックマン、2体が くめば
	世界を じゆうに できるぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	soundStop
	mugshotShow
		mugshot = Lan
	msgOpen
	"そんな さそい・・・"
	waitSkip
		frames = 30
	"くそっくらえだ!!"
	keyWait
	clearMsg
	soundPlayBGM
		track = 16
	"オレは・・・"
	waitSkip
		frames = 30
	"""
	
	おまえの やぼうを たたきつぶすために
	ここへ きた!!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"""
	「きゅうきょくのナビ」と
	たたかうと いうのか・・・
	"""
	keyWait
	clearMsg
	"""
	ざんねんだ 光熱斗・・・
	おまえも おろかなモノどもと おなじか
	・・・
	"""
	keyWait
	clearMsg
	"""
	わがゴスペルの
	りそうが りかいできない とはな
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ほんとうに おろかなのは そっちだ!"
	keyWait
	clearMsg
	"ロックマン!"
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
	うん! 「きゅうきょくのナビ」 だろうと
	なんだろうと 世界を ふこうにする
	ナビになんか まけるわけには いかない!
	"""
	keyWait
	clearMsg
	"熱斗くん! プラグイン おねがい!"
	keyWait
	clearMsg
	jump
		target = 20
}
