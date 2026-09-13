@archive 0780354
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	こ・これは・・・?
	ダレも いないよ 熱斗くん・・・
	"""
	keyWait
	clearMsg
	"""
	電脳スクエアから
	ヒトが いなくなるなんて おかしい!
	"""
	keyWait
	clearMsg
	"きっと ナニかあったに ちがいないよ!!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"いったい ナニが あったんだ?"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotHide
	msgOpen
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 268
	"カタカタカタ・・・"
	wait
		frames = 86
	controlUnlock
	soundEnableTextSFX
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん! なにか オトがする!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"だれか いるのか・・・?"
	keyWait
	clearMsg
	"""
	オトが どこから 出てるか
	さがしてくれ!!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
