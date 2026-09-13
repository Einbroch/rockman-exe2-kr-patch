@archive 0795FE8
@size 5

script 0 mmbn2 {
	mugshotShow
		mugshot = Bass
	msgOpen
	"しょうじき おどろいたぞ"
	keyWait
	clearMsg
	"""
	オモテのせかいで
	オレに てきずをおわせるナビが
	いたとは・・・
	"""
	keyWait
	clearMsg
	"""
	キサマとなら ホンキで
	たたかえそうだ・・・
	"""
	keyWait
	clearMsg
	"""
	また あおう
	「きょうしゃの はどう」を
	もつものよ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"すげーヤツだったな・・・"
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
	フォルテ・・・
	「きょうしゃ」をもとめ
	でんのうせかいを さまようもの・・・
	"""
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
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
	なに くらいカオしてんだよ!
	「しんの きょうしゃ」か
	なんだかしらないけど
	"""
	keyWait
	clearMsg
	"""
	オレたちのコンビは まけないぜ!!
	どんなヤツが あいてでもな!!
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
