@archive 077B890
@size 23

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"かんきせん! うごけ!"
	keyWait
	clearMsg
	msgClose
	wait
		frames = 60
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	"・ブ"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	soundPlay
		track = 167
	soundDisableTextSFX
	"ブワーーーーン!"
	soundEnableTextSFX
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	soundStop
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん! やった!"
	waitSkip
		frames = 30
	"""
	
	デカオの あしもとの かんきせんが
	うごいたんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"はやく デカオくんを!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"もち!"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おい! "
	waitSkip
		frames = 30
	"デカオ! "
	waitSkip
		frames = 30
	"しっかりしろ!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Dex
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
	"うーん・・"
	waitSkip
		frames = 30
	"う・・"
	waitSkip
		frames = 30
	"う"
	waitSkip
		frames = 30
	"\nゲホッ、ゲホッ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"デカオ! 目をさますんだ!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"デカオさまーーーー! "
	waitSkip
		frames = 30
	"でガス!!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Dex
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
	"ガッ・・"
	waitSkip
		frames = 30
	"ツマンか・・・"
	waitSkip
		frames = 30
	"\nお、おう・・・"
	waitSkip
		frames = 30
	"\nグッ・・・"
	waitSkip
		frames = 30
	"フゥーーーー"
	waitSkip
		frames = 30
	keyWait
	clearMsg
	"""
	あーーー くるしかったーー
	でも、もう・・・
	"""
	waitSkip
		frames = 30
	"だいじょうぶだ・・・"
	keyWait
	end
}
script 11 mmbn2 {
	soundPlayBGM
		track = 14
	mugshotShow
		mugshot = Dex
	msgOpen
	"すまねえ・・・"
	waitSkip
		frames = 30
	"熱斗!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あやまんなくても いいよ!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	とはいえ
	タダで せわになる わけにはいかねぇ、
	"""
	waitSkip
		frames = 30
	"\nおい! ガッツマン!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"はいでガス! デカオさま!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	げんかんの トビラのロックを
	はずしに 行くぜ! 熱斗が いつでも
	だっしゅつ できるようにするんだ!
	"""
	keyWait
	clearMsg
	"よし! プラグアウト!"
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"ガッツで ガス!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"ここは・・・"
	waitSkip
		frames = 30
	"まかせたぜ!"
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"デカオのヤツ・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	かんしょうに ひたってるヒマはないよ!
	まだ やいとちゃんが!
	"""
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん! わすれてない!"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	じゃ、ボク
	のこりのスイッチ、さがしてみる!
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
