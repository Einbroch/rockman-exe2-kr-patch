@archive 078D604
@size 2

script 0 mmbn2 {
	msgOpen
	"""
	サーバー00 ニ スベテノ
	サーバーパワーヲ シュウケツ シマシタ
	・・・
	"""
	keyWait
	clearMsg
	"「バグユウゴウ」 "
	waitSkip
		frames = 30
	"スタンバイOK・・・"
	keyWait
	end
}
