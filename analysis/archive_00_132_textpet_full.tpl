@archive 0771824
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ヨウコソ 「ケイジバンベヤ」 ヘ!"
	keyWait
	clearMsg
	"""
	ココニハ
	4マイノ ケイジバンガ アリマス
	"""
	keyWait
	clearMsg
	"""
	ケイジバンゴトニ テーマガ アッテ、
	ドレモ マイニチ
	タクサンノ カキコミガ アリマス
	"""
	keyWait
	clearMsg
	"""
	コマメニ チェック シテオクト、
	オトクナ ジョウホウガ
	ゲット デキルカモ シレマセンヨ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ケイジバンって、カきこみを すれば
	ジブンから ホしい ジョウホウを
	モトめるコトも デキるんだよ
	"""
	keyWait
	clearMsg
	"""
	・・・ていうか それが
	ケイジバンの ダイゴミ なんだけどね
	"""
	keyWait
	clearMsg
	"""
	そのうち キミも
	カきこんでみると いいよ
	"""
	keyWait
	end
}
script 25 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ナニが オきても
	ここの カきコみだけは ヘらないね
	"""
	keyWait
	clearMsg
	"""
	そういう オレも
	ハマってる クチなんだけどさ
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1808
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	こんなトキでも
	ケイジバンは やめられない・・・
	"""
	keyWait
	clearMsg
	"""
	ってイうと ヘンなメで
	ミられがちだけど、ジッサイ
	いいジョウホウが アツマってるんだよね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"バトルじょうほう けいじばんだ!"
	keyWait
	startBBS
		bbs = 1
	waitHold
}
script 221 mmbn2 {
	checkChapter
		lower = 23
		upper = 23
		jumpIfInRange = 230
		jumpIfOutOfRange = continue
	msgOpen
	"まちかどじょうほう けいじばんだ!"
	keyWait
	startBBS
		bbs = 2
	waitHold
}
script 222 mmbn2 {
	msgOpen
	"ウイルスじょうほう けいじばんだ!"
	keyWait
	startBBS
		bbs = 3
	waitHold
}
script 223 mmbn2 {
	msgOpen
	"ざつだん けいじばんだ!"
	keyWait
	startBBS
		bbs = 4
	waitHold
}
script 230 mmbn2 {
	checkFlag
		flag = 596
		jumpIfTrue = 231
		jumpIfFalse = continue
	flagSet
		flag = 595
	wait
		frames = 1
	end
}
script 231 mmbn2 {
	checkFlag
		flag = 602
		jumpIfTrue = continue
		jumpIfFalse = 232
	flagSet
		flag = 595
	wait
		frames = 1
	end
}
script 232 mmbn2 {
	msgOpen
	"まちかどじょうほう けいじばんだ!"
	keyWait
	startBBS
		bbs = 2
	waitHold
}
