@archive 077F6E0
@size 4

script 0 mmbn2 {
	mugshotHide
	msgOpen
	"""
	こちらは、
	ニホンセキュリティセンター です
	"""
	keyWait
	clearMsg
	"""
	ここは Aライセンスを
	もっているかた いがいは
	おとおし することが できません
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、ここを とおるには
	Aライセンスが いるんだって
	"""
	keyWait
	clearMsg
	"""
	ライセンスって オフィシャルセンターで
	テスト うけないと いけないんだよ
	"""
	keyWait
	clearMsg
	"""
	たいへんそうだから、
	今回は アジーナこくを あきらめて
	ほかのクニを しらべない?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ダメ!!
	テスト うけてでも アジーナに 行くの!
	
	"""
	mugshotAnimate
		animation = 0
	"(ごちそう! ごちそう! ごちそう!)"
	keyWait
	clearMsg
	jump
		target = 3
}
