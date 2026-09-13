@archive 079615C
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、
	パソコンの でんのう世界に ついたよ!
	"""
	keyWait
	clearMsg
	"""
	じゃ、あそびに 行くまえに
	しゅくだいプログラム スタートさせるね!
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	みんな よりみちせずに
	いえに かえったのかな?
	"""
	keyWait
	clearMsg
	"""
	それでは、ほんじつの
	しゅくだいプログラムを かいしします
	"""
	keyWait
	clearMsg
	"""
	まずは ウイルスバスティングの
	きほんへんの ふくしゅうから
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	よくできました!!
	じゃ、つぎのもんだいに すすみましょう
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	よくできました!!
	じゃ、さいごの もんだいに
	すすみましょう!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	はい、よくできました
	さすが 光くんね
	"""
	keyWait
	clearMsg
	"""
	じゃあ 今日はここまで!
	あしたもちゃんと しゅくだいプログラムを
	きどう してね!
	"""
	keyWait
	end
}
