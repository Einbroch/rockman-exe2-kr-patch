@archive 0795740
@size 19

script 0 mmbn2 {
	mugshotHide
	msgOpen
	"""
	3つの しれんをのりこえしものよ
	よくぞココまで たどりついた
	"""
	keyWait
	clearMsg
	"さいごのトビラを いまこそひらかん"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"さいごのトビラが・・・ひらいた"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん・・・ナニもないよ?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じゃあ、さいごのトビラって
	なんのタメにあったんだ?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = PlanetMan
	msgOpen
	"""
	スベテハ アナタヲ タメスタメノ
	テスト ダッタノデス
	"""
	keyWait
	clearMsg
	flagSet
		flag = 318
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"テスト? ぼくを ためすための?"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = PlanetMan
	msgOpen
	"""
	ソウデス ソシテアナタハ
	コノ テストヲ ミゴトニ
	クリアシマシタ
	"""
	keyWait
	clearMsg
	"""
	アナタハ、「エラバレシモノ」
	ナノデス
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"「えらばれしもの」?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = PlanetMan
	msgOpen
	"""
	ソノトオリデス チカイ ショウライ、
	コノ ネットワークシャカイヲ
	シハイスル シュウダン
	"""
	keyWait
	clearMsg
	"""
	ワレラガ「WWW」ニ
	ハイルコトヲ ユルサレタノデス
	"""
	keyWait
	clearMsg
	"""
	アナタノ ジツリョクダト
	スグニ カンブクラス デスヨ
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"WWWだって!?"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = PlanetMan
	msgOpen
	"""
	ソウ ココハWWWフッコウノ
	キョテン ナノデス
	"""
	keyWait
	clearMsg
	"""
	ソシテWWWフッコウノ
	タイヤクヲ オオセツカッタノガ
	"""
	keyWait
	clearMsg
	"""
	オオイナル
	ダイチノ チカラヲ サズカッタ
	コノワタシ、プラネットマンナノデス
	"""
	keyWait
	clearMsg
	"WWWフッコウノ アカツキニハ"
	keyWait
	clearMsg
	"""
	ゲンザイノ ネットワークシャカイヲ
	カイメツサセ、セカイヲ シュチュウニ
	オサメルノデス!!
	"""
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
	なんだって!?
	そんなコト ボクがぜったい
	ゆるさないぞ!!
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = PlanetMan
	msgOpen
	"""
	オヤオヤ、
	アナタニハ、「ヤボウ」トイウモノハ
	ナイノデスカ?
	"""
	keyWait
	clearMsg
	"""
	アナタホドノ チカラヲ モチナガラ
	ナントモッタイナイ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"おまえたちの すきにはさせないぞ!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = PlanetMan
	msgOpen
	"""
	ザンネンデスネ
	ワレラノ オオイナルヤボウヲ
	ジャマスルモノハ、
	"""
	keyWait
	clearMsg
	"ソウソウニ シマツシナケレバ・・・"
	keyWait
	clearMsg
	"""
	タイヘン モッタイナイデスガ、
	アラタナルWWWノ
	ヒトバシラニ ナッテモライマショウ
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、ぜったい まけねえぞ!"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"もちろんさ!!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"いくぜ! ロックマン!"
	waitSkip
		frames = 30
	"\nバトルオペレーション セット!"
	waitSkip
		frames = 30
	keyWait
	jump
		target = 18
}
