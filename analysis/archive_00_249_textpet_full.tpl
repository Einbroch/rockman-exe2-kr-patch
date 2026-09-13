@archive 0784068
@size 9

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	なぁ ロックマン
	ひこうきの のりば どっちだっけ?
	"""
	keyWait
	clearMsg
	"・・・"
	waitSkip
		frames = 30
	"って、ロックマン いないんじゃんか"
	waitSkip
		frames = 30
	"\nちぇー"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	"エクスキューズミーィ!"
	waitSkip
		frames = 30
	"\nそこのボーイ どいてくだサーイ!"
	keyWait
	end
}
script 2 mmbn2 {
	msgOpen
	soundDisableTextSFX
	soundPlay
		track = 142
	"ドン!!!"
	soundEnableTextSFX
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あイテっ! なんだなんだ!?"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"オーーー! アイムソーリーーー!"
	keyWait
	clearMsg
	"""
	ボーイ!
	いまので、コレ おとしマシタネー
	"""
	keyWait
	clearMsg
	"イエース、"
	waitSkip
		frames = 30
	"""
	じゃなくて
	ハーイ、では おかえしシマース!
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
	"あ、ミニPET・・・"
	waitSkip
		frames = 30
	"どうも"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = PompadourMan
	msgOpen
	"""
	オーーー!!
	れいぎただしい グッドニホンボーイ!
	"""
	keyWait
	clearMsg
	"""
	こちらこそ ユアウェルカム
	どーいたしましてデース!!
	"""
	keyWait
	clearMsg
	"では・・・グッラック!"
	keyWait
	flagSet
		flag = 519
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ちきしょー いきなり がいじんかー
	びっくりするなあ・・・
	"""
	keyWait
	clearMsg
	"それにしても・・・ "
	waitSkip
		frames = 30
	"やれやれ"
	waitSkip
		frames = 30
	"""
	
	てつづき イロイロ たいへんだったよなー
	なんだか ノド かわいちゃったや
	"""
	keyWait
	end
}
