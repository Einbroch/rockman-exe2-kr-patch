@archive 076CD80
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ヒャーー、イソガシイデース!!"
	keyWait
	clearMsg
	"""
	ココニハ セカイジュウ カラ
	サマザマナ ジョウホウガ
	ヒッキリナシニ オクラレテキマス
	"""
	keyWait
	clearMsg
	"""
	ワタシタチハ オフィシャルノ
	ミナサンガ ホシイ ジョウホウヲ
	スグニ トリダセルヨウニ
	"""
	keyWait
	clearMsg
	"""
	セイリ シタリ、ケンサク シタリ
	スルノガ ワタシタチノ シゴトデス
	"""
	keyWait
	clearMsg
	"""
	ト、イッテイル アイダニモ
	アラタナル ジョウホウガ!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	エーット、3ネン マエノ
	ネットワーク ハンザイノ シリョウハ
	ドコダーー?
	"""
	keyWait
	clearMsg
	"チョット マッテ クダサイネーー"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コノ メガミゾウハ、
	マイニチ アメロッパノ ヘイワヲ
	ミマモッテイマス・・・
	"""
	keyWait
	clearMsg
	"""
	ツマリ・・・オット、コレイジョウハ
	イエマセン・・・
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	3ネン マエの ネットワーク ハンザイの
	シリョウ、ハヤく ダしてくれよ
	"""
	keyWait
	end
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
	checkGiveItem
		item = 117
		amount = 1
		jumpIfAll = continue
		jumpIfNone = 231
		jumpIfSome = 231
	flagSet
		flag = 1421
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	サブチップ「
	"""
	printItem
		buffer = 0
		item = 117
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 231 mmbn2 {
	"「"
	printItem
		buffer = 0
		item = 117
	"""
	」が
	いっぱいで もうもてない!
	"""
	keyWait
	end
}
