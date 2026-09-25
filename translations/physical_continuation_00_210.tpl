@archive 077F863
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	잠깐 네 PET을
	보여 줄 수 있을까?
	"""
	keyWait
	clearMsg
	"""
	그럼
	데이터를 조회해 볼게
	"""
	keyWait
	clearMsg
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	mugshotAnimate
		animation = 0
	"타닥타닥타닥"
	wait
		frames = 86
	controlUnlock
	keyWait
	clearMsg
	soundEnableTextSFX
	mugshotAnimate
		animation = 1
	"""
	으음...
	아직 경험이 부족한 것 같네
	"""
	keyWait
	clearMsg
	"""
	A 라이선스를 따려면、
	시민 넷배틀러로서 사건을
	몇 건 해결해야 해
	"""
	keyWait
	clearMsg
	"""
	사건을 해결하면
	의뢰인에게서 이곳으로
	연락이 오게 돼 있어、
	"""
	keyWait
	clearMsg
	"""
	그걸 바탕으로 이쪽에서
	응시 자격이 있는지
	판단하는데...
	"""
	keyWait
	clearMsg
	"그러게..."
	keyWait
	clearMsg
	"""
	그럼、 지금 내가 맡고 있는
	의뢰가 3건 있는데
	그걸 너에게 맡기지
	"""
	keyWait
	clearMsg
	"""
	다 만만찮은 의뢰들이지만
	경험을 쌓기엔 딱 좋아
	"""
	keyWait
	clearMsg
	"""
	의뢰 게시판에는、
	특별 임무라는 형태로
	올려 둘게
	"""
	keyWait
	clearMsg
	"경험을 쌓고 다시 여기로 오게"
	keyWait
	clearMsg
	"""
	다만、
	너무 무리하면 안 된다
	"""
	keyWait
	end
	"   "
}
