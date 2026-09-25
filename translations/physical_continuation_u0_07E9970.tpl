@archive 07E9970T
@size 2

script 0 mmbn2 {
	msgOpenQuick
	"""
	이 의뢰는
	현재 수행 중입니다
	"""
	keyWait
	clearMsg
	"""
	약속 장소
	아메롭파 보석상
	"""
	keyWait
	waitHold
}
