@archive 074906C
@size 255

script 5 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 47
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 44
		jumpIfOutOfRange = continue
	checkFlag
		flag = 636
		jumpIfTrue = 42
		jumpIfFalse = continue
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 43
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 56
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 35
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	あんなことが おきるなんて
	ほんとに びっくりしたね・・・
	"""
	keyWait
	clearMsg
	"でも みんな ぶじで よかった・・・"
	keyWait
	end
}
script 35 mmbn2 {
	checkFlag
		flag = 576
		jumpIfTrue = 39
		jumpIfFalse = continue
	checkItem
		item = 29
		amount = 1
		jumpIfEqual = 36
		jumpIfGreater = 36
		jumpIfLess = continue
	flagSet
		flag = 576
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	おかえり 熱斗
	アメロッパで、だいかつやく
	したんだって?
	"""
	keyWait
	clearMsg
	"おつかれさま!"
	keyWait
	end
}
script 36 mmbn2 {
	flagSet
		flag = 576
	itemTake
		item = 29
		amount = 1
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	おかえり 熱斗
	アメロッパで、だいかつやく
	したんだって?
	"""
	keyWait
	clearMsg
	"おつかれさま!"
	keyWait
	clearMsg
	"おみやげ?"
	keyWait
	clearMsg
	"""
	わぁ キレイ!!
	ワタシ、こんなリングが ほしかったんだ
	"""
	keyWait
	clearMsg
	"熱斗、アリガト!"
	keyWait
	clearMsg
	jump
		target = 37
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	じゃあ、おかえしに
	コレ あげるね
	"""
	keyWait
	clearMsg
	jump
		target = 38
}
script 38 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 127
		code = P
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 127
	" "
	printCode
		buffer = 0
		code = P
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	熱斗、おつかれさま
	きょうは、ゆっくりやすんでね
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	アジーナエリアで とつぜん
	ロールと れんらくが
	とれなくなったの
	"""
	keyWait
	clearMsg
	"""
	ロールに ナニがあったんだろ・・・
	ワタシ、しんぱいで・・・
	"""
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	ロールから れんらくが あったわ
	熱斗、ロックマン ありがと
	"""
	keyWait
	clearMsg
	"""
	じしんが、ひんぱんに おこってるから
	気をつけてね
	"""
	keyWait
	end
}
script 43 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	さっきから、じしんが なんども
	おこってる
	"""
	keyWait
	clearMsg
	"""
	熱斗も、あんまり
	であるかないほうがいいよ
	"""
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗、あんまり ムチャしないでね"
	keyWait
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	じしんは、おさまったみたいね
	いちじは、どうなるかと おもったけど
	"""
	keyWait
	clearMsg
	"""
	熱斗が、なんとか してくれたんでしょ?
	ありがとね
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"なんだか むなさわぎが するの・・・"
	keyWait
	clearMsg
	"""
	熱斗、こんなときは
	あんまり ムチャ しないでよね
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ちょう にんきアニメ
	「 それいけ! ボーンいっか! 」の
	マスコットキャラ コブンにんぎょうだ
	"""
	keyWait
	clearMsg
	"""
	グリグリおめめ が、
	たまらなく あいらしい
	"""
	keyWait
	clearMsg
	"""
	こわれているらしく、
	プラグイン できなさそうだ
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	メイルの パソコンだ
	プラグインできる
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"なかはカラッポだ"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	おんなのコらしい
	おおきな すがたみカガミだ
	"""
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	このハシゴをのぼると
	メイルのベッドがある
	"""
	keyWait
	end
}
