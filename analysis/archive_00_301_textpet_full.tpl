@archive 078A910
@size 7

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"さ、いそいで インターネットにもどるか!"
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
	そうだね、じたいは いっこくを
	あらそうからね!!
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
	"じゃあ、いくぞ!!"
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"うわっ! また じしんだ!!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、メールだよ!
	よむよ
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotHide
	msgOpen
	"""
	せかいかくちをおそう しぜんさいがいの
	いきおいは、ますいっぽうです
	"""
	keyWait
	clearMsg
	"""
	ニホンでも、だんぞくてきに
	つよいじしんが かんそくされており
	かくちで、ヒナンかんこくがだされています
	"""
	keyWait
	clearMsg
	"""
	このさき、どれだけひがいが ひろがるか
	よそうができないじょうきょうです
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
