@archive 0787CF4
@size 8

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	あの、コクピットの中
	けんがく させてください
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"ああ、いいよ"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	flagSet
		flag = 519
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	すっげー! かっこいいな!
	けしきもすげー!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	どうだい、すごいだろう
	おじさん、こどものころ
	のったひこうきで、
	"""
	keyWait
	clearMsg
	"""
	コクピットをみせてもらって
	キミみたいに、かんどうしてね、
	それで、このしごとを えらんだんだ
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	へぇ~! じゃ、ゆめがかなったんだ
	かっこいいな~!
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Pilot
	msgOpen
	"""
	エアポケットに おちたみたいだ
	キミ、まだゆれはつづくかもしれないから
	じぶんの せきにもどっていたまえ
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"はい!"
	keyWait
	clearMsg
	jump
		target = 7
}
