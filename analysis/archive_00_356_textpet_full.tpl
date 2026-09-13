@archive 07E7AB8
@size 24

script 0 mmbn2 {
	msgOpen
	"""
	チップトレーダーがある
	バトルチップを3枚 入れてみますか?
	
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
		clear = false
		targets = [
			jump = continue,
			jump = 5,
			jump = continue
		]
	startChipTrader
		amount = 3
		jumpIfNotEnoughChips = 1
	keyWait
	end
}
script 1 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 20
		jumpIfFalse = continue
	checkFlag
		flag = 5
		jumpIfTrue = 20
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん いまリュックの中には
	3枚もチップはないよ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	wait
		frames = 30
	msgOpen
	"この3枚でよろしいですか?\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	end
}
script 3 mmbn2 {
	msgOpen
	"よーし!\n"
	soundDisableTextSFX
	soundPlay
		track = 233
	"ガチャガチャ・・・ゴトン!"
	soundEnableTextSFX
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	soundPlay
		track = 133
	flagSet
		flag = 2149
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	clearMsg
	flagClear
		flag = 2149
	"もういちど やりますか?\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = 5,
			jump = continue
		]
	startChipTrader
		amount = 3
		jumpIfNotEnoughChips = 4
	keyWait
	end
}
script 4 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 21
		jumpIfFalse = continue
	checkFlag
		flag = 5
		jumpIfTrue = 21
		jumpIfFalse = continue
	clearMsg
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん ざんねん・・・
	もうリュックにはチップが3枚もないよ
	またこんどにしよ!
	"""
	keyWait
	end
}
script 5 mmbn2s {
	end
	"4"
}
script 6 mmbn2 {
	msgOpen
	"""
	チップトレーダースペシャルがある
	バトルチップを10枚 入れてみますか?
	
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
		clear = false
		targets = [
			jump = continue,
			jump = 11,
			jump = continue
		]
	startChipTrader
		amount = 10
		jumpIfNotEnoughChips = 7
	keyWait
	end
}
script 7 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 22
		jumpIfFalse = continue
	checkFlag
		flag = 5
		jumpIfTrue = 22
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん いまリュックの中には
	10枚もチップはないよ
	"""
	keyWait
	end
}
script 8 mmbn2 {
	wait
		frames = 30
	msgOpen
	"この10枚でよろしいですか?\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = continue,
			jump = continue
		]
	end
}
script 9 mmbn2 {
	msgOpen
	"よーし!\n"
	soundDisableTextSFX
	soundPlay
		track = 233
	"ガチャガチャ・・・ゴトン!"
	soundEnableTextSFX
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	soundPlay
		track = 133
	flagSet
		flag = 2149
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	clearMsg
	flagClear
		flag = 2149
	"もういちど やりますか?\n"
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
		clear = false
		targets = [
			jump = continue,
			jump = 11,
			jump = continue
		]
	startChipTrader
		amount = 10
		jumpIfNotEnoughChips = 10
	keyWait
	end
}
script 10 mmbn2 {
	checkFlag
		flag = 2141
		jumpIfTrue = 23
		jumpIfFalse = continue
	checkFlag
		flag = 5
		jumpIfTrue = 23
		jumpIfFalse = continue
	clearMsg
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん ざんねん・・・
	もうリュックにはチップが10枚もないよ
	またこんどにしよ!
	"""
	keyWait
	end
}
script 11 mmbn2s {
	end
}
script 12 mmbn2 {
	msgOpen
	"""
	レトロチップトレーダーがある・・・
	レトロチップを1枚 入れてみますか?
	
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
			jump = 13,
			jump = continue,
			jump = continue
		]
	end
}
script 13 mmbn2 {
	msgOpen
	textSpeed
		delay = 0
	"""
	「ロックマンエグゼ」をつうしんケーブルで
	つないで、トレードでチップを1枚
	えらんでください(Bボタンでキャンセル)
	"""
	waitHold
}
script 14 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"""
	つうしんエラーです
	もういちど やりなおしてください
	"""
	keyWait
	end
}
script 15 mmbn2 {
	msgOpenQuick
	"チップデータを じゅしんしました"
	keyWait
	clearMsg
	"よーし!\n"
	soundDisableTextSFX
	soundPlay
		track = 233
	"ガチャガチャ・・・ゴトン!"
	soundEnableTextSFX
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	soundPlay
		track = 133
	flagSet
		flag = 2149
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	clearMsg
	flagClear
		flag = 2149
	"・・・プゥ~ン・・・"
	keyWait
	clearMsg
	"""
	レトロチップトレーダーのでんげんが
	きれた・・・
	こわれてしまったみたいだ
	"""
	keyWait
	end
}
script 16 mmbn2 {
	msgOpen
	"こわれてしまっている・・・"
	keyWait
	end
}
script 17 mmbn2s {
	end
}
script 18 mmbn2 {
	msgOpenQuick
	"ちゅうだんしたよ!"
	keyWait
	end
}
script 19 mmbn2 {
	msgOpenQuick
	textSpeed
		delay = 0
	"チップデータを じゅしん中"
	waitHold
}
script 20 mmbn2 {
	msgOpen
	"""
	いまリュックの中には
	3枚もチップはない
	"""
	keyWait
	end
}
script 21 mmbn2 {
	clearMsg
	msgOpen
	"もうリュックにはチップが3枚もないよ"
	keyWait
	end
}
script 22 mmbn2 {
	msgOpen
	"""
	いまリュックの中には
	10枚もチップはない
	"""
	keyWait
	end
}
