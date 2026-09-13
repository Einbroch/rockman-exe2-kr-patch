@archive 078D6AC
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだ? 今の しょうげき!?"
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
	熱斗くん!! 今ので
	電磁波のレベルが どんどん 上がってる!
	"""
	keyWait
	clearMsg
	"このままじゃ・・・"
	waitSkip
		frames = 30
	"\n5万ばい こえちゃう! キケンだよ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"キケンったって・・・行かなきゃ!!"
	waitSkip
		frames = 30
	"\nだれかが ゴスペルを とめなきゃ!!"
	keyWait
	clearMsg
	"ロックマン 行くぞ!!!"
	keyWait
	clearMsg
	jump
		target = 3
}
