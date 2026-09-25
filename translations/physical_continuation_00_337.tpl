@archive 079194D
@size 2

script 0 mmbn2 {
	flagSet
		flag = 592
	mugshotShow
		mugshot = Bass
	msgOpen
	"그 늙은이..."
	waitSkip
		frames = 30
	"인간 놈..."
	keyWait
	clearMsg
	"""
	아이를 조종해 뭘 하든
	내 알 바 아니다...
	"""
	keyWait
	clearMsg
	"""
	허나 허락도 없이
	내 복제를 뿌려대다니
	"""
	waitSkip
		frames = 15
	"""
	
	...용서 못 한다
	"""
	keyWait
	clearMsg
	"인간..."
	waitSkip
		frames = 15
	"""
	
	존재 가치 없는 놈들...
	"""
	keyWait
	clearMsg
	"""
	머지않아
	내 심판을 받을 때가 온다...
	"""
	keyWait
	flagSet
		flag = 593
	end
	" "
}
