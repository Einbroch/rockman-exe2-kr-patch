@archive 07744E4
@size 255

script 20 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ゴスペルノ ウイルスガ キタラ
	オドカシテ ヤリマス
	"""
	keyWait
	clearMsg
	"ウ~ラ~メ~シ~ヤ~"
	keyWait
	clearMsg
	"ッテ・・・"
	keyWait
	end
}
script 190 mmbn2 {
	checkFlag
		flag = 162
		jumpIfTrue = 193
		jumpIfFalse = continue
	flagSet
		flag = 162
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ナンでも かんでも
	ボクに オしツけるんだから
	"""
	keyWait
	clearMsg
	"""
	タマには、シュクダイくらい
	ジブンで したらいいのに
	"""
	keyWait
	clearMsg
	jump
		target = 191
}
script 191 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	キミかい?
	オペレータのコと ケンカして
	いえでした ナビって
	"""
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	って キミ、ボクのオペレータを
	しっているのかい?
	"""
	keyWait
	clearMsg
	"""
	え? イライをウけて ボクをサガしに?
	ナカナオり したいって?
	"""
	keyWait
	clearMsg
	"""
	フ、フン! ワルいのは アッチだよ
	そ、そう カンタンには
	カエらないんだからね!
	"""
	keyWait
	clearMsg
	"と、イいたい トコロだけど・・・"
	keyWait
	clearMsg
	"""
	わざわざ イライまでして
	サガしに キてくれた コトだし、
	ユルしてやるか
	"""
	keyWait
	clearMsg
	"でも、もうスコし ココにいるよ"
	keyWait
	clearMsg
	"""
	アイツ ナンでも
	ボクに マカせきりだから・・・
	"""
	keyWait
	clearMsg
	"""
	タマには おヤスみ させてモラっても
	バチは アタらないよね?
	"""
	keyWait
	clearMsg
	"""
	それに、アイツにとっても
	イい ベンキョウになると オモうよ
	"""
	keyWait
	clearMsg
	"""
	だから、まだしばらく カエらない
	そう いっといて
	"""
	keyWait
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"まだ カエってやんないよ!"
	keyWait
	clearMsg
	"""
	っていっておいて
	ヨロシクね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ショウニンがつかっていた
	ワゴンだ
	"""
	keyWait
	clearMsg
	"いまは、つかわれていないようだ"
	keyWait
	end
}
