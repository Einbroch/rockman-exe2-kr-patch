@archive 077D254
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"あ! バスが きたみたいよ!"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"""
	それじゃあ
	キャンプに しゅっぱつ だぜーー!!
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"オーーーー!!!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"イェーイ!!"
	keyWait
	clearMsg
	jump
		target = 4
}
