@archive 078FFC4
@size 41

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"とくん・・・"
	waitSkip
		frames = 30
	"熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"う・・"
	waitSkip
		frames = 30
	"うう・・"
	waitSkip
		frames = 30
	"ん"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん しっかりして!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	playerAnimate
		animation = 42
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロック・・"
	waitSkip
		frames = 30
	"マン"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"気が ついた?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん・・・"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"オレたち・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"やったのか?"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん! ゴスペルを たおしたんだ!"
	keyWait
	clearMsg
	"""
	見てよ! サーバーは もう
	かんぜんに ストップ してる!
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	flagSet
		flag = 525
	mugshotShow
		mugshot = Lan
	msgOpen
	"・・・"
	waitSkip
		frames = 30
	"ホントだ!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"っと・・・"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おい! だいじょうぶか! へんじしろ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ダメだ・・・"
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
	カレ、ボクたちより ながいじかん
	電磁波を あびていたから・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	"ん?"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どした?"
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
	カレのよこに おちてる
	本みたいなの・・・
	"""
	waitSkip
		frames = 30
	"それ なにかな?"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ひろってみよう"
	keyWait
	end
}
script 17 mmbn2 {
	mugshotHide
	msgOpen
	"""
	それは ふるい にっきちょうで
	1まいの しんぶんの きりぬきが
	はさまっていた・・・
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	この きりぬき・・・5年まえ ひこうきが
	ついらくした じけんの きじだ
	おぼえてる?
	"""
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うん、たしか ひこうきが バグらされて
	ついらく したんだ
	"""
	keyWait
	clearMsg
	"""
	世界さいしょの
	大きな ネットはんざいだって
	ずいぶん ニュースに なってたよな
	"""
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	カレ このじけんと
	なにか かんけいが あったのかな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん・・中を よんでみよう"
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	soundPlayBGM
		track = 15
	mugshotHide
	msgOpen
	"""
	・・・その にっきには
	こんなことが かかれていた・・・
	"""
	keyWait
	clearMsg
	"""
	カレの りょうしんが
	その ひこうきじこで なくなったこと、
	"""
	keyWait
	clearMsg
	"""
	そのあと
	しんせきに ひきとられた カレが
	いろいろ つらい目に あったこと、
	"""
	keyWait
	clearMsg
	"""
	そのとき、りょうしんの のこしたいさんは
	カレを けっして しあわせに
	しなかったこと、
	"""
	keyWait
	clearMsg
	"""
	そんなカレは とうとう だれも
	しんじられなくなって じぶんだけの
	世界に とじこもってしまったこと、
	"""
	keyWait
	clearMsg
	"そして なにより・・・"
	waitSkip
		frames = 30
	"""
	まいにちが
	とても さびしい 日々だったこと・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん・・・"
	waitSkip
		frames = 30
	"""
	
	なんだか かなしい きもちに
	なってくるね・・・
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
	"ああ・・・"
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
	カレを うらぎらなかったのは、
	きっと このコンピュータだけ
	だったんだよ・・・
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
	"うん・・・"
	keyWait
	clearMsg
	"""
	そして、
	インターネットで オトナの フリをして
	じぶんを したってくれる人を あつめ、
	"""
	keyWait
	clearMsg
	jump
		target = 27
}
script 27 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ゴスペルを けっせいした・・・"
	keyWait
	clearMsg
	jump
		target = 28
}
script 28 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	・・・じぶんに つらくあたった
	この げんじつ世界に
	しかえし するために・・・
	"""
	keyWait
	end
}
script 29 mmbn2 {
	soundStop
	mugshotShow
		mugshot = Sean
	msgOpen
	"う、うーーーん・・・"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おい! 気が ついたか!"
	keyWait
	clearMsg
	jump
		target = 31
}
script 31 mmbn2 {
	flagClear
		flag = 526
	mugshotShow
		mugshot = Sean
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"!!!!"
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"""
	お、オレの まけだ!
	おまえの すきにしろっ!!
	"""
	keyWait
	clearMsg
	"どうせ オレなんて・・・"
	waitSkip
		frames = 30
	"\n生きてたって しかたないんだ!"
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"バカ! "
	waitSkip
		frames = 30
	"""
	いいかげんに 目をさませ!
	しんでいいヤツなんて いるわけないだろ!
	"""
	keyWait
	clearMsg
	jump
		target = 34
}
script 34 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"""
	ウソだ! ほんとは ボクが にくいんだ!
	しねばいいと おもってるんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 35
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ウソじゃない!!"
	waitSkip
		frames = 30
	"""
	
	でも、やったことの バツは
	やっぱり うけなくちゃダメだ!
	"""
	keyWait
	clearMsg
	jump
		target = 36
}
script 36 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"それみろ!"
	keyWait
	clearMsg
	jump
		target = 37
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"でもさ・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 38
}
script 38 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"なんだよ!"
	keyWait
	clearMsg
	jump
		target = 39
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"つみを つぐないおわったら・・・"
	keyWait
	clearMsg
	"""
	オレが
	おまえのトモダチ だい1ゴウに
	なってやるよ!!
	"""
	keyWait
	end
}
