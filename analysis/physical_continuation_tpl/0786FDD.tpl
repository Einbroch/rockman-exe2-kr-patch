@archive 0786FDD
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = KnightMan
	msgOpen
	"・・・"
	keyWait
	clearMsg
	"""
	ロックマン とやら・・・あいにくだが
	それがしは ヒメのことばを うたがう
	プログラムは もちあわせておらん
	"""
	keyWait
	clearMsg
	"""
	たとえ ヒメが まちがっていようとも
	それがしは ただ ヒメをおまもりするのみ
	"""
	waitSkip
		frames = 30
	"\nそれが ナイトのみち・・・"
	keyWait
	clearMsg
	"いざ・・・"
	waitSkip
		frames = 30
	"まいる!"
	keyWait
	end
	"  "
}
