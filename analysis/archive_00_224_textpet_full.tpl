@archive 0780E40
@size 18

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	パパ、たいへんだよ!
	アジーナこくが!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	熱斗、なぜ そのコトを
	しってるんだ?
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
	さっき、インターネットから
	メルとも に あいに
	アジーナスクエアにいったんだ
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	それじゃあ、アジーナを
	ほろぼしたナビが、
	ニホンにむかっているコトもしってるんだな
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うん
	オレたちにできるコト
	なにかないかな?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	いま、オフィシャルネットバトラーが
	インターネットを パトロールしているから
	熱斗は なにもしなくていいんだよ
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	でも、オレもなにかの
	やくに たちたいよ!
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
	そうか・・・
	じゃあ、パパが いま けんきゅうしている
	りろんが あるんだけど、
	"""
	keyWait
	clearMsg
	"""
	そのりろんを かんせいさせるのに
	ひつようなプログラムが あるんだが、
	それを さがしてきて ほしいんだ
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
	"そのプログラムは どこにあるの?"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	それが わからないんだ・・・
	インターネットに あるらしいんだが
	"""
	keyWait
	clearMsg
	"""
	どのエリアにあるかまでは
	わからないんだ
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
	"""
	わかったよ パパ!
	そのプログラム、さがしてくるよ!
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	熱斗、これだけは まもってほしい
	もし、どこかで れいのナビにであったら
	たたかわずに にげるんだぞ
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"・・・でも!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	いまのロックマンのせいのうでは
	たぶん、かつコトはできない
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"でも、にげるばっかじゃイヤだよ!"
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Dad
	msgOpen
	"""
	さっき いってた、
	パパのけんきゅうしている
	プログラムは、
	"""
	keyWait
	clearMsg
	"""
	ロックマンのせいのうをアップさせる
	プログラムなんだ
	"""
	keyWait
	clearMsg
	"""
	そのプログラムを かんせいさせ、
	ロックマンに くみこめば
	おおきな せんりょくになる
	"""
	keyWait
	clearMsg
	"""
	そのプログラムは
	「
	"""
	printItem
		buffer = 0
		item = 21
	"""
	」(チェンジ.バッチ)
	というんだが・・・
	"""
	keyWait
	clearMsg
	"""
	じつは、プログラムの なまえいがいは
	わからないんだ
	"""
	keyWait
	clearMsg
	"""
	オフィシャルスクエアにある
	でんのう けいじばん に
	じょうほうをもとめる カキコミをすると
	"""
	keyWait
	clearMsg
	"""
	なにか じょうほうが
	えられるかもしれないから
	いちど いってみるといい
	"""
	keyWait
	clearMsg
	"""
	ホントはパパが
	さがしたほうが いいんだが
	いまは てが はなせないんだ
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	わかってるよ パパ!
	オレたちに まかせといてよ!
	"""
	keyWait
	clearMsg
	jump
		target = 17
}
