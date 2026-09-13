@archive 0789DF8
@size 10

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん、アレ!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ん? なんだ?"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = ElectopiaAirportMan
	msgOpen
	"さあ、くるんだ!!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = GaussMagnus
	msgOpen
	"ゆるして~"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"とっとと あるきやがれ!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = GaussMagnus
	msgOpen
	"ひい~"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんだか、かわいそうだね"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ああ"
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
	さ、熱斗くん
	きを とりなおして、秋原町にかえろ!
	みんなに、ただいま いいにいこうよ
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
