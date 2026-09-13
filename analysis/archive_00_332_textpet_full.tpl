@archive 078FABC
@size 3

script 0 mmbn2 {
	msgOpen
	"サーバーパワー 400パーセント・・・"
	waitSkip
		frames = 30
	"\n600パーセント・・・"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Sean
	msgOpen
	"ボ・ボク・・・"
	waitSkip
		frames = 30
	"\nこんなの・・"
	waitSkip
		frames = 30
	"しらない・・・"
	keyWait
	clearMsg
	jump
		target = 2
}
