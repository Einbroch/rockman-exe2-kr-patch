@archive 077DB06
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	잘 들어、 캠프라고 하면
	바비큐부터 시작하는 거다!
	다들 준비에 들어가!
	"""
	keyWait
	clearMsg
	"그럼、 해산!"
	keyWait
	end
	" "
}
