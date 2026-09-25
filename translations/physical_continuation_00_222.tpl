@archive 0780DC8
@size 2

script 0 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"타닥타닥타닥타닥..."
	wait
		frames = 84
	controlUnlock
	keyWait
	end
	" "
}
