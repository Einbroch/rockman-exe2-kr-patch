@archive 077DB50
@size 11

script 0 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	よし、そろそろ
	バーベキューの ジュンビ
	できた みたいだな!
	"""
	keyWait
	clearMsg
	"んじゃ くおうぜ!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Mayl
	msgOpen
	"アレ・・・そういえば 炎山くんは?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	しらね~
	いいじゃん、あんなヤツ ほっておいて
	ゴハンに しようぜ!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Mayl
	msgOpen
	"そうは いかないでしょ!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	だったらメイル
	おまえ あいつが どこ 行ったか
	こころあたりでも あるのかよ?
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Mayl
	msgOpen
	"んーー・"
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
		mugshot = Yai
	msgOpen
	"""
	まぁ しょうがないわね
	カレも そのうち かえってくるって
	"""
	waitSkip
		frames = 30
	"\nね?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ウン"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Dex
	msgOpen
	"よし じゃあ カンパーーーーイ!!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"かんぱーーーーい!!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Yai
	msgOpen
	"カンパーーーイ!!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"ガツガツ モリモリ ガツガツ モリモリ!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	パクパク ムシャムシャ
	パクパク ムシャムシャ!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Yai
	msgOpen
	"・・・でさ~~、という わけなのよ~~"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Mayl
	msgOpen
	"まさかぁー? フフフフッ"
	keyWait
	clearMsg
	"?"
	keyWait
	end
}
script 3 mmbn2 {
	soundPlayBGM
		track = 14
	mugshotShow
		mugshot = Dex
	msgOpen
	"ウォッ!?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Yai
	msgOpen
	"なにサ なにサ!?"
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	メイル? メールニュース そくほう
	とどいてないか?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	ダメッ! ここ
	デンパの とどかない ちいきみたい!
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
	"""
	熱斗くん さっきの バクハツ
	ほうがくからして ダム じゃないかな!?
	"""
	keyWait
	clearMsg
	"もし ダムが こわれでもしたら・・・"
	waitSkip
		frames = 30
	"\nこのあたりに こう水が おそってくるよ!"
	keyWait
	clearMsg
	flagClear
		flag = 639
	mugshotShow
		mugshot = Lan
	msgOpen
	"マジかよ!? ヒナンしなきゃ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	ちょ、ちょっと まてよ!
	炎山のヤツは どうすんだよ!?
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
	"ホントだ! あのバカ!"
	keyWait
	clearMsg
	"""
	・・・オレ さがしてくる!
	みんなは 先に ヒナンしててくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗・・・かえってきてね!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"しんぱい すんなって!"
	keyWait
	clearMsg
	jump
		target = 10
}
