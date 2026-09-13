@archive 078D28C
@size 4

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	わ! なんだよ それ?
	上のほうに 見えてるの マンションか?
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"そうみたい・・・"
	keyWait
	clearMsg
	"""
	電磁波いじょうの せいで
	こっちと そっちの 世界が
	いりみだれてるんだと おもう
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
	"しんじらんねぇな・・・"
	keyWait
	clearMsg
	"""
	とにかく、
	ネットワークの いじょうを なおして
	さいじょうかいに のりこもうぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
