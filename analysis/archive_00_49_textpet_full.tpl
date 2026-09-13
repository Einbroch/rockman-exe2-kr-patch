@archive 0764F94
@size 255

script 0 mmbn2 {
	msgOpen
	"""
	いったん
	マリンハーバーへ もどりますか?
	
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
			jump = 1,
			jump = continue,
			jump = continue
		]
	end
}
script 1 mmbn2 {
	startWarp
		warp = 0
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	もう だいじょうぶ だってんだ!
	そんなヤワな デカオさまじゃ ねぇぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 181
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	このあたりの レベルの 電磁波なら
	アタシたちの ぼうじウェアでも
	だいじょうぶ みたいね
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 600
		jumpIfTrue = continue
		jumpIfFalse = 7
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗 がんばって!"
	keyWait
	clearMsg
	"あ でも やっぱり・・・"
	waitSkip
		frames = 30
	"\nううん・・・"
	waitSkip
		frames = 15
	"なんでもないの"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	きのうから そこの マンションが
	おかしなことに なりだして・・・
	"""
	keyWait
	clearMsg
	"みんなは もう ヒナンしたけど・・・"
	keyWait
	clearMsg
	"く・・くるしい・・・"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = SternMan
	msgOpen
	"""
	で、電磁波の せいで
	おもった ほうこうに あるけないんだ
	・・・
	"""
	keyWait
	end
}
script 7 mmbn2 {
	flagSet
		flag = 600
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	だから コレもって はやいとこ
	ゴスペル たおして きなさいよね
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 47
		code = *
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 47
	" "
	printCode
		buffer = 0
		code = *
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"がんばんなさいよね"
	keyWait
	end
}
script 180 mmbn2 {
	checkChapter
		lower = 67
		upper = 71
		jumpIfInRange = 2
		jumpIfOutOfRange = continue
	end
}
script 181 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、デカオくんに
	ネットバトルを もうしこむ?
	
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
	"いいえ\n"
	select
		default = 1
		disableB = false
		clear = true
		targets = [
			jump = 182,
			jump = 184,
			jump = continue
		]
	end
}
script 182 mmbn2 {
	checkFlag
		flag = 9
		jumpIfTrue = 185
		jumpIfFalse = continue
	checkFlag
		flag = 6
		jumpIfTrue = 197
		jumpIfFalse = 196
	end
}
script 183 mmbn2 {
	flagSet
		flag = 9
	msgClose
	waitHold
}
script 184 mmbn2 {
	flagClear
		flag = 44
	flagClear
		flag = 45
	flagClear
		flag = 46
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	ウデを きたえたいなら
	いつでも あいてに なってやるぜ!
	"""
	keyWait
	end
}
script 185 mmbn2 {
	flagClear
		flag = 44
	flagClear
		flag = 45
	flagClear
		flag = 46
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	・・・やっぱり ガッツマンを
	つよくするまで ちょっと まってくれ!
	な? な?
	"""
	keyWait
	end
}
script 186 mmbn2 {
	checkFlag
		flag = 44
		jumpIfTrue = 187
		jumpIfFalse = continue
	checkFlag
		flag = 45
		jumpIfTrue = 189
		jumpIfFalse = continue
	checkFlag
		flag = 46
		jumpIfTrue = 191
		jumpIfFalse = 191
}
script 187 mmbn2 {
	checkFlag
		flag = 6
		jumpIfTrue = 194
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	マジかよ!
	ちょっとは やるじゃねぇか・・・
	"""
	keyWait
	clearMsg
	"いいだろ・・・"
	waitSkip
		frames = 30
	"\nこいつを つかいな!"
	keyWait
	clearMsg
	jump
		target = 188
}
script 188 mmbn2 {
	flagSet
		flag = 6
	flagClear
		flag = 44
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 81
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 81
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	clearMsg
	jump
		target = 193
}
script 189 mmbn2 {
	checkFlag
		flag = 7
		jumpIfTrue = 194
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	チキショー!!
	これでも かなわねえのかよ!
	"""
	keyWait
	clearMsg
	jump
		target = 190
}
script 190 mmbn2 {
	flagSet
		flag = 7
	flagClear
		flag = 45
	end
}
script 191 mmbn2 {
	checkFlag
		flag = 8
		jumpIfTrue = 194
		jumpIfFalse = continue
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	くっそー!!
	いまのは まちがいだ! きっと そうだ!
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	flagSet
		flag = 8
	flagClear
		flag = 46
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"こんどは まけねぇぜ!"
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	くっそー!!
	いまのは まちがいだ! きっと そうだ!
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	やっぱり オレが 行かなきゃ
	ゴスペルは たおせねぇのか・・・
	"""
	keyWait
	end
}
script 196 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	ヘッ!!
	まけても なくんじゃねぇぞっ!!
	"""
	keyWait
	clearMsg
	jump
		target = 183
}
script 197 mmbn2 {
	checkFlag
		flag = 316
		jumpIfTrue = 196
		jumpIfFalse = continue
	flagSet
		flag = 316
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	この バトルのために
	きのう かってきた サポートチップ!
	"""
	keyWait
	clearMsg
	"""
	そして・・・ついに かんせいした
	ガッツマンの しんひっさつプログラム
	ロケットガッツパンチを くらいやがれ!
	"""
	keyWait
	clearMsg
	jump
		target = 183
}
script 220 mmbn2 {
	msgOpen
	"""
	マンションだ
	電磁波のいじょうのえいきょうで
	はいきょのようになっている
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	マンションだ
	電磁波のいじょうのえいきょうで
	はいきょのようになっている
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"ジュースの じどうはんばいき だ!"
	keyWait
	clearMsg
	"""
	メンテナンスように
	プラグインできるようになっている
	"""
	keyWait
	end
}
