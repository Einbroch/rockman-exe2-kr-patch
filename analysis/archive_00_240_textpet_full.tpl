@archive 078219C
@size 20

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"とびらかいじょ プログラムきどう!"
	keyWait
	clearMsg
	"""
	これで、トビラが かいじょ
	されたはずだよ
	"""
	keyWait
	end
}
script 1 mmbn2 {
	mugshotHide
	msgOpen
	"""
	おまえらを
	さきに いかすわけにはいかん・・・
	"""
	keyWait
	clearMsg
	"ここで いきたえるのだ!!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	くそ! こんなところで
	グズグズ しているヒマは
	ないってのに!
	"""
	keyWait
	end
}
script 3 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"ちょっとマった!"
	wait
		frames = 60
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"オレたちが アイテだ!!"
	keyWait
	clearMsg
	"""
	ロックマン!
	ここは、オレたちにまかせろ!
	キミは チカラを タクワえてオくんだ
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	mugshotAnimate
		animation = 0
	"コクッ"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"イったか・・・"
	keyWait
	clearMsg
	"ゲホッ!"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"ダイジョウブですか!・・・"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	さっきの タタカいで
	かなり、ガタが キてるんじゃないのか
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	オマエらも ヒトのこと
	イえんだろ・・・
	"""
	keyWait
	clearMsg
	"""
	それにしても・・・
	そのナビ・・・ツヨいぜ・・・
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	タブン、まともにやっちゃ
	カてないでしょうね・・・
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	カつための ホウホウは
	ヒトツだな・・・
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"ああ、それしか ナいようだな"
	keyWait
	clearMsg
	"""
	マザーコンピュータのタメに
	シねるのなら ホンモウ!!
	"""
	keyWait
	clearMsg
	"でっかく ハジけようぜ!!"
	soundPlayBGM
		track = 16
	keyWait
	clearMsg
	"フルパワーモード ハツドウ!!"
	keyWait
	clearMsg
	flagClear
		flag = 626
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"フルパワーモードって・・・"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"まさか あなた たち!?"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	パワーを オーバーロードさせて
	じばく するきか!?
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"セワになったな! オヤジ!"
	keyWait
	clearMsg
	jump
		target = 17
}
script 17 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"アトは、ロックマンに タクしたわよ!"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"アバヨ!!"
	keyWait
	flagSet
		flag = 626
	end
}
