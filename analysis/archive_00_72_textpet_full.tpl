@archive 07662E8
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 6
		upper = 255
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ウ、ウーン・・・"
	waitSkip
		frames = 30
	"\nデモ ダイジョウブ ナノデス"
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 7
		upper = 255
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココハ ガスユワカシキノ
	プログラムノ セカイデス
	"""
	keyWait
	clearMsg
	"""
	・・・デモ ナンデカ シンナイケド
	イマハ セイジョウニ ウゴイテマセン
	"""
	keyWait
	clearMsg
	"ナンデー? ナンデー?"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	グライドサンヤ
	オトモダチノ ヒトノ ナビサンガ
	オクニ イキマシタ
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	"デモ カエッテ キマセーン!"
	keyWait
	end
}
script 3 mmbn2 {
	checkFlag
		flag = 13
		jumpIfTrue = 4
		jumpIfFalse = continue
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"""
	このむこうへは どうやったら
	すすめるで ガッツか?
	"""
	keyWait
	clearMsg
	"デカオさまー! デカオさまー!"
	waitSkip
		frames = 30
	"""
	
	ヌオーーーー!!!!
	なんで へんじがないで ガッツかー!?
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"""
	ガスが でたでガス!
	さあ、いくでガッツ!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	checkChapter
		lower = 6
		upper = 255
		jumpIfInRange = 16
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ヤイトサマノ オトモダチノ ヒトノ
	ナビサン デスカ?
	
	"""
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 6,
			jump = continue,
			jump = continue
		]
	"""
	ジャア オマエガ
	ココヲ ヘンナコトニ シテルンダナ!
	"""
	keyWait
	clearMsg
	"コノー! コノー!"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ソコノ カンキセンノ プログラムニ
	エラーガ デテイマス!
	"""
	keyWait
	clearMsg
	"""
	コレヲ ナオセバ、オフロノ ソトノ
	カンキセンガ ウゴキマス!
	"""
	keyWait
	clearMsg
	"アナタナラ デキマス! "
	waitSkip
		frames = 30
	"サー!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! さっき かんきせんの
	プログラム おいてなかった?
	ほおっておくのは マズいよ!
	"""
	keyWait
	clearMsg
	"デカオくん たすけなきゃ!"
	keyWait
	end
}
script 15 mmbn2 {
	msgOpen
	"""
	気を うしなっている・・・
	やはり ショックは 大きかったようだ
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	カンキセンノ プログラムハ
	ホカニモ アリマス
	"""
	keyWait
	clearMsg
	"サア オクヘ!"
	waitSkip
		frames = 30
	"\nソシテ ヤイトサマヲ!"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココハ ガスユワカシキノ
	プログラムノ セカイデス
	"""
	keyWait
	clearMsg
	"""
	ロックマンサンノ オカゲデ
	イマハ セイジョウニ ウゴイテイマス
	タマニ ウイルスハ デマスケドネ!
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 7
		upper = 255
		jumpIfInRange = 225
		jumpIfOutOfRange = continue
	checkFlag
		flag = 551
		jumpIfTrue = 224
		jumpIfFalse = continue
	msgOpen
	"""
	かんきせんの プログラムだ
	しかし エラーが出て とまっている・・・
	"""
	keyWait
	clearMsg
	"""
	ロックマンは、
	かんきせんの プログラムの
	エラーを とりのぞいた!
	"""
	keyWait
	clearMsg
	soundPlay
		track = 167
	soundDisableTextSFX
	"""
	かんきせんの プログラムが
	うごきだした!
	"""
	keyWait
	soundEnableTextSFX
	flagSet
		flag = 552
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	でんのうもとせん
	を ひねった!
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"でんのうガスが とまった!"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"でんのうガスが ふきだす!"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	かんきせんの プログラムだ
	ちゃんと うごいている
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	かんきせんの プログラムだ
	今は とくに なにもしなくていい
	"""
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1319
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 122
		code = *
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 122
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 231 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1320
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 5
		code = A
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 5
	" "
	printCode
		buffer = 0
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 232 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1321
	playerLock
	playerAnimate
		animation = 24
	checkGiveZenny
		amount = 200
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	ロックマンは、
	「200ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
