@archive 0740030
@size 220

script 0 mmbn2 {
	checkArea
		lower = 141
		upper = 141
		jumpIfInRange = 160
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 15
		upper = 15
		jumpIfInRange = 150
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 14
		upper = 14
		jumpIfInRange = 140
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 13
		upper = 13
		jumpIfInRange = 130
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 12
		upper = 12
		jumpIfInRange = 120
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 11
		upper = 11
		jumpIfInRange = 110
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 10
		upper = 10
		jumpIfInRange = 100
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 9
		upper = 9
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 8
		upper = 8
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 7
		upper = 7
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 6
		upper = 6
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 5
		upper = 5
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 4
		upper = 4
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 3
		upper = 3
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 2
		upper = 2
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 1
		upper = 1
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 0
		upper = 0
		jumpIfInRange = 1
		jumpIfOutOfRange = continue
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ブラックボードにプラグインすると
	なんか、べんきょうしたような
	きに なるよな
	"""
	keyWait
	clearMsg
	"ぜんぜんしてないけど・・・"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ダレかの わすれものかな?
	この、ロボット・・・
	こわれかかってるぜ
	"""
	keyWait
	clearMsg
	"""
	やっぱ、おもちゃでも なんでも
	だいじにしなきゃな!
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	わがやを、まもるセキュリティ、
	バグらないよう ていきてきに
	メンテナンスしないとな
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	この、コンパネ
	プラグインできるようにして
	せいかいだったな
	"""
	keyWait
	clearMsg
	"""
	これなら、ロックマンが
	メンテナンスできるし
	"""
	keyWait
	clearMsg
	jump
		target = 31
}
script 31 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"そだね!"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	メイルのヤツ、この 電子ピアノ
	ホントに つかってるのかな?
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、
	コーヒーのニオイとかするのか?
	"""
	keyWait
	clearMsg
	jump
		target = 51
}
script 51 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"このニオイは・・・"
	keyWait
	clearMsg
	"あらびきだね!!"
	keyWait
	clearMsg
	"なんてね! じょうだんだよ"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	さいしんの けいたいゲームか・・・
	はいりごこちはどうだ?
	"""
	keyWait
	clearMsg
	jump
		target = 61
}
script 61 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ふしぎな かんかくだね
	PETのナカに いるみたいなかんじだよ
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	このタイプのでんわは、
	さいきん あまりみないな・・・
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	こんなトコロに、プラグインして
	バチがあたらないだろうな?
	"""
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、なかは アツそうだけど
	だいじょうぶか?
	"""
	keyWait
	clearMsg
	jump
		target = 91
}
script 91 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やけつくような アツさだよ!!"
	keyWait
	end
}
script 100 mmbn2 {
	checkChapter
		lower = 12
		upper = 12
		jumpIfInRange = 101
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"それにしても このクマ、よくできてんなぁ"
	keyWait
	end
}
script 101 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"このクマ、よくできてんなぁ・・・"
	waitSkip
		frames = 30
	"\nって かんしんしてる ばあいじゃないか!"
	keyWait
	end
}
script 110 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	いつもパパが、つかってるモニターだぜ
	どうだ、ロックマン?
	"""
	keyWait
	clearMsg
}
script 111 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	なんだか わかんないけど、
	とても おちつくよ
	"""
	keyWait
	end
}
script 120 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ホントにデカイモニターだな!
	なんインチあるんだ?
	"""
	keyWait
	end
}
script 130 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、くうこうの
	じこくひょうの中は どうだ?
	"""
	keyWait
	clearMsg
	jump
		target = 131
}
script 131 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、アテンションプリーズ!
	なんてね!!
	"""
	keyWait
	end
}
script 140 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	へぇ~、めんぜいてんも、
	プログラムで かんりしているのか
	"""
	keyWait
	end
}
script 150 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	こんな トコロに、
	プラグインできるだ なんてな・・・
	やいとのヤツ なかなかやるな
	"""
	keyWait
	end
}
script 160 mmbn2 {
	checkSubArea
		lower = 4
		upper = 4
		jumpIfInRange = 200
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 3
		upper = 3
		jumpIfInRange = 190
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 2
		upper = 2
		jumpIfInRange = 180
		jumpIfOutOfRange = continue
	checkSubArea
		lower = 1
		upper = 1
		jumpIfInRange = 170
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	さむそうだけど、だいじょうぶか?
	ロックマン!?
	"""
	keyWait
	clearMsg
	jump
		target = 161
}
script 161 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	にんげんだったら、
	カゼを ひいちゃうトコロだね
	"""
	keyWait
	end
}
script 170 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	めがみぞうか・・・
	なんだか、しんせいな キブンになるな
	"""
	keyWait
	end
}
script 180 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ひこうきの テレビか・・・
	ふつうの、テレビとどこが
	ちがうんだ?
	"""
	keyWait
	clearMsg
	jump
		target = 181
}
script 181 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	あんまり かわりない みたいだけど
	わりと、こうせいのうの テレビだよ
	"""
	keyWait
	end
}
script 190 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じはんきに、プラグインするのは、
	ひさしぶりだな・・・
	"""
	keyWait
	end
}
script 200 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	オートロックの電脳か・・・
	けど、カギは あいてるみたいだけど・・・
	"""
	keyWait
	end
}
