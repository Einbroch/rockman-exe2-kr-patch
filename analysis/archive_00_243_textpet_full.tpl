@archive 07827A4
@size 31

script 0 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"""
	ほう、ここまで
	たどりつくものがいたとは・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	そんな!? コイツは
	ブルースと たたかっているはず・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"フン・・・"
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
	じゃあ、ブルースとたたかっている
	シャドーマンは にせもの?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"いまごろ きづいても おそいわ"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	熱斗! できたぞ!
	シャドーマンたいさく バトルチップ
	"""
	keyWait
	clearMsg
	"「アルティメット ブラスター」だ"
	keyWait
	clearMsg
	"""
	このチップの いりょくなら
	シャドーマンを、たおすことが
	できるかもしれない・・・
	"""
	keyWait
	clearMsg
	"""
	ただし、うてるのは いっぱつだけだ
	かんぜんなものを つくる
	じかんがなかったんだ・
	"""
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	keyWait
	clearMsg
	"すまない、熱斗"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	いっぱつ うてればじゅうぶんさ!
	オレと、ロックマンを しんようしてよ!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 591
	"""
	「アルティメット ブラスター」
	スロットイン!
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、チャンスはいっかいだ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"・・・フン、そのぶきで せっしゃを?"
	keyWait
	clearMsg
	"""
	もし、はずれたら どうなるか
	わかっておろうな
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	! もし、はずしたら・・・
	マザーコンピュータを
	はかい してしまう・・・
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
	でも、いまは やるしかない!
	・・・けど
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"こわっぱが・・・"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"くそっ! どうすりゃいい!?"
	keyWait
	end
}
script 14 mmbn2 {
	mugshotHide
	msgOpen
	"ツン!"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"ムッ!?"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	はやく うて!
	ロックマン!!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ブ・ブルース・・・!"
	keyWait
	clearMsg
	"そんな・・・うてないよ!"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	おまえは、ニホンを
	アジーナこく のようにしたいのか!?
	"""
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"・・・・・・"
	keyWait
	clearMsg
	"""
	カゲムシャを たおしてきたのか・・・
	だが、むきずで たおすのは
	ムリだったようだな
	"""
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	がはっ!!
	ロックマン・・・!
	"""
	keyWait
	clearMsg
	"""
	はやくしろ オレのたいりょくは
	もう、もたん!
	"""
	keyWait
	clearMsg
	"""
	オレは バックアップデータが
	あるから、デリートされても
	しゅうふくは かのうだ・・・
	"""
	keyWait
	clearMsg
	"うつんだ! ロックマン!"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	すぐに バックアップデータを
	さいせい するからね!
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"・・・・・・"
	keyWait
	end
}
script 23 mmbn2 {
	mugshotHide
	msgOpen
	"シャッ"
	keyWait
	end
}
script 24 mmbn2 {
	mugshotHide
	msgOpen
	"ボギャーーーーーーーン!!"
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"""
	て、てしたの ヤツらが・・・
	タテに・・・なりやがっ・・・た
	"""
	keyWait
	clearMsg
	"ウグッ"
	keyWait
	clearMsg
	flagClear
		flag = 636
	jump
		target = 26
}
script 26 mmbn2 {
	soundPlayBGM
		track = 34
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	炎山くん!
	はやくブルースを
	プラグアウトさせて
	"""
	keyWait
	clearMsg
	jump
		target = 27
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"ブルース!"
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = ShadowMan
	msgOpen
	"おしかったな・・・"
	keyWait
	clearMsg
	jump
		target = 29
}
script 29 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"くっ!"
	keyWait
	clearMsg
	jump
		target = 30
}
