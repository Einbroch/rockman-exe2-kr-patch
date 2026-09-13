@archive 078D940
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	電磁波の コントロールプログラム、
	見つけたな!
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
	"うん!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ナイトマン! "
	waitSkip
		frames = 10
	"マグネットマン!"
	waitSkip
		frames = 10
	"\nフリーズマン!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"こんどは こいつらかよ!"
	waitSkip
		frames = 15
	"\nロックマン やってやろうぜ!"
	waitSkip
		frames = 30
	"\nトリプルバトルオペレーション セット!"
	keyWait
	clearMsg
	jump
		target = 4
}
