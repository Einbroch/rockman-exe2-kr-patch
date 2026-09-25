@archive 0731310
@size 45

script 0 mmbn2s {
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	ついかの チップデータ おくるから
	1ターンまって!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、ここはにげた方がいいかな?\n"
	option
		left = 0
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 1
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
			jump = continue,
			jump = continue,
			jump = continue
		]
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	wait
		frames = 18
	"・"
	wait
		frames = 18
	"・"
	wait
		frames = 18
	"・"
	wait
		frames = 18
	"""
	よし!
	なんとかにげきれたよ!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	wait
		frames = 18
	"・"
	wait
		frames = 18
	"・"
	wait
		frames = 18
	"・"
	wait
		frames = 18
	"""
	ダメだ!
	にげきれない・・・!
	"""
	keyWait
	end
}
script 5 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 8
		padZeros = false
		padLeft = true
	"z"
	end
}
script 6 mmbn2s {
	printBuffer
		buffer = 0
		minLength = 3
		padZeros = false
		padLeft = true
	end
}
script 7 mmbn2s {
	"      HP+"
	end
}
script 8 mmbn2s {
	"     HP+"
	end
}
script 9 mmbn2s {
	"    HP+"
	end
}
script 10 mmbn2s {
	"    HPマックス"
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	つうしんエラーだ・・・
	せんとうをちゅうしするね
	"""
	keyWait
	end
	"4"
}
script 12 mmbn2s {
	"VS"
	end
}
script 13 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	エレキガッツスタイルのレベルが
	2になった! チャージ攻撃の
	ラビリングの攻撃力がUPした!
	"""
	keyWait
	end
}
script 14 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	エレキガッツスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	ラビリングの攻撃力がUPした!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ヒートガッツスタイルのレベルが
	2になった! チャージ攻撃の
	かえんほうしゃきの攻撃力がUPした!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ヒートガッツスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	かえんほうしゃきの攻撃力がUPした!
	"""
	keyWait
	end
}
script 17 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	アクアガッツスタイルのレベルが
	2になった! チャージ攻撃の
	バブルショットの攻撃力がUPした!
	"""
	keyWait
	end
}
script 18 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	アクアガッツスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	バブルショットの攻撃力がUPした!
	"""
	keyWait
	end
}
script 19 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ウッドガッツスタイルのレベルが
	2になった! チャージ攻撃の
	コガラシの攻撃力がUPした!
	"""
	keyWait
	end
}
script 20 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ウッドガッツスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	コガラシの攻撃力がUPした!
	"""
	keyWait
	end
}
script 21 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	エレキカスタムスタイルのレベルが
	2になった! チャージ攻撃の
	ラビリングの攻撃力がUPした!
	"""
	keyWait
	end
}
script 22 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	エレキカスタムスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	ラビリングの攻撃力がUPした!
	"""
	keyWait
	end
}
script 23 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ヒートカスタムスタイルのレベルが
	2になった! チャージ攻撃の
	かえんほうしゃの攻撃力がUPした!
	"""
	keyWait
	end
}
script 24 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ヒートカスタムスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	かえんほうしゃの攻撃力がUPした!
	"""
	keyWait
	end
}
script 25 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	アクアカスタムスタイルのレベルが
	2になった! チャージ攻撃の
	バブルショットの攻撃力がUPした!
	"""
	keyWait
	end
}
script 26 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	アクアカスタムスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	バブルショットの攻撃力がUPした!
	"""
	keyWait
	end
}
script 27 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ウッドカスタムスタイルのレベルが
	2になった! チャージ攻撃の
	コガラシの攻撃力がUPした!
	"""
	keyWait
	end
}
script 28 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ウッドカスタムスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	コガラシの攻撃力がUPした!
	"""
	keyWait
	end
}
script 29 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	エレキブラザースタイルのレベルが
	2になった! チャージ攻撃の
	ラビリングの攻撃力がUPした!
	"""
	keyWait
	end
}
script 30 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	エレキブラザースタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	ラビリングの攻撃力がUPした!
	"""
	keyWait
	end
}
script 31 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ヒートブラザースタイルのレベルが
	2になった! チャージ攻撃の
	かえんほうしゃの攻撃力がUPした!
	"""
	keyWait
	end
}
script 32 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ヒートブラザースタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	かえんほうしゃの攻撃力がUPした!
	"""
	keyWait
	end
}
script 33 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	アクアブラザースタイルのレベルが
	2になった! チャージ攻撃の
	バブルショットの攻撃力がUPした!
	"""
	keyWait
	end
}
script 34 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	アクアブラザースタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	バブルショットの攻撃力がUPした!
	"""
	keyWait
	end
}
script 35 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ウッドブラザースタイルのレベルが
	2になった! チャージ攻撃の
	コガラシの攻撃力がUPした!
	"""
	keyWait
	end
}
script 36 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ウッドブラザースタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	コガラシの攻撃力がUPした!
	"""
	keyWait
	end
}
script 37 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	エレキシールドスタイルのレベルが
	2になった! チャージ攻撃の
	ラビリングの攻撃力がUPした!
	"""
	keyWait
	end
}
script 38 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	エレキシールドスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	ラビリングの攻撃力がUPした!
	"""
	keyWait
	end
}
script 39 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ヒートシールドスタイルのレベルが
	2になった! チャージ攻撃の
	かえんほうしゃの攻撃力がUPした!
	"""
	keyWait
	end
}
script 40 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ヒートシールドスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	かえんほうしゃの攻撃力がUPした!
	"""
	keyWait
	end
}
script 41 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	アクアシールドスタイルのレベルが
	2になった! チャージ攻撃の
	バブルショットの攻撃力がUPした!
	"""
	keyWait
	end
}
script 42 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	アクアシールドスタイルのレベルが
	3(MAX)になった! チャージ攻撃の
	バブルショットの攻撃力がUPした!
	"""
	keyWait
	end
}
script 43 mmbn2 {
	msgOpen
	soundPlay
		track = 301
	"""
	ウッドシールドスタイルのレベルが
	2になった! チャージ攻撃の
	コガラシの攻撃力がUPした!
	"""
	keyWait
	end
}
