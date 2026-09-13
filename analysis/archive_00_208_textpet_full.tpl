@archive 077F19C
@size 21

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ふぁ~~あ"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	どしたの 熱斗くん?
	そんな 大きな あくびして・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	じゆうけんきゅうの テーマ
	かんがえてたんだ~
	"""
	keyWait
	clearMsg
	"""
	休みは いいんだけど
	まいとし こまるんだよなぁ~
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	やっぱり
	熱斗くんが きょうみを もってるモノを
	テーマにしたほうが いいんじゃない?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"きょうみの あるモノかぁ~"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	・・・ん?
	なんだ あれ?
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	このフウセン、なんだろ?
	ヒモのさきに なにかついてる・・・
	"""
	keyWait
	clearMsg
	"チップデータ みたいだけど・・・\n"
	flagSet
		flag = 514
	"ロックマン、ちょっと しらべてみて!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"オーケー! ちょっと まって!"
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"""
	これ、
	がいこくの チップデータ みたい
	テキストで・・・なにか かいてある
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	がいこくって すごいじゃん!
	で? なんて???
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"じゃ ほんやく してみるね"
	keyWait
	clearMsg
	"""
	「ほんやくシステム」 きどう!!
	・
	"""
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	mugshotAnimate
		animation = 0
	soundDisableTextSFX
	soundPlay
		track = 265
	"ピキーン!!"
	wait
		frames = 30
	keyWait
	clearMsg
	soundEnableTextSFX
	mugshotAnimate
		animation = 1
	"""
	ほんやく しゅうりょう!!
	え・・・と、これ てがみみたい、
	"""
	keyWait
	clearMsg
	"「メルともに なってください」"
	keyWait
	clearMsg
	"だって!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"メルともかぁ・・・"
	waitSkip
		frames = 30
	"おもしろいかも・・・"
	waitSkip
		frames = 30
	"\nで、どこのクニから きたか わかるか?"
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
	この データけいしきだと・・・
	「アジーナこく」 だね!!
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	「アジーナこく」 といえば・・・
	おいしい たべもので
	ゆうめいな クニじゃん!!
	"""
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"きめた!!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	いきなり 大きなこえ 出さないでよ!
	ビックリ するなぁ~
	"""
	keyWait
	clearMsg
	"・・・で、なにが きまったの?"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"じゆうけんきゅうの テーマさ!!"
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
	ほんと! すごいね!
	それで? なにを けんきゅうするの?
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
	ズバリ!
	世界のごちそう けんきゅう!!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん らしいなぁ・・・"
	keyWait
	clearMsg
	"""
	でも、世界中の たべものの ぶんかを
	しらべるのも おもしろいかもね
	うん、いいテーマだよ!
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!!
	さっそく インターネットで
	アジーナこく 見にいってみようぜ!!
	"""
	keyWait
	clearMsg
	"""
	さっきの てがみくれた人 さがして、
	アジーナの たべものの こと
	いろいろ おしえて もらおう!
	"""
	keyWait
	clearMsg
	mugshotAnimate
		animation = 0
	"(それで ダチになって、アジーナこくに\n しょうたい されたりしたら・・・"
	keyWait
	clearMsg
	"おいしい ごちそう たべほうだい!)"
	keyWait
	clearMsg
	mugshotAnimate
		animation = 1
	"""
	・・・いそごう! かえって
	インターネットに プラグインだ!
	"""
	keyWait
	clearMsg
	"いくぜっ! アジーナこくへ!!"
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"???"
	waitSkip
		frames = 20
	"""
	
	なんか みょうに きあい入ってるのが
	気になるけど・・・
	"""
	keyWait
	clearMsg
	"""
	OK!
	ボク、アジーナこくに いってみる!
	"""
	keyWait
	end
}
