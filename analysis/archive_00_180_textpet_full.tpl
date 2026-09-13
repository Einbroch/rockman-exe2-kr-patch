@archive 077BF94
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん! いまので、
	こっちのガスが なくなった!
	かんきせんの プログラムが ある!
	"""
	keyWait
	clearMsg
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん! じゃ それを!"
	keyWait
	clearMsg
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"あっ!"
	soundPlayBGM
		track = 34
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = AirMan
	msgOpen
	"ホアーーーー"
	waitSkip
		frames = 30
	"\nだれだーーー、こんなことするのはー"
	waitSkip
		frames = 30
	"\nホアーーーー!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん! あいつが
	このガスの げんいんみたいだ!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
