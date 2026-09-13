@archive 076AA18
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ハァ~、オヤスミチュウハ
	ジュギョウガ ナイノデ
	タイクツデス
	"""
	keyWait
	clearMsg
	"""
	カキ コウシュウ デモ
	アリマセンカネ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	イツモハ ニギヤカナ
	キョウシツ デスケド
	"""
	keyWait
	clearMsg
	"""
	ヤスミニ ハイルト
	チョッピリ サミシイデスネ
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	ちぃっ! ミつかっちまったか
	オマエら、ヤっちまえ!!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 533
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 4
		field = 0
		music = 27
}
script 230 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1381
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 23
		code = L
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 23
	" "
	printCode
		buffer = 0
		code = L
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
