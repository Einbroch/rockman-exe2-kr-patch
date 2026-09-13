@archive 07813F4
@size 7

script 0 mmbn2 {
	mugshotHide
	msgOpen
	"ビービービービービー!"
	keyWait
	clearMsg
	"セキュリティシステム サドウ!!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なにがおきたんだ!?"
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
	この プログラムは、アジーナこく の
	こくほう だったみたいで、
	"""
	keyWait
	clearMsg
	"""
	セキュリティシステムが、
	さどうしたんだよ!
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
	つまり、オレたち・・・
	ドロボウってわけか!?
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
	"はやく だっしゅつしよう!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"よし、プラグアウト するぞ!"
	keyWait
	clearMsg
	jump
		target = 6
}
