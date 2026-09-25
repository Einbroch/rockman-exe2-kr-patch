@archive 0734B2C
@size 70

script 10 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	こ・・・これは
	シンクロりつ 200%・・・!?
	ロックマン! もしかして・・・
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
	うん
	このかんじ・・・
	たしか前にも・・・
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"やはりそうか・・・!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なになに! どういうこと!?
	パパ!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	てごわいナビたちとのバトルの中で
	フルシンクロのじょうたいが
	ながく つづいた・・・そのために
	"""
	keyWait
	clearMsg
	"""
	ロックマンのせんざいいしきが
	いぜんカイジョしたはずの
	saito.batをふっかつさせたんだ
	"""
	keyWait
	clearMsg
	"""
	そうだな あえてなづけるならば
	・・・サイトスタイル!
	"""
	keyWait
	clearMsg
	"""
	今のロックマンは
	かなりのパワーアップをしているだろう
	しかし・・・
	"""
	keyWait
	clearMsg
	"""
	おそらくカラダの方がそこまでもたない
	HPはハンゲンしているだろうな
	"""
	keyWait
	clearMsg
	"""
	つよさとモロさを かねそなえたスタイルだ
	それは 熱斗・・・
	おまえのオペレーティングにかかっているぞ!
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
	熱斗くん
	たのんだよ!
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
	"""
	サイトスタイルかぁ
	すげー!
	これで むかうところテキなしだな!
	"""
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
