@archive 0795B14
@size 10

script 0 mmbn2 {
	mugshotShow
		mugshot = PlanetMan
	msgOpen
	"""
	グググ・・・
	ワタシヲ タオシテモ
	イズレ、ドコカデ ダレカガ
	"""
	keyWait
	clearMsg
	"""
	カナラズヤWWWヲ
	フッコウサセルコトデショウ!!
	"""
	keyWait
	clearMsg
	"""
	キョーーーーーーーー!!
	キョキョキョキョキョキョキョ
	"""
	waitHold
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	まさか、WWWのざんとうが
	こんなトコロにいたなんて・・・
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
	"""
	なーに、またでてきたら
	また つぶしてやるぜ!
	"""
	keyWait
	clearMsg
	"""
	オレとロックマンがいる かぎり
	なんかい でてきたってムダだからな!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"そうだね! 熱斗くん!!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotHide
	msgOpen
	"グウウウウウウ"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ハラがへってきちゃった"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"もう、熱斗くんは コレだから"
	keyWait
	clearMsg
	"それじゃあ、プラグアウトする?"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そだな・・・"
	keyWait
	clearMsg
	"""
	そういや、たしか このエリアは、
	プラグアウトできなかったんじゃ
	なかったっけ?
	"""
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
	そっか それじゃ
	もときたミチをもどるしかないね
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
