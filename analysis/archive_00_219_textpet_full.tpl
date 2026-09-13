@archive 07804B4
@size 4

script 0 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"カタカタカタカタ・・・"
	wait
		frames = 85
	controlUnlock
	soundEnableTextSFX
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	どうやら、オトは
	このへやの なかから
	きこえるみたいだ
	"""
	keyWait
	clearMsg
	"はいるよ 熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"気をつけろよ!"
	keyWait
	clearMsg
	jump
		target = 3
}
