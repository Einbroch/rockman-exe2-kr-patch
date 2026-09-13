@archive 077CA80
@size 15

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ちぇー・・・
	みんな けっこう いそがしいんだなー
	"""
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
	やっぱり とつぜん だったのが
	まずかった みたいだね・・・
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
	"だなー"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"今日、これから どーする?"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そうだなー"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ん?"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotHide
	msgOpen
	soundDisableTextSFX
	"ピピピ!!"
	soundEnableTextSFX
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"メールだ、よむ?"
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
	mugshotHide
	msgOpen
	printItem
		buffer = 0
		item = 58
	"を おもちの みなさまへ"
	keyWait
	clearMsg
	"""
	オフィシャルセンターでは ただいま
	あたらしく しみんネットバトラーを
	ぼしゅう しています
	"""
	keyWait
	clearMsg
	"""
	ライセンスしけんに ごうかくすれば
	あなたも しみんネットバトラーの
	なかまいり!
	"""
	keyWait
	clearMsg
	"""
	このきかいに ぜひ!
	マリンハーバーの オフィシャルセンター
	まで おこしください!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ふーん"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ね! 行こうよこれ! 行ってみよっ!"
	keyWait
	clearMsg
	"""
	ライセンスに うかったら、
	きっと なにかいいこと あるよ!
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	んー、今日は
	すること なくなっちゃったしな・
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"\n行ってみるか!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"そうこなくっちゃ!"
	keyWait
	clearMsg
	"""
	じゃ キャンプはさ、
	あした ってことで みんなに
	れんらく まわしておくね!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
