@archive 078BF40
@size 10

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"また じけん?"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"そうなのよ、"
	waitSkip
		frames = 30
	"おかしいわねえ・・・"
	keyWait
	clearMsg
	"""
	このあいだ ニュースで
	「ゴスペルは かいめつした」
	って いってたのに
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
	"そうだね"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"メール、かいふうする?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"えっと・・・"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotHide
	msgOpen
	"「しみんネットバトラーに つぐ!」"
	keyWait
	clearMsg
	"「ゴスペルが\n いぜん かつどうを つづけている\n という ぎわくアリ"
	keyWait
	clearMsg
	" しきゅう コトブキスクエアを\n さいちょうさ せよ!」"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"そんな・・・"
	waitSkip
		frames = 30
	"\nフリーズマンを たおした・・・"
	waitSkip
		frames = 30
	"\nアレは なんだったんだろう?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	・・・このまま
	ほおっておく わけには いかないな!
	ロックマン! 行ってみようぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
