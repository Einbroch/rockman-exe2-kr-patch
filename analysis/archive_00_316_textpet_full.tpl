@archive 078CCD0
@size 34

script 0 mmbn2 {
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
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ちぇ! うごかねえ!"
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
	かなりの 電磁波いじょうを
	おこしてる みたいだね
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"この! うごけ!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ムリだよ そんなの・・・"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotHide
	msgOpen
	soundPlay
		track = 193
	"チン!"
	keyWait
	clearMsg
	flagSet
		flag = 526
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うごいたじゃん! ほら!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	soundPlayBGM
		track = 14
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、よろこんでる ばあいじゃない!
	だれか 出てきた!
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
	"""
	ゴスペルの ヤツらか!?
	いったん かくれよう!
	"""
	keyWait
	end
}
script 9 mmbn2 {
	mugshotHide
	msgOpen
	"おい! まちやがれ!"
	wait
		frames = 10
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"またねえよ!"
	wait
		frames = 10
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"って、その こえ!"
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	オレたちを おいていくなんて
	ミズくさいぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	soundPlayBGM
		track = 16
	mugshotShow
		mugshot = Lan
	msgOpen
	"デカオ!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"アタシたちも わすれないでよね!"
	keyWait
	flagSet
		flag = 527
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	みんな! って、
	こんなとこ きちゃ ダメじゃないか!
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	あたしたち だって
	しみんネットバトラー だもん!
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
	"""
	なに いってんだよ バカ!
	電磁波に やられちゃうだろ!
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	なんですぐ バカって いうのよ!!
	炎山くんとは 大ちがい!
	"""
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なんだよ!!
	ヒトが しんぱい してやってんのに!
	"""
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	も!
	はなしが すすまない みたいだから
	アタシから かいせつ するわ
	"""
	keyWait
	clearMsg
	"""
	アタシたちは みんな
	アメロッパ うちゅうグン とくせいの
	「ぼうじウェア」を きてるって わけ
	"""
	keyWait
	clearMsg
	"""
	パパが アメロッパの プレジデントと
	しりあいで とくべつに
	わけてもらったのよ
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
	"マジで! スゲー!"
	waitSkip
		frames = 30
	"\nで、上は どうだった?"
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	それが・・・このマンション ぜんたいが
	きょだいな ひとつの サーバーに
	なってるようだぜ
	"""
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	わたしたちが 行けたのは 2かいだけ
	だったんだけど、へやの中に サーバーが
	はえてきてる っていうか・・・
	"""
	keyWait
	clearMsg
	jump
		target = 24
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	はえてきてる?
	サーバーって きかいじゃんか?
	"""
	keyWait
	clearMsg
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	でも、たしかに あれは
	はえてるって かんじだったわね
	"""
	keyWait
	clearMsg
	"""
	・・・とにかく
	ネットワークの 電磁波いじょうを
	とりのぞくのよ
	"""
	keyWait
	clearMsg
	"""
	そうすれば さいじょうかいへの みちは
	ひらかれるはず・・・
	"""
	keyWait
	clearMsg
	jump
		target = 26
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	熱斗・・・
	オレたちに できるのは ここまでだ
	あとは・・・
	"""
	waitSkip
		frames = 30
	"グフ!"
	keyWait
	flagSet
		flag = 525
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"デカオ!? どうしたんだ!?"
	keyWait
	clearMsg
	jump
		target = 28
}
script 28 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	デカオくん、なんども プラグインして
	ウイルスバスティング してたから
	いちばんたくさん 電磁波を あびてるの
	"""
	keyWait
	clearMsg
	jump
		target = 29
}
script 29 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	こいつったら これくらい やっとかないと
	熱斗に カオむけが できないって
	・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"グズ・・・"
	keyWait
	clearMsg
	jump
		target = 30
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	デカオ・・・
	それに、メイルも やいとも ありがとう!
	"""
	keyWait
	clearMsg
	"""
	オレやる! 3人とも
	ここは オレに まかせて
	はやく あんぜんな ばしょへ!
	"""
	keyWait
	clearMsg
	jump
		target = 31
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"うん!"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン 行くぜ!!"
	keyWait
	clearMsg
	jump
		target = 33
}
