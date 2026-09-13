@archive 078BB3C
@size 16

script 0 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	・・・いじょう、
	炎山くんからの ほうこくです
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	アメロッパからの ようせいで
	炎山くんが じけんの そうさに
	むかったのは・・・
	"""
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"3日まえ ですね"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"ふむ・・・"
	waitSkip
		frames = 30
	"\nかれが てこずるほどの なんじけん、"
	waitSkip
		frames = 30
	"\nという わけか・・・"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	しかし おかしく ありませんか?
	われわれは 光さんの ムスコさんの
	かつやくで、
	"""
	keyWait
	clearMsg
	"コトブキスクエア・・・"
	waitSkip
		frames = 30
	"""
	つまり
	ゴスペルの じゅうようきょてん を
	はかい したはずでは?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	でも ネットはんざいは
	いっこうに へらない・・・
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	光さん、わたしたちは
	なにか じゅうような ことを
	みおとしているのでは ないでしょうか?
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	うん・・・もういちど
	コトブキスクエアを ちょうさ してみる
	ひつようが あるかもしれないな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	ただ ごらんのとおり、われわれの
	エースネットバトラーである 炎山くんは
	とうぶん もどってこれそうに ありません
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	そのほかの オフィシャルネットバトラーも
	ぜんかいの じけんで
	かいめつじょうたい です
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	どうでしょう? しみんネットバトラーに
	コトブキスクエアの ちょうさを
	ようせい しては?
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Scientist
	msgOpen
	"""
	ですね、じっさい
	しみんネットバトラーには 光さんの
	ムスコさんも いるわけですし・・・
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"""
	ただ、こんかいの じけんには
	今までにない 大きな わざわいを
	かんじるんだ
	"""
	keyWait
	clearMsg
	"""
	それに 熱斗には
	まだ みじゅくな ところが・・・
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = SciLabMan
	msgOpen
	"""
	しかし ミスター光!
	あなたの いうとおりなら
	これは ひじょうじたい です!
	"""
	keyWait
	clearMsg
	"""
	それに
	しみんネットバトラー ぜんいんに
	そうさを ようせい するのです
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"たしかに・・・"
	waitSkip
		frames = 30
	"""
	熱斗いがいの
	しみんネットバトラーが いらいを
	たっせいしてくれる かもしれない・・・
	"""
	keyWait
	clearMsg
	"わかった・・・"
	waitSkip
		frames = 30
	"""
	
	しみんネットバトラーへの
	ちょうさの ようせいを きょかしよう!
	"""
	keyWait
	clearMsg
	"""
	じゃあ みんな!
	それぞれの はいちに もどってくれ!
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
