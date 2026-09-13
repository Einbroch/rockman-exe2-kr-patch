@archive 077DAE0
@size 3

script 0 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"やっと ついたな!"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"イェーイ!"
	keyWait
	end
}
