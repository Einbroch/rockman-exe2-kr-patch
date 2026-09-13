@archive 0748D84
@size 255

script 10 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"やっと しゅくだい おわったんだ"
	keyWait
	clearMsg
	"""
	熱斗も キャンプに 行くまえに
	ちょっとでも しゅくだい
	すすめなさいよね
	"""
	keyWait
	end
}
script 20 mmbn2 {
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 27
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 26
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 26
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 21
		upper = 21
		jumpIfInRange = 24
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 22
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	いまから、じゆうけんきゅう?
	ワタシは、もう おわらせちゃったよ
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	アジーナエリアに いくの?
	じゃあ、
	"""
	printItem
		buffer = 0
		item = 60
	"\nとったんだ!?"
	keyWait
	clearMsg
	"へぇ~ すごいな"
	keyWait
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ワタシも、"
	printItem
		buffer = 0
		item = 60
	"""
	に
	ちょうせん してみようかな?
	"""
	keyWait
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	しけんを うけようかなと
	おもって インターネットに
	いったんだけど、
	"""
	keyWait
	clearMsg
	"""
	なにか、おおきなじけんが
	おきてるみたいで、
	しけんどころじゃ なかったの
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	インターネットで
	なにが おきているのかしら?
	"""
	keyWait
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	オフィシャルセンターの
	マザーコンピュータに ダレかが
	しんにゅうした?
	"""
	keyWait
	clearMsg
	"それって、いちだいじ じゃないの!?"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"りっぱな かんようしょくぶつだ"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	フカフカのソファだ
	すわりごこちが、とてもよさそうだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	checkChapter
		lower = 4
		upper = 47
		jumpIfInRange = 226
		jumpIfOutOfRange = continue
	msgOpen
	"""
	メイルごじまんの でんしピアノ だ
	しかし、ひいている ところは
	ダレも みたコトが ない
	"""
	keyWait
	clearMsg
	"プラグイン できるように なっている"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	このイエの でんかせいひんを
	この コントロールパネルで
	そうさすることができる
	"""
	keyWait
	clearMsg
	"""
	すこしカタが ふるいので
	プラグインできない
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"おしゃれなカーテンだ"
	keyWait
	end
}
script 226 mmbn2 {
	msgOpen
	"""
	メイルごじまんの でんしピアノ だ
	しかし、ひいている ところは
	ダレも みたコトが ない
	"""
	keyWait
	clearMsg
	"""
	プラグイン できるはずだが
	そうとう つかわれて いないのだろう、
	でんげんが オフに なっている・・・
	"""
	keyWait
	end
}
