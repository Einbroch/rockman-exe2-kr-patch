@archive 0788AD8
@size 12

script 0 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	ファーストクラスのみなさん
	このへやにキケンな ドクグモが、います!
	"""
	keyWait
	clearMsg
	"""
	これから、とらえますので、
	ワタシのしじどおりに うごいてください!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = BlackMan
	msgOpen
	"なんだって?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NetopiaOldWoman
	msgOpen
	"""
	それは、ほんとかね?
	おお、かみよ~
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	よし、これであとは
	ヤツがくるのを まつだけだ
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"きた!!"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"今だ!!"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	playerAnimate
		animation = 24
	"やたっ!!"
	keyWait
	playerFinish
	playerReset
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	ほかくせいこう!!
	みなさん、おさわがせしました!
	"""
	keyWait
	clearMsg
	"ごきょうりょくかんしゃします!!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	flagSet
		flag = 519
	mugshotShow
		mugshot = Lan
	msgOpen
	"おじさん、ありがとう!!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"なあに、これくらい あさめしまえよ"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	さあて、クモもぶじつかまったことだし
	ざせきにもどるか!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
