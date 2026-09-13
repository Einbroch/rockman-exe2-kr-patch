@archive 077C8C0
@size 8

script 0 mmbn2 {
	msgOpen
	"""
	休みに入って なん日かが すぎた
	ある日の こと・・・
	"""
	wait
		frames = 60
	keyWait
	end
}
script 1 mmbn2 {
	soundPlayBGM
		track = 4
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ねぇ 熱斗くん、たまには
	あそびに 行くまえに しゅくだい
	やりなよー
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
	かたいこと いうなって!
	休みは まだまだ あるじゃんかー!
	"""
	keyWait
	clearMsg
	"""
	あー お休みって サイコーだなー!
	今日は なにして あそぼっかなーーー!
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
	もう! あとで こまったって
	ボク しらないよ!
	"""
	keyWait
	clearMsg
	"""
	でもさ、どうせ あそぶんなら
	おもいでに のこること しようよ!
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
	"んー たしかに そうだなあ・・・"
	waitSkip
		frames = 30
	"""
	
	じゃ、ウミにでも 行くかなー?
	それとも 山かなー?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"どっちも いいね、どっちに する?"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"よし! じゃあ 山!"
	waitSkip
		frames = 30
	"\nみんなで キャンプに 行こう!"
	keyWait
	clearMsg
	jump
		target = 7
}
