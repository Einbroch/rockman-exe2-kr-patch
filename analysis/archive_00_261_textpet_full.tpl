@archive 0785CFC
@size 9

script 0 mmbn2 {
	msgOpen
	"ピピピ!"
	wait
		frames = 60
	keyWait
	end
}
script 1 mmbn2 {
	soundPlayBGM
		track = 14
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"ジョンソン・・・"
	waitSkip
		frames = 30
	"だ"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = BlackWoman
	msgOpen
	"どうしたのよ!?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"スマン・・・"
	waitSkip
		frames = 30
	"\nトラップに やられ・・"
	waitSkip
		frames = 30
	"た!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ジョンソンさん!
	たすけに 行く! いま どこ!?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"オレは もう・・・"
	waitSkip
		frames = 30
	"""
	ダメだ!
	オレの・・・
	"""
	waitSkip
		frames = 30
	"""
	ことは きにせず
	さきに すす・・・
	"""
	waitSkip
		frames = 30
	"むんだ"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	soundStop
	mugshotHide
	msgOpen
	soundDisableTextSFX
	flagSet
		flag = 599
	"ゴーーーーゴゴゴゴゴゴゴゴゴ!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	flagClear
		flag = 599
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	soundEnableTextSFX
	"グワーーーーーーー!!"
	keyWait
	clearMsg
	jump
		target = 8
}
