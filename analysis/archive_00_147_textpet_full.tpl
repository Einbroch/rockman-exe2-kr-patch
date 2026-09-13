@archive 0776040
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	textSpeed
		delay = 4
	"""
	ココハー
	アメロッパスクエアノ
	イーリーグーチ デース!
	"""
	keyWait
	clearMsg
	"""
	アメロッパノー プーログラムハー
	ミナー コンナー シャベリカタ シマース
	"""
	textSpeed
		delay = 2
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	textSpeed
		delay = 1
	"ナワケナイ"
	waitSkip
		frames = 30
	"デス"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	アメロッパエリア3は
	ウラインターネットに ツナがっているの
	"""
	keyWait
	clearMsg
	"""
	アタシみたいな
	キューティーな オンナのコ ナビは
	イかないホウが いいわね
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"このサキが アメロッパスクエアです"
	keyWait
	clearMsg
	"""
	ちなみに ミギの ワープから
	アメロッパエリア3に イけます
	ウエの ワープは・
	"""
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"・"
	waitSkip
		frames = 15
	"シりません"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ボスたちと オナじように
	オレたちも ダンケツ してるのさ
	"""
	keyWait
	clearMsg
	"アメロッパ! "
	waitSkip
		frames = 15
	"アメロッパ!"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"アメロッパ! "
	waitSkip
		frames = 15
	"アメロッパ!"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ロッパ! "
	waitSkip
		frames = 15
	"ロッパ!"
	keyWait
	end
}
script 190 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	なんだこのヤロウ!?
	オレにケンカを ウるたあ
	いいドキョウだ!!
	"""
	keyWait
	clearMsg
	"""
	ちょっと、アソんでやるか!
	やっちまえ! ウイルスども!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 252
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 50
		field = 0
		music = 27
}
script 191 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ナンや ナンや?
	ワシのカオになんぞ ツいとんのか?
	"""
	keyWait
	clearMsg
	"""
	ガンたれとったら イてまうぞ!
	くおらぁ!
	"""
	keyWait
	clearMsg
	"まだ、ガンたれとんのか?"
	keyWait
	clearMsg
	"""
	おまえら この あんちゃん
	いてこましたれ!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 253
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 51
		field = 0
		music = 27
}
script 192 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"なんだい? キミは"
	keyWait
	clearMsg
	"ボクを こらしめにきた?"
	keyWait
	clearMsg
	"ハハハ おもしろい ジョークだ"
	keyWait
	clearMsg
	"ジョークじゃない?"
	keyWait
	clearMsg
	"コドモはハヤく おウチにカエりな"
	keyWait
	clearMsg
	"カエらない?"
	keyWait
	clearMsg
	"""
	オイ ボウズ!!
	シタテに デてりゃあ いいキに
	なりやがってよう!!
	"""
	keyWait
	clearMsg
	"""
	こうなったら・・・
	ドトウの ウイルスコウゲキをクらえ!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 254
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 52
		field = 0
		music = 27
}
script 193 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ブ、ブシュゥゥ・・・
	ナ、ナンだ? おマエ? ・・・
	"""
	keyWait
	clearMsg
	"""
	・・・オレに、はむかうヤツ・・・
	ミンナ・・・デリートする・・・
	"""
	keyWait
	clearMsg
	"バハーーーーーーーー!!"
	keyWait
	clearMsg
	flagSet
		flag = 317
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 53
		field = 0
		music = 27
}
