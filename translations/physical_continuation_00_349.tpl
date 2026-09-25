@archive 07962BB
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	졌어요?
	어쩔 수 없네요...
	"""
	keyWait
	clearMsg
	"""
	그럼、 배틀 처음부터
	한 번 더 다시 해 봅시다
	"""
	keyWait
	clearMsg
	"될 때까지 계속할 거예요~!"
	keyWait
	end
	"   "
}
