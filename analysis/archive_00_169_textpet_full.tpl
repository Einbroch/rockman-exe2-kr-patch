@archive 077AE48
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ヘエ!
	2つを モってキましたね!
	すごいですね!
	"""
	keyWait
	clearMsg
	"・・・では、ヤクソクドオり、\n"
	printItem
		buffer = 0
		item = 58
	"を あげましょう"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 58
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerReset
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	それを モっていると
	ライセンスシケンの アンナイが
	オフィシャルセンターから きます
	"""
	keyWait
	clearMsg
	"""
	ガンバって、コンドは
	ライセンスを ゲットしてクダさい!
	"""
	keyWait
	clearMsg
	"""
	・・・あと
	タダイマ ゲンテイプレゼントチュウの
	これを あげましょう!
	"""
	keyWait
	clearMsg
	"""
	インストール(プログラムを PETに
	入れて、つかえるようにすること) も
	おマカせ クダさい・・・
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotHide
	msgOpen
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"""
	PETに、
	「レギュラーチップシステム」
	が インストールされた!!
	"""
	playerFinish
	playerReset
	keyWait
	clearMsg
	jump
		target = 4
}
