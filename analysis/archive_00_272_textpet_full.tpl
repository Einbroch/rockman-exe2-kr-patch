@archive 07876B0
@size 8

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	きょうでニホンに かえるのかぁ
	いろんなコトがありすぎて
	アッというまだったな
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
	"""
	こんどは、ゆっくり
	かぞくみんなで
	かんこうしに きたいよね
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
	"そだな"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ところで熱斗くん ひこうきのじかん、
	だいじょうぶなの?
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
	たしか、ごぜん9じ30ぷん はつの
	ひこうきだったとおもうけど・・・
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	いまは・・・8じすぎか
	ちょうど いいじかんだね
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
	"んじゃ、くうこうに むかうか"
	keyWait
	clearMsg
	jump
		target = 7
}
