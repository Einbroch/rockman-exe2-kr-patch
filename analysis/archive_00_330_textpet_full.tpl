@archive 078EE2C
@size 42

script 0 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"ちぇっ!!"
	waitSkip
		frames = 30
	"""
	
	「バグゆうごう」が まだ
	かんぜんじゃ なかったか・・・
	"""
	keyWait
	clearMsg
	"""
	やっぱり サーバーパワーを
	もっと あげなきゃ ダメだなっ!
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
	"・・・おまえ!?"
	waitSkip
		frames = 30
	" なんだ!?"
	waitSkip
		frames = 30
	"\nほんとは こども だったのか!?"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"""
	ボ、ボクの
	サイバースーツが きえてる!?
	"""
	wait
		frames = 60
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おい! "
	waitSkip
		frames = 30
	"""
	「きゅうきょくのナビ」だか
	なんだか しらないけど
	もう デリート しちゃったぞ!
	"""
	keyWait
	clearMsg
	"こんなこと もうやめろ!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"なんだよ きゅうに えらそーになって!"
	waitSkip
		frames = 30
	"""
	
	やっぱり おまえも
	ボクのこと バカに するんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なに いってんだ?
	だれも そんなこと・・・
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"""
	うるさい!
	なに いったって ダマされないぞ!
	"""
	keyWait
	clearMsg
	"""
	とにかく 今のは
	サーバーパワーが たりなかっただけさ!!
	"""
	waitSkip
		frames = 30
	"\nみてろよーー!!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"サーバーパワー 100%!!"
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"グ!!!!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"イタ! "
	waitSkip
		frames = 30
	"なんか ピリッと きたわよ!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"アテテテ!! こっちもだぜ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	電磁波 5万ばい こえてきたっ!
	キケンすぎる!!
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
	"""
	おい! やめるんだ!!
	これいじょう サーバーパワーを
	あげちゃ ダメだ!
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"""
	うるさい!
	ボクに メイレイするな!!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	メイレイじゃない!
	おまえだって あぶないんだぞ!
	わかんないのかよ!?
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"ウル・・"
	waitSkip
		frames = 30
	"サイッ!!!!"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なんで・・・
	なんで わかんないんだよ!
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"みんな! 炎山!"
	waitSkip
		frames = 30
	"""
	
	ぼうじスーツ ナシじゃ ヤバすぎる!
	もう そとに出るんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・・・"
	waitSkip
		frames = 30
	"やむを えんな・・・"
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"そんなの ダメ!"
	keyWait
	clearMsg
	"熱斗だって あぶないんでしょ!"
	waitSkip
		frames = 30
	"""
	
	だったら わたしも
	熱斗と いっしょに たたかう!!
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"バカ! "
	waitSkip
		frames = 30
	"ムチャいうなって!!"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"だって! "
	waitSkip
		frames = 30
	"""
	熱斗のこと
	おいてなんて 行けないよ!
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"メイル、熱斗の いうとおりだ"
	waitSkip
		frames = 30
	"\n今は 熱斗を しんじようぜ!"
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗を しんじる・・・"
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
	オレなら だいじょうぶ!!
	スグに みんなを おいかけるから!
	"""
	keyWait
	clearMsg
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"ホント?"
	waitSkip
		frames = 30
	"\nヤクソクする?"
	keyWait
	clearMsg
	jump
		target = 26
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ、ヤクソクする!!"
	keyWait
	clearMsg
	jump
		target = 27
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"・・・わかった"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	"でも・・・熱斗!"
	waitSkip
		frames = 30
	"\nわたしの キモチは・・・"
	waitSkip
		frames = 30
	"\n熱斗の中に おいていくんだからね・・・"
	keyWait
	clearMsg
	"グス・・・"
	keyWait
	clearMsg
	jump
		target = 28
}
script 28 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん! ちゃんと もらった!"
	waitSkip
		frames = 30
	"\nぜったい ちゃんと もってかえる!"
	keyWait
	clearMsg
	jump
		target = 29
}
script 29 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"あんたたち・・・"
	waitSkip
		frames = 30
	"グズ"
	keyWait
	clearMsg
	jump
		target = 30
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"じゃ、みんな 行くぞ!!"
	keyWait
	end
}
script 31 mmbn2 {
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
	waitSkip
		frames = 30
	"フッ"
	waitSkip
		frames = 30
	"\nこれで やらなきゃ オトコじゃないな"
	waitSkip
		frames = 30
	"\n・・・あとは "
	waitSkip
		frames = 30
	"まかせたぜ・・・"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"いくぞーーーーーー!!"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"サーバーパワー "
	waitSkip
		frames = 30
	"120%!!"
	waitSkip
		frames = 30
	"\nまだ・・・"
	waitSkip
		frames = 30
	"まだだ!"
	keyWait
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なんで そこまでして 世界を
	しはいしなきゃ ならないんだよっ!?
	"""
	keyWait
	clearMsg
	jump
		target = 35
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"ぜんぶが にくいからだよ!"
	waitSkip
		frames = 30
	"""
	
	それに もう・・・
	ボクは キズつきたくないんだ!!
	"""
	keyWait
	clearMsg
	"・・・"
	waitSkip
		frames = 30
	"サーバーパワー 150%!"
	keyWait
	clearMsg
	jump
		target = 36
}
script 36 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なに いってるん・・・ガッ!!"
	keyWait
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"な・・"
	waitSkip
		frames = 30
	"なんだ こ・・・"
	waitSkip
		frames = 30
	"れ!?"
	keyWait
	clearMsg
	jump
		target = 38
}
script 38 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! "
	waitSkip
		frames = 30
	"""
	電磁波 10万ばいだ!!
	ぼうじスーツも もう もたない!!
	"""
	waitSkip
		frames = 30
	keyWait
	clearMsg
	jump
		target = 39
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"こ・"
	waitSkip
		frames = 30
	"の・・"
	waitSkip
		frames = 30
	"ヤロ・・・"
	waitSkip
		frames = 30
	"\n足が・・"
	waitSkip
		frames = 30
	"うごかねえ・・・"
	keyWait
	clearMsg
	jump
		target = 40
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"サーバー・・"
	waitSkip
		frames = 30
	"パワー・・・"
	waitSkip
		frames = 30
	"200%だ!!!"
	keyWait
	end
}
