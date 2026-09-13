@archive 078087C
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = CutMan
	msgOpen
	"グアッ!"
	keyWait
	clearMsg
	"や・やられちゃった みたいだね・・・"
	keyWait
	clearMsg
	"""
	で・でも、ボクに かったからって
	あんしん しちゃダメだよ・・・
	"""
	keyWait
	clearMsg
	"""
	い・いまニホンにむかっている
	シャドーマンたいちょうの つよさは
	ボクなんて くらべものにならないよ・・・
	"""
	keyWait
	clearMsg
	"いまのキミじゃ かてな・・・ぐわーっ!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	だいじょうぶ?
	ケガ、ない?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	flagSet
		flag = 580
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	うん、ありがとう
	だいじょうぶだよ
	"""
	keyWait
	clearMsg
	"""
	あのさ、
	キミが ひろった フウセン、
	だしたのは ボクなんだ
	"""
	keyWait
	clearMsg
	"""
	ただ、トモダチが ほしかった
	だけなんだけど・・・
	こんなコトにまきこんでしまって
	"""
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"ゴメン"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	きにすんなって!
	シャドーマン とかいうのを
	たおしたら またココにくるから
	"""
	keyWait
	clearMsg
	"また、ゆっくり はなそうぜ!!"
	keyWait
	clearMsg
	"""
	ロックマン、いちど うちにかえって
	じょうほうを せいりしてから
	パパのトコロにいくぞ!!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!!"
	keyWait
	end
}
