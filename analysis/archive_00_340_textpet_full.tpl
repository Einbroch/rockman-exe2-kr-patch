@archive 079533C
@size 7

script 0 mmbn2 {
	msgOpen
	"""
	チカラのくらい たかきものよ
	すすむのだ・・・
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
	"トビラがひらくよ・・・"
	keyWait
	end
}
script 2 mmbn2 {
	msgOpen
	textSpeed
		delay = 2
	waitSkip
		frames = 30
	"""
	だれだ・・・われのねむりを
	さまたげるものは・・・
	"""
	keyWait
	clearMsg
	flagSet
		flag = 318
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	textSpeed
		delay = 1
	"だ、だれだ!?"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = PharaohMan
	msgOpen
	"""
	わがなは、ファラオマン・・・
	このちを しゅごするモノなり
	"""
	keyWait
	clearMsg
	"""
	われの ことわりなしに
	このせいなるちを けがしたつみ
	"""
	keyWait
	clearMsg
	"""
	キサマの いのちをもって
	あがなってもらうぞ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、くるぞ!!
	バトルオペレーション! 
	"""
	waitSkip
		frames = 30
	"セット!"
	keyWait
	jump
		target = 6
}
