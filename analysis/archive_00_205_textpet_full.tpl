@archive 077E6E4
@size 11

script 0 mmbn2 {
	soundPlayBGM
		track = 5
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	それでは げんばから
	おてがらの しょうねんの
	インタビューを おとどけします!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	それにしても おてがらでしたね!
	どうですか、ひとびとの いのちを
	たった ひとりで すくった きもちは?
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
	あ、オレ ただ ひっしだった だけで
	べつに みんなの いのちとか
	そんな すごいことは・・・
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"けんそんするなよ! 熱斗!"
	waitSkip
		frames = 30
	"\n・・・みんな みてるかー!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	そうよ!
	あなた、小さなヒーロー なのよ!
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
	"オレ・・・"
	waitSkip
		frames = 30
	"でも、炎山が・・・"
	waitSkip
		frames = 30
	"""
	
	そうだよ! 今回の ほんとうの
	ヒーローは 炎山なんです!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	んー、でも キミが いってる
	オフィシャルネットバトラーなんて
	どこにも いないよ
	"""
	keyWait
	clearMsg
	"""
	それに、
	あなたと ナビが たおしたんでしょ?
	あくの ナビ
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うん"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Ribitta
	msgOpen
	"""
	なら いいのよ!
	さ、ムネを はって!
	"""
	keyWait
	end
}
