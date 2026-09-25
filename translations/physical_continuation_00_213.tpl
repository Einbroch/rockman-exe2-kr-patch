@archive 077FBD7
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	네네、 록맨.EXE 씨
	맞으시죠
	"""
	keyWait
	clearMsg
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	"타닥타닥"
	wait
		frames = 91
	controlUnlock
	"\n"
	soundPlay
		track = 139
	"삐ーーー!"
	keyWait
	clearMsg
	soundEnableTextSFX
	"등록 완료!"
	keyWait
	clearMsg
	"""
	이제 언제든 시험을
	보실 수 있습니다
	"""
	keyWait
	clearMsg
	"""
	시험에 도전하고 싶을 때는
	저에게 말을 걸어 주세요
	"""
	keyWait
	end
	"   "
}
