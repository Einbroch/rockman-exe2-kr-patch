@archive 0780450
@size 2

script 0 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 267
	"カタカタカタカタ・・・"
	wait
		frames = 84
	controlUnlock
	soundEnableTextSFX
	keyWait
	end
}
