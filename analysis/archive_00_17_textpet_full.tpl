@archive 0751EB0
@size 255

script 0 mmbn2 {
	flagSet
		flag = 624
	wait
		frames = 1
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"かりです"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"かりよ"
	keyWait
	end
}
script 10 mmbn2 {
	checkFlag
		flag = 631
		jumpIfTrue = 16
		jumpIfFalse = continue
	checkFlag
		flag = 632
		jumpIfTrue = 13
		jumpIfFalse = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	光くん、すまないが、
	キミのチカラを かしてほしい
	プラグインしてくれないか?
	"""
	keyWait
	end
}
script 11 mmbn2 {
	checkFlag
		flag = 631
		jumpIfTrue = 17
		jumpIfFalse = continue
	checkFlag
		flag = 632
		jumpIfTrue = 14
		jumpIfFalse = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"なかなか、てごわいぜ!!"
	keyWait
	end
}
script 12 mmbn2 {
	checkFlag
		flag = 631
		jumpIfTrue = 18
		jumpIfFalse = continue
	checkFlag
		flag = 632
		jumpIfTrue = 15
		jumpIfFalse = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"むずかしいわ"
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"いけ、そこだ!"
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"ハァッ!! くらえ!"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"フン! ハッ!"
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"あとは、たのんだぞ!"
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	アイツらのぶんまで、
	がんばってくれ!
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"あなたが、たよりよ!"
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Chaud
	msgOpen
	"・・・"
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"たのんだぞ!!"
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"きあいだぜ!"
	keyWait
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"がんばってね!"
	keyWait
	end
}
script 35 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 45
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	このまえの ような じけんは
	ぜったい おきては ならない!
	"""
	keyWait
	clearMsg
	"""
	しんにゅうしゃは
	ぜったい みのがしませんよ!
	"""
	keyWait
	end
}
script 36 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 60
		jumpIfInRange = 46
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	マザーコンピュータに いじょうがおきたら
	わたしが すかさず プラグインする
	わけですよ
	"""
	keyWait
	clearMsg
	"""
	え?
	それで ダメなときは どうするか?
	"""
	keyWait
	clearMsg
	"""
	そのときは
	はしって 光さんを よびに行くのです
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"いじょうなし!!"
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"ほお、アメロッパに 行ってきたのですか?"
	keyWait
	clearMsg
	"""
	アメロッパか・・・まえに行ったのは、
	10ねんくらいまえか・・・
	なつかしいな
	"""
	keyWait
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	マザーコンピュータには、
	さいしんの たいしんシステムが
	くみこまれているから
	"""
	keyWait
	clearMsg
	"""
	たしょうの じしんでは、
	ビクともしません
	"""
	keyWait
	clearMsg
	"ごあんしんを!!"
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	いくら たいしんシステムがあったって、
	いじょうが はっせいするコトもあるから
	気がぬけないんです!
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"マザーコンピュータは、ぶじです!!"
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ふぅ、なんとかじしんが おさまってくれた
	しんけいを すりへらしましたよ・・・
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ま、マザーコンピュータは
	お、オレが まもりぬくぞ!!
	"""
	keyWait
	end
}
script 61 mmbn2 {
	checkFlag
		flag = 327
		jumpIfTrue = 62
		jumpIfFalse = continue
	flagSet
		flag = 327
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	チェッ・・・
	ミツカッチャイマシタカ・・・
	"""
	keyWait
	clearMsg
	mugshotHide
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 97
		amount = 1
	"""
	熱斗は、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 97
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerUnlock
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"モウナイデス"
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 278
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 277
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 277
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	アラ、ぼうや けっこう
	チップを もってそうなカンジね
	"""
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = *
	"""
	」ってチップ
	もってない?
	"""
	keyWait
	clearMsg
	"""
	もし もってたら、おねえさんに
	ゆずってほしいんだ
	"""
	keyWait
	clearMsg
	"""
	おねえさんは かがくしゃなの
	いま、プログラムアドバンスを
	けんきゅう してるんだ
	"""
	keyWait
	clearMsg
	"""
	このあいだ、あたらしい
	プログラムアドバンスを
	はっけん したんだけど、
	"""
	keyWait
	clearMsg
	"""
	その プログラムアドバンスを
	はつどうさせるのに
	"""
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = *
	"""
	」が
	どうしても ひつようなのよ
	"""
	keyWait
	clearMsg
	"""
	おれいは、するわ!
	「
	"""
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = *
	"""
	」を
	ゆずってちょうだい
	"""
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"いいよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いや"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 191,
			jump = continue,
			jump = continue
		]
	"""
	そう・・・ならしかたないわ
	でも、きがかわったら きてちょうだい
	"""
	keyWait
	end
}
script 191 mmbn2 {
	checkPackChipCode
		chip = 19
		code = *
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 195
	flagSet
		flag = 278
	itemTakeChip
		chip = 19
		code = *
		amount = 1
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"「"
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = *
	"""
	」を
	ゆずってくれるの?
	ありがとう! うれしいわ
	"""
	keyWait
	clearMsg
	"なにか、おれいをしなきゃね!"
	keyWait
	clearMsg
	"なにが いいかしら・・・"
	keyWait
	clearMsg
	"""
	コレなんか よさそうね!
	けんきゅうように つかってた
	ものなんだけど・・・
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	startGiveFolder
		folder = 1
	soundPlay
		track = 133
	"""
	熱斗は、
	「おねえさんの フォルダ」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	playerUnlock
	keyWait
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"""
	チップ ありがとね
	けんきゅうが すすむわ!
	"""
	keyWait
	clearMsg
	"""
	キミにだけ、こっそり おしえてあげる
	ワタシがみつけた
	プログラムアドバンスは、
	"""
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 17
	" "
	printCode
		buffer = 0
		code = O
	"」、「"
	printChip
		buffer = 0
		chip = 18
	" "
	printCode
		buffer = 0
		code = O
	"""
	」、
	「
	"""
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = O
	"""
	」、の
	くみあわせで はつどうするのよ
	"""
	keyWait
	clearMsg
	"みんなには、ないしょよ"
	keyWait
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"アラ、ぼうや きてくれたのね"
	keyWait
	clearMsg
	"「"
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = *
	"""
	」を おねえさんに
	ゆずってくれる?
	"""
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"いいよ "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いや"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 191,
			jump = continue,
			jump = continue
		]
	"""
	そう・・・ならしかたないわ
	でも、きがかわったら きてちょうだい
	"""
	keyWait
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"アラ? 「"
	printChip
		buffer = 0
		chip = 19
	" "
	printCode
		buffer = 0
		code = *
	"""
	」が
	みつからないわ?
	"""
	keyWait
	clearMsg
	"チップがないんじゃ しかたないわね"
	keyWait
	clearMsg
	"""
	そうだわ、もしかしてフォルダのなかに
	はいってないかしら?
	"""
	keyWait
	clearMsg
	"""
	よくあるコトなのよ
	フォルダのなかに はいってたら、
	リュックに、いれかえておいてね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	マザーコンピュータをまもる
	セキュリティのトビラだ
	こうあつでんりゅうが ながれている
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"ごめんなさいカリです!"
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	セキュリティのトビラを
	せいぎょするコンパネだ
	"""
	keyWait
	clearMsg
	"""
	とくしゅな プログラムが
	ほどこされていて
	オフィシャルいがい プラグインできない
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	セキュリティのトビラを
	せいぎょするコンパネだ
	"""
	keyWait
	clearMsg
	"ここは、プラグインできそうだ"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	ニホンのずのう、マザーコンピュータを
	せいぎょするコンパネだ
	"""
	keyWait
	clearMsg
	"メンテナンスように、プラグインできる"
	keyWait
	end
}
