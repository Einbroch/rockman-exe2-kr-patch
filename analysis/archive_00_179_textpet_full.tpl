@archive 077BE40
@size 13

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"よーし いくぜーーー!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"がんばれーっ!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"くっそーーーーーー!"
	waitSkip
		frames = 30
	"\nこんにゃろーーーーーーー!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やった!!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"よぉーし! もういっちょう!"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"このこのこのこのーーーーーー!"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やったぜ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	うん やいとちゃん 見つけた!
	熱斗くん、はやく やいとちゃんを!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"おう! あ!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	くそー! やっぱり
	ガスゆわかしきを なんとかしないと
	ダメなのかよ!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ん! でも ちょっとまって!"
	keyWait
	clearMsg
	jump
		target = 12
}
