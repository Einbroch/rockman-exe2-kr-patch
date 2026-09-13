@archive 07907D4
@size 103

script 0 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"お~い 熱斗! いつまで かかってんだ!"
	waitSkip
		frames = 30
	"\nはやく しろ~~!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん いそがなきゃ!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん"
	keyWait
	clearMsg
	"・・・わりぃわりぃ! 今 行くって!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"おぅ マキ もってきてくれたか!"
	keyWait
	clearMsg
	"""
	でも・・・おせえぞ!
	デカオさまの メイレイは もっと
	サクサク やるもんだぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだよ! せっかく もってきたのに!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"・・・ま、"
	waitSkip
		frames = 30
	"""
	とは いっても
	こうして キャンプの やりなおしが
	できるのも 熱斗の おかげだしなっ
	"""
	keyWait
	clearMsg
	"ありがとよ! 熱斗!!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"んだよ きゅうに・・・"
	waitSkip
		frames = 30
	"""
	
	だからアレは みんなに たすけて
	もらったから できたって いってんじゃん
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"熱斗~、おまえって ヤツは~~~~"
	waitSkip
		frames = 30
	"\nオ~~イ オイオイオイオイオ~~~イ"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"オイオイ またかよ・・・"
	waitSkip
		frames = 30
	"まいったな~"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"ちょっと 光くん、こっちは まだよ!"
	waitSkip
		frames = 30
	"""
	
	さんもんシバイに つきあってないで
	はやく してよね!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"OK! ちょっと まってな!"
	keyWait
	end
}
script 11 mmbn2 {
	mugshotHide
	msgOpen
	"ピシュシュシュシュシュ!"
	wait
		frames = 60
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"""
	ほえ~ 大したもんでマスな!
	みるみるうちに
	サカナを つかまえていくでマス!!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	playerAnimate
		animation = 5
	flagClear
		flag = 590
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	やりかたなら おしえてあげるよ
	日暮さんも やってみる?
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"そうでマスな~"
	waitSkip
		frames = 30
	"\n・・・いっちょ やってみるでマスか!"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotHide
	msgOpen
	"ピシュシュシュシュシュ!"
	wait
		frames = 60
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"って、"
	waitSkip
		frames = 30
	"アラ、"
	waitSkip
		frames = 30
	"アレ?"
	waitSkip
		frames = 30
	"\nアヤヤヤヤヤヤヤヤーーーーーーーー!!!"
	keyWait
	end
}
script 17 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 248
	"ドボン!"
	soundEnableTextSFX
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ハハハハハ! "
	waitSkip
		frames = 30
	"""
	・・・って いけねぇ!
	はやく やいとのとこ 行かなきゃ!
	日暮さん またあとでね!
	"""
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"でマスー・・・"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"もぅ! どこまで 行ってたんだか・・・"
	waitSkip
		frames = 30
	"""
	
	ま でも たいりょう みたいだから
	ゆるして あげるわよ
	"""
	keyWait
	clearMsg
	"""
	で どう? せっかくだから
	この やいとちゃんの おりょうりテクを
	見ていきなさいよ!
	"""
	keyWait
	clearMsg
	"こう見えて けっこう かていてきなのよ"
	waitSkip
		frames = 30
	"\nあ・"
	waitSkip
		frames = 30
	"た・"
	waitSkip
		frames = 30
	"し"
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"あ! 熱斗!"
	waitSkip
		frames = 30
	"""
	 アタシ また
	ほうちょう わすれてきちゃったみたい!
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"え~! マジかよ!"
	keyWait
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	・・・おまえ ちっちゃいんだから
	気をつけて サカナ やくんだぞ!
	"""
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	も!
	こどもあつかい するんじゃないわよーー!
	あんたなんか・・・
	"""
	waitSkip
		frames = 30
	"ベーーーー! だ!!"
	wait
		frames = 60
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"どしたの? 熱斗?"
	waitSkip
		frames = 30
	"\nあ、"
	waitSkip
		frames = 10
	"ほうちょうね、"
	waitSkip
		frames = 10
	"ハイハイ"
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	・・・それにしても
	パパと いっしょに キャンプなんて
	ほんっっとに ひさしぶりねぇ~
	"""
	keyWait
	clearMsg
	jump
		target = 27
}
script 27 mmbn2 {
	flagSet
		flag = 570
	mugshotShow
		mugshot = Dad
	msgOpen
	"ハハハ、ずっと いそがしかったからなー"
	waitSkip
		frames = 30
	"\nすまなかったね ママ"
	keyWait
	clearMsg
	jump
		target = 28
}
script 28 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"ううん いいの"
	keyWait
	clearMsg
	"""
	だって、ゆういちろうさん
	たいへんな おしごとしてるの
	わたし ちゃんと わかってるもの
	"""
	keyWait
	clearMsg
	jump
		target = 29
}
script 29 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ありがとう・・・"
	waitSkip
		frames = 30
	"はるか"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"パーパー!"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	あ ゴメンゴメン、もちろん 熱斗もな
	しばらくは すこし ヒマだから
	いっしょに あそぼうな!
	"""
	keyWait
	clearMsg
	jump
		target = 32
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やったー!!"
	keyWait
	clearMsg
	jump
		target = 33
}
script 33 mmbn2 {
	flagClear
		flag = 526
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗~! まーだー?"
	keyWait
	clearMsg
	jump
		target = 34
}
script 34 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	ほらほら はやく 行ってあげなきゃ
	女のコを ほっておいちゃ ダメよ
	"""
	keyWait
	clearMsg
	jump
		target = 35
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
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
script 36 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	あ 今の ゆういちろうさんへの
	ひにく じゃないからね
	"""
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ほんとかい?"
	keyWait
	clearMsg
	jump
		target = 38
}
script 38 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"ほ・"
	waitSkip
		frames = 30
	"ん・"
	waitSkip
		frames = 30
	"と・"
	keyWait
	clearMsg
	jump
		target = 39
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ママ・・・"
	keyWait
	clearMsg
	jump
		target = 40
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"パパ・・・"
	keyWait
	flagSet
		flag = 572
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ヤレヤレ・・・"
	keyWait
	clearMsg
	jump
		target = 42
}
script 42 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"こっちが はずかしくなっちゃうね・・・"
	keyWait
	clearMsg
	jump
		target = 43
}
script 43 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"行こうぜ!"
	keyWait
	end
}
script 44 mmbn2 {
	flagClear
		flag = 572
	mugshotShow
		mugshot = Chaud
	msgOpen
	"フッ・・・おそかったな"
	keyWait
	clearMsg
	jump
		target = 45
}
script 45 mmbn2 {
	playerAnimate
		animation = 5
	mugshotShow
		mugshot = Lan
	msgOpen
	"???"
	keyWait
	clearMsg
	jump
		target = 46
}
script 46 mmbn2 {
	playerAnimate
		animation = 3
	flagClear
		flag = 526
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	あ、熱斗
	ほうちょうなら 炎山くんに
	もう もらっちゃった
	"""
	keyWait
	clearMsg
	"ありがと 炎山くん"
	keyWait
	clearMsg
	jump
		target = 47
}
script 47 mmbn2 {
	flagSet
		flag = 572
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	いいのさ・・・
	キミの たのみ だからな
	"""
	keyWait
	clearMsg
	jump
		target = 48
}
script 48 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なんだよ メイル!
	どういう つもりなんだよ!!
	"""
	keyWait
	clearMsg
	jump
		target = 49
}
script 49 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	熱斗が おそいからでしょ!
	炎山くんは 熱斗と ちがって
	しんせつなの!
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	・・・でも 熱斗が もってきてくれた
	ほうちょうも だいじだし・・・
	"""
	waitSkip
		frames = 30
	"\nどっちから つかおっかな・・・"
	keyWait
	clearMsg
	jump
		target = 51
}
script 51 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんなんだよ・・・ったく"
	keyWait
	clearMsg
	jump
		target = 52
}
script 52 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"オンナゴコロは ふくざつ なんだよ・・・"
	keyWait
	clearMsg
	jump
		target = 53
}
script 53 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そんなの わかんねえよ"
	keyWait
	clearMsg
	jump
		target = 54
}
script 54 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	ほーら、熱斗も 炎山くんも
	りょうりの ジャマだよ
	できるまで あっちに いっててっ
	"""
	keyWait
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"・・・"
	keyWait
	clearMsg
	jump
		target = 56
}
script 56 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・・・"
	keyWait
	clearMsg
	jump
		target = 57
}
script 57 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"炎山っ"
	keyWait
	clearMsg
	jump
		target = 58
}
script 58 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・・・なんだ?"
	keyWait
	clearMsg
	jump
		target = 59
}
script 59 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"こんなこと いうの しゃくだけど・・・"
	keyWait
	clearMsg
	"""
	こんかいも おまえには
	イロイロと たすけられちまったな・・・
	"""
	waitSkip
		frames = 30
	"\nありがとよ"
	keyWait
	clearMsg
	jump
		target = 60
}
script 60 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"フン・・・"
	waitSkip
		frames = 30
	"\nオレは おまえなど みとめていない・・・"
	waitSkip
		frames = 30
	"\nと いいたい ところだが、"
	keyWait
	clearMsg
	"""
	どうやら おまえを ライバルと
	みとめないわけには いかないようだ
	"""
	waitSkip
		frames = 30
	"\n・・・いろんな イミでな"
	keyWait
	clearMsg
	jump
		target = 61
}
script 61 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"よく わかんねえけど・・・"
	waitSkip
		frames = 30
	"\nヘヘッ "
	waitSkip
		frames = 30
	"「ライバル」 "
	waitSkip
		frames = 30
	"か!"
	keyWait
	clearMsg
	"""
	いいぜ! オレは おまえには まけない!
	ロックマンも、な!
	"""
	keyWait
	clearMsg
	jump
		target = 62
}
script 62 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん!
	ボクだって ブルースには まけないよ!
	"""
	keyWait
	clearMsg
	jump
		target = 63
}
script 63 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"・・・オレは ただ・・・"
	waitSkip
		frames = 30
	"""
	
	炎山さまの メイレイに したがうだけ
	・・・
	"""
	keyWait
	clearMsg
	jump
		target = 64
}
script 64 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"""
	さあ、もう 行け
	たにんと ベタベタ するのは
	オレの ポリシーに はんする
	"""
	keyWait
	clearMsg
	jump
		target = 65
}
script 65 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちぇ、わかったよ・・・"
	waitSkip
		frames = 30
	"\nでも・・・そのまえに、"
	keyWait
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
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
script 67 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ヘヘッ・・・"
	waitSkip
		frames = 30
	"じゃな!"
	keyWait
	end
}
script 68 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あれ? どしたの パパひとりで?"
	keyWait
	clearMsg
	jump
		target = 69
}
script 69 mmbn2 {
	flagSet
		flag = 570
	mugshotShow
		mugshot = Dad
	msgOpen
	"ああ・・・"
	keyWait
	clearMsg
	jump
		target = 70
}
script 70 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ひょっとして また しごとのこと?"
	keyWait
	clearMsg
	jump
		target = 71
}
script 71 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ああ・・・"
	waitSkip
		frames = 30
	"""
	まあ
	れいの カレのこと なんだがな
	"""
	keyWait
	clearMsg
	jump
		target = 72
}
script 72 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なに?"
	keyWait
	clearMsg
	jump
		target = 73
}
script 73 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	じつは こんかいの じけん、
	どうやら ウラで 手をひいているモノの
	そんざいが ありそうなんだ
	"""
	keyWait
	clearMsg
	jump
		target = 74
}
script 74 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"どういうこと パパ?"
	keyWait
	clearMsg
	jump
		target = 75
}
script 75 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	うん、
	だれかが カレを あやつっていた
	かのうせいが あるようなんだ
	"""
	keyWait
	clearMsg
	"""
	カレが ネットに アクセスするたび、
	ネットをつうじて だれかが カレの
	むいしきに はたらきかけていた・・・
	"""
	keyWait
	clearMsg
	"""
	ゴスペルを けっせい したのも
	フォルテプロジェクトを はじめたのも、
	"""
	keyWait
	clearMsg
	"""
	カレは じぶんのイシで やったつもり
	だったろうが、じつは だれかの
	さしがねだった かのうせいが たかいんだ
	"""
	keyWait
	clearMsg
	jump
		target = 76
}
script 76 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そうなんだ・・・"
	keyWait
	clearMsg
	jump
		target = 77
}
script 77 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	へいわは もどった・・・
	でも パパたちの しごとは
	まだ おわりそうも ないな
	"""
	keyWait
	clearMsg
	jump
		target = 78
}
script 78 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そっか・・・"
	waitSkip
		frames = 30
	"""
	じゃ、
	いつの日か またじけんが おきたら
	オレたち やらなきゃな!
	"""
	keyWait
	clearMsg
	jump
		target = 79
}
script 79 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	keyWait
	clearMsg
	"""
	・・・でも カレだけが
	わるいんじゃないって わかったら
	ちょっとだけ すくわれた気が するね
	"""
	keyWait
	clearMsg
	jump
		target = 80
}
script 80 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ・・・"
	waitSkip
		frames = 30
	"だな"
	keyWait
	clearMsg
	jump
		target = 81
}
script 81 mmbn2 {
	mugshotHide
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
		target = 82
}
script 82 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"そろそろ じゅんびが できたわよ~~~!"
	waitSkip
		frames = 30
	"\nパパ~~~?"
	keyWait
	clearMsg
	jump
		target = 83
}
script 83 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	熱斗~~~~?
	どこ 行っちゃったの~~~?
	"""
	keyWait
	clearMsg
	jump
		target = 84
}
script 84 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	おっと、みんなを またしちゃ
	また おこられちゃうな!
	"""
	keyWait
	clearMsg
	jump
		target = 85
}
script 85 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"だね! 行こうっ!"
	keyWait
	end
}
script 86 mmbn2 {
	mugshotHide
	msgOpen
	"カンパーーーーイ!!"
	keyWait
	clearMsg
	jump
		target = 87
}
script 87 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"さ! くうぞーーー!"
	keyWait
	clearMsg
	jump
		target = 88
}
script 88 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"でも よかったね・・・"
	waitSkip
		frames = 30
	"""
	
	今日は キャンプを こころゆくまで
	たのしめそうだね! 
	"""
	waitSkip
		frames = 30
	"ね?"
	keyWait
	clearMsg
	jump
		target = 89
}
script 89 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ガツガツ むしゃむしゃ・・・"
	keyWait
	clearMsg
	jump
		target = 90
}
script 90 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"って 熱斗く~ん!"
	keyWait
	clearMsg
	jump
		target = 91
}
script 91 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"ごめんなさーい!"
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = MsMari
	msgOpen
	"""
	ハァ ハァ・・・
	おそくなっちゃいました~
	"""
	keyWait
	clearMsg
	"""
	あしたからの しんがっきの じゅんびに
	おもったより じかん かかっちゃって
	・・・
	"""
	keyWait
	clearMsg
	"""
	みんな! もう
	ちゃんと しゅくだい やったかな~~~?
	"""
	keyWait
	clearMsg
	jump
		target = 93
}
script 93 mmbn2 {
	soundStop
	mugshotShow
		mugshot = Lan
	msgOpen
	"あっ!!!!!!"
	keyWait
	clearMsg
	jump
		target = 94
}
script 94 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"あっ!!!!!!"
	keyWait
	end
}
script 95 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、オレたち しゅくだい・・・"
	keyWait
	clearMsg
	jump
		target = 96
}
script 96 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん、イロイロ あったから
	ボクも すっかり・・・
	"""
	keyWait
	clearMsg
	jump
		target = 97
}
script 97 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗 まさか・・・"
	keyWait
	end
}
script 98 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ああっっっっっっっ!!!
	たいへんだ! コンロから 火がでてる!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 585
	jump
		target = 99
}
script 99 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"え タイヘン!!!"
	waitSkip
		frames = 30
	"\n"
	soundStop
	"""
	・・・って コンロから 火が出るの
	あたりまえでしょ!
	"""
	keyWait
	clearMsg
	"こら! 熱斗!"
	waitSkip
		frames = 30
	"\nしゅくだい やってないな!"
	keyWait
	clearMsg
	jump
		target = 100
}
script 100 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"わりぃ、今 それどこじゃ ないって!!"
	waitSkip
		frames = 30
	"\nロックマン!?"
	keyWait
	clearMsg
	jump
		target = 101
}
script 101 mmbn2 {
	playerAnimate
		animation = 4
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"OK! 熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 102
}
