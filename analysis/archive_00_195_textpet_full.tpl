@archive 077D53C
@size 11

script 0 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 263
	"ブ~~~~~~~ン!!!"
	wait
		frames = 60
	keyWait
	clearMsg
	soundEnableTextSFX
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	おい! 熱斗!
	さっき ひろったヤツで ハチを
	おいはらおうぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"で? どれを つかうわけ?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotHide
	msgOpen
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"ライター\n"
	option
		left = 0
		right = 0
		up = 0
		down = 2
	space
		count = 2
	"ライターと ぼうきれ\n"
	option
		left = 0
		right = 0
		up = 1
		down = 0
	space
		count = 2
	"ライターと しんぶんしと ぼうきれ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 4,
			jump = 5,
			jump = 6,
			jump = continue
		]
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	そんな ちっさい 火じゃ、
	ハチは ビビんないぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	うーん・・・それじゃ ぼうきれに
	うまく 火が つかないと おもうぜ・・・
	もっと いいほうほう ないか?
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	それだ! ぼうきれに しんぶんしを
	まきつけて、ライターで 火をつけるんだ!
	そいつで ハチを おっぱらおうぜ!
	"""
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"この この!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗! 気をつけて!"
	keyWait
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	soundPlay
		track = 133
	playerAnimate
		animation = 24
	"やたっ!"
	keyWait
	playerFinish
	playerAnimate
		animation = 7
	clearMsg
	jump
		target = 10
}
