@archive 077CCD8
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	いよいよだね! しけん だなんて、
	なんだか きんちょう しちゃうなぁ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	だろ! オレが べんきょう キライなの
	わかるだろ?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	あ、人のこと
	自分が べんきょう しないことの
	いいわけに つかったね!
	"""
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
	んなこと ないって、
	ほら! はやく しけん うけようぜ!!
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
	"もー 熱斗くんたらー!"
	waitSkip
		frames = 30
	"""
	
	じゃ、ボク がんばるから
	オペレーション よろしくね!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
