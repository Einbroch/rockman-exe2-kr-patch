@archive 0733F08
@size 70

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"?! 熱斗くん・・・"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どうした? ロックマン"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"カラダがなんだか ヘンなんだ・・・"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン そのすがたは?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 219
	"ピピピ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	それは スタイルチェンジという
	げんしょうだ
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"パパ!?"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"スタイルチェンジ・・・!?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	どんなオペレータにもバスティングにおける
	クセやけいこうがある
	"""
	keyWait
	clearMsg
	"""
	そんなオペレータのクセやけいこうを
	より こうかてきにはんえいするために
	ナビがじどうしんかする
	"""
	keyWait
	clearMsg
	"""
	それがスタイルチェンジだ
	そのデータけいしきは・・・
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ヒートシールドスタイル!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ヒートシールド・・・"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"スタイル・・・?"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ぼうぎょがうまいオペレータに
	てきおうしてしんかしたナビのスタイルだ
	属性は炎
	"""
	keyWait
	clearMsg
	"""
	このスタイルのナビは バリアが
	ひょうじゅんそうびであるうえに
	"""
	keyWait
	clearMsg
	"""
	Bボタンをおしてすぐに十字ボタンの
	左をおすことで いつでもシールドで
	攻撃をガードすることができる!
	"""
	keyWait
	clearMsg
	"""
	そしてさらに チャージショットが
	かえんほうしゃきに しんかしてるはずだ
	"""
	keyWait
	clearMsg
	"""
	ただし 水属性の攻撃には
	ばいの ダメージをうけてしまうから
	気をつけないといけないぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	へえ~・・・
	やったじゃん ロックマン!
	ヒートシールドスタイルかぁ
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん
	あついパワーがみなぎるのをかんじる
	じぶんでもビックリだよ!
	"""
	keyWait
	clearMsg
	"""
	スタイルのきりかえはサブがめんで
	ロックマンをえらんでくれれば
	いつでもできるからね
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"りょうかい!"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"アクアシールドスタイル!"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"アクアシールド・・・"
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"スタイル・・・?"
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ぼうぎょがうまいオペレータに
	てきおうしてしんかしたナビのスタイルだ
	属性は水
	"""
	keyWait
	clearMsg
	"""
	このスタイルのナビは バリアが
	ひょうじゅんそうびであるうえに
	"""
	keyWait
	clearMsg
	"""
	Bボタンをおしてすぐに十字ボタンの
	左をおすことで いつでもシールドで
	攻撃をガードすることができる!
	"""
	keyWait
	clearMsg
	"""
	そしてさらに チャージショットが
	アクアショットに しんかしてるはずだ
	"""
	keyWait
	clearMsg
	"""
	ただし 電気属性の攻撃には
	ばいの ダメージをうけてしまうから
	気をつけないといけないぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 24
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	へえ~・・・
	やったじゃん ロックマン!
	アクアシールドスタイルかぁ
	"""
	keyWait
	clearMsg
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん
	すずやかなパワーがみなぎるのをかんじる
	じぶんでもビックリだよ!
	"""
	keyWait
	clearMsg
	"""
	スタイルのきりかえはサブがめんで
	ロックマンをえらんでくれれば
	いつでもできるからね
	"""
	keyWait
	clearMsg
	jump
		target = 26
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"りょうかい!"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"エレキシールドスタイル!"
	keyWait
	clearMsg
	jump
		target = 31
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"エレキシールド・・・"
	keyWait
	clearMsg
	jump
		target = 32
}
script 32 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"スタイル・・・?"
	keyWait
	clearMsg
	jump
		target = 33
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ぼうぎょがうまいオペレータに
	てきおうしてしんかしたナビのスタイルだ
	属性は電気
	"""
	keyWait
	clearMsg
	"""
	このスタイルのナビは バリアが
	ひょうじゅんそうびであるうえに
	"""
	keyWait
	clearMsg
	"""
	Bボタンをおしてすぐに十字ボタンの
	左をおすことで いつでもシールドで
	攻撃をガードすることができる!
	"""
	keyWait
	clearMsg
	"""
	そしてさらに チャージショットが
	ラビリングに しんかしてるはずだ
	"""
	keyWait
	clearMsg
	"""
	ただし 木属性の攻撃には
	ばいの ダメージをうけてしまうから
	気をつけないといけないぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 34
}
script 34 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	へえ~・・・
	やったじゃん ロックマン!
	エレキシールドスタイルかぁ
	"""
	keyWait
	clearMsg
	jump
		target = 35
}
script 35 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん
	はじけるようなパワーをかんじる
	じぶんでもビックリだよ!
	"""
	keyWait
	clearMsg
	"""
	スタイルのきりかえはサブがめんで
	ロックマンをえらんでくれれば
	いつでもできるからね
	"""
	keyWait
	clearMsg
	jump
		target = 36
}
script 36 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"りょうかい!"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ウッドシールドスタイル!"
	keyWait
	clearMsg
	jump
		target = 41
}
script 41 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ウッドシールド・・・"
	keyWait
	clearMsg
	jump
		target = 42
}
script 42 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"スタイル・・・?"
	keyWait
	clearMsg
	jump
		target = 43
}
script 43 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ぼうぎょがうまいオペレータに
	てきおうしてしんかしたナビのスタイルだ
	属性は木
	"""
	keyWait
	clearMsg
	"""
	このスタイルのナビは バリアが
	ひょうじゅんそうびであるうえに
	"""
	keyWait
	clearMsg
	"""
	Bボタンをおしてすぐに十字ボタンの
	左をおすことで いつでもシールドで
	攻撃をガードすることができる!
	"""
	keyWait
	clearMsg
	"""
	そしてさらに チャージショットが
	コガラシに しんかしてるはずだ
	"""
	keyWait
	clearMsg
	"""
	ただし 炎属性の攻撃には
	ばいの ダメージをうけてしまうから
	気をつけないといけないぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 44
}
script 44 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	へえ~・・・
	やったじゃん ロックマン!
	ウッドシールドスタイルかぁ
	"""
	keyWait
	clearMsg
	jump
		target = 45
}
script 45 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん
	やすらぎのパワーがみなぎるのをかんじる
	じぶんでもビックリだよ!
	"""
	keyWait
	clearMsg
	"""
	スタイルのきりかえはサブがめんで
	ロックマンをえらんでくれれば
	いつでもできるからね
	"""
	keyWait
	clearMsg
	jump
		target = 46
}
script 46 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"りょうかい!"
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"?! このかんじは・・・"
	keyWait
	clearMsg
	jump
		target = 51
}
script 51 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"スタイルチェンジか!?"
	keyWait
	clearMsg
	jump
		target = 52
}
script 52 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"・・・そうみたいだね・・・"
	keyWait
	clearMsg
	jump
		target = 53
}
script 53 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"このスタイルは・・・?"
	keyWait
	clearMsg
	jump
		target = 54
}
script 54 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 219
	"ピピピ・・・"
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 55
}
script 55 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	あらたなスタイルが
	はつげんしたみたいだな
	そのスタイルは・・・
	"""
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ちょっとまった
	よくきけ 熱斗・・・
	"""
	keyWait
	clearMsg
	"""
	ロックマンのメモリに
	きおくできるスタイルのじょうほうは
	2スタイルぶんしかないんだ
	"""
	keyWait
	clearMsg
	"""
	ロックマンは、もうすでに2つの
	スタイル をみにつけている
	"""
	keyWait
	clearMsg
	"""
	あたらしいスタイルをみにつけるには、
	いま、みにつけているスタイルに
	"""
	keyWait
	clearMsg
	"""
	あたらしいスタイルを うわがき
	しないといけない
	"""
	keyWait
	clearMsg
	"""
	うわがきすると、あたらしいスタイルを
	みに つけることができるが、
	"""
	keyWait
	clearMsg
	"""
	うわがき されたスタイルは
	きえてしまうんだ
	"""
	keyWait
	clearMsg
	"うわがき するか?\n"
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"はい\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 63,
			jump = 61,
			jump = continue
		]
	end
}
script 61 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	ほんとうに、うわがきしなくても
	いいのか?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"うわがきしないよ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"する!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 62,
			jump = 63,
			jump = continue
		]
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	そうだな、ひとつのスタイルを
	きわめることも、たいせつだからな
	"""
	keyWait
	clearMsg
	"""
	いま、みにつけているスタイルを
	みがくんだぞ!
	"""
	keyWait
	end
}
script 63 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	どのスタイルに
	うわがきするんだ?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	printItem
		buffer = 1
		item = 0
	"\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	printItem
		buffer = 2
		item = 0
	"\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"やっぱり、いまのままでいい!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 64,
			jump = 69,
			jump = 62,
			jump = continue
		]
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	flagClear
		flag = 58
	"それじゃ、"
	printItem
		buffer = 1
		item = 0
	"""
	の
	データにうわがきするぞ
	いいか?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいよ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"やっぱやめ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 66,
			jump = 65,
			jump = continue
		]
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"よくかんがえるんだぞ"
	keyWait
	clearMsg
	jump
		target = 63
}
script 66 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 259
	mugshotAnimate
		animation = 0
	"テカテカテカ・ ・ ・"
	wait
		frames = 30
	keyWait
	clearMsg
	soundEnableTextSFX
	mugshotAnimate
		animation = 1
	"""
	よし! これでロックマンは
	また、あたらしいチカラを
	てにいれたぞ!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 57
	jump
		target = 67
}
script 67 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	サンキュー パパ!
	よし いくぜ
	ロックマン!
	"""
	keyWait
	clearMsg
	jump
		target = 68
}
script 68 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん
	熱斗くん!
	"""
	keyWait
	end
}
