@archive 078C28C
@size 30

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	パパ! オレたち
	コトブキスクエアのこと しらべてきたよ!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Dad
	msgOpen
	"熱斗・・・"
	waitSkip
		frames = 30
	"\nやはり・・・"
	waitSkip
		frames = 20
	"おまえが きたか"
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
	どうしたの?
	せっかく しらべてきたのに?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ああ・・・"
	waitSkip
		frames = 20
	"ありがとう"
	keyWait
	clearMsg
	"""
	だが、できれば 熱斗には
	こんどの じけんに
	ふかく かかわってほしくないんだ
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
	"なんで?"
	keyWait
	clearMsg
	"""
	オレ、べつに今まで そんなアブナイ目に
	あったり してないのに・・・
	"""
	keyWait
	clearMsg
	"って・・・"
	waitSkip
		frames = 15
	"""
	そりゃ ちょっとは
	ヤバって おもったことは あったけど
	・・・
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ハハッ わかってる・・・"
	waitSkip
		frames = 30
	"\nただ・・・パパは かんじるんだ"
	keyWait
	clearMsg
	"""
	このじけんが ゴスペルとの さいごの、
	・・・そして もっとも きびしい
	たたかいに なるだろうってな
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"・・・どういうこと?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ヤツら なにか
	とんでもない キリフダを かくしている
	"""
	waitSkip
		frames = 30
	"\nそんな けはいが するんだ"
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
	キリフダって!?
	いったい なんなの!?
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
	それが わかれば
	たいさくの たてようも あるんだが・・・
	"""
	waitSkip
		frames = 30
	"\nもうすこし じかんを くれないか"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	・・・とにかく
	ニンムを はたしたのは おまえたちだ
	"""
	keyWait
	clearMsg
	"""
	今回の じけん、コトブキ町に
	おきている いへんに ついての
	くわしい せつめいを しないとな、
	"""
	keyWait
	clearMsg
	"""
	熱斗も ロックマンも よくきくんだ、
	いいな?
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	・・・パパたちの ちょうさで
	わかったんだが、
	"""
	keyWait
	clearMsg
	"""
	どうやら コトブキ町 いったいに
	大きぼな 電磁波(でんじは)いじょうが
	はっせい しているらしい
	"""
	keyWait
	clearMsg
	"""
	れいの コトブキスクエアの ひずみも
	この 電磁波いじょうが
	げんいんと かんがえられる
	"""
	keyWait
	clearMsg
	"""
	そして、それは ゴスペルの しわざ・・・
	ゴスペルの ほんとうの きょてんが
	コトブキ町に あるとみて まちがいない
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ゴスペルの きょてん・・・"
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
	それで、電磁波の いじょうって
	どのていどの ものなの?
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
	"""
	ああ、
	つうじょうの 1万ばい いじょうの
	電磁波が はっせいしているようだ
	"""
	keyWait
	clearMsg
	"""
	とうぜん 人体への あくえいきょうも
	かんがえられる・・・
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	そんなとこに 行って、ボクは ともかく
	熱斗くんは だいじょうぶなの?
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
	とうぜん、そんな たいりょうの
	電磁波を あびれば
	ただでは すまないだろう・・・
	"""
	keyWait
	clearMsg
	"""
	さいあく、せいしんが やられて
	死んでしまうことも ないとは いえない
	・・・
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
	"でも オレ行く! 行かなきゃ!"
	waitSkip
		frames = 30
	"\nパパ なんとか ならないの?"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	うん、パパたちも
	できるだけのことを したつもりだ
	"""
	keyWait
	clearMsg
	"・・・たいさくは 2つ、"
	keyWait
	clearMsg
	"""
	まず、コトブキ町には かいつう前の
	メトロライン コトブキせんを
	つかって 行くんだ
	"""
	keyWait
	clearMsg
	"""
	電磁波を カットする
	とくべつな しゃりょうも つくってある
	"""
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
	メトロラインから おりたあとは
	どうすれば・・・?
	"""
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	うん、そこで もうひとつが
	電磁波から みをまもる
	「ぼうじスーツ」だ
	"""
	keyWait
	clearMsg
	"""
	これを きていれば、つうじょうの
	5万ばいまでの 電磁波なら
	しゃだん できるはずだ
	"""
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そして、コトブキ町にある ゴスペルの
	きょてんを たたきつぶせば、ヤツらの
	イキのねを とめることが できるんだね!
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ああ、だが・・・"
	waitSkip
		frames = 30
	"""
	キケンな ニンムだ
	できれば やはり おまえには・・・
	"""
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	soundPlayBGM
		track = 16
	mugshotShow
		mugshot = Lan
	msgOpen
	"オレやるよ パパ!"
	keyWait
	clearMsg
	jump
		target = 24
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"熱斗!?"
	keyWait
	clearMsg
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	だって パパ、
	そんなキケンな ニンムなら ほかの人には
	よけいに たのめないでしょ?
	"""
	keyWait
	clearMsg
	"""
	それに
	オレが もし・・・
	"""
	waitSkip
		frames = 30
	"しんだと しても"
	keyWait
	clearMsg
	"""
	それが たいへんな じけんを かいけつ
	するため だったってこと、だれより
	パパが よくわかってくれるんだし、
	"""
	keyWait
	clearMsg
	"そして なにより"
	waitSkip
		frames = 30
	"\nオレには 兄さん、"
	waitSkip
		frames = 30
	"""
	ロックマンが
	ついていて くれるもの!
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"熱斗・・・"
	waitSkip
		frames = 30
	"""
	ママの いうとおりだ
	大きくなったな・・・
	"""
	keyWait
	clearMsg
	"""
	わかったよ・・・
	「コトブキパス」と 「ぼうじスーツ」
	この2つを 熱斗に わたそう
	"""
	keyWait
	clearMsg
	jump
		target = 27
}
script 27 mmbn2 {
	mugshotHide
	msgOpen
	playerAnimate
		animation = 24
	soundPlay
		track = 133
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 41
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	soundPlay
		track = 133
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 42
	"""
	」
	を ゲットして ふくの中に きこんだ!!
	"""
	playerFinish
	playerReset
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"じゃ オレ行くね!"
	keyWait
	clearMsg
	jump
		target = 29
}
