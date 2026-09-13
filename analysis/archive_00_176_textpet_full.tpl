@archive 077B844
@size 3

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! やったよ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"サンキュー! ロックマン!"
	keyWait
	clearMsg
	jump
		target = 2
}
