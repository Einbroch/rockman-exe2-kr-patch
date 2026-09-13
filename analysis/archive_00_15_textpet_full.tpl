@archive 075074C
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 56
		upper = 255
		jumpIfInRange = 56
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 38
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 19
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkFlag
		flag = 604
		jumpIfTrue = 14
		jumpIfFalse = continue
	checkChapter
		lower = 9
		upper = 9
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ここは しけんかいじょうよ"
	keyWait
	clearMsg
	"""
	どこでも いいから プラグインして
	ナビを でんのう世界に おくりこんでね
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 51
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 39
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 19
		jumpIfInRange = 31
		jumpIfOutOfRange = continue
	checkChapter
		lower = 9
		upper = 9
		jumpIfInRange = 11
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	きょうは いよいよ
	Sライセンスの しけんだぜ!
	もえるなあーーー!!!
	"""
	keyWait
	end
}
script 2 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 52
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 19
		jumpIfInRange = 32
		jumpIfOutOfRange = continue
	checkChapter
		lower = 9
		upper = 9
		jumpIfInRange = 12
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ウチの だんなが
	ネットバトル からっきしな もんだからさ
	"""
	keyWait
	clearMsg
	"""
	Bライセンスでも とっておけば
	もしものときに かぞくを まもれるかと
	おもってさ
	"""
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 53
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 20
		jumpIfInRange = 41
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 19
		jumpIfInRange = 33
		jumpIfOutOfRange = continue
	checkFlag
		flag = 607
		jumpIfTrue = 15
		jumpIfFalse = continue
	checkChapter
		lower = 9
		upper = 9
		jumpIfInRange = 13
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	キミみたいな こどもも
	Bライセンスの しけんを うけるの?
	"""
	keyWait
	clearMsg
	"こりゃー まけらんないぞー!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ここは しけんかいじょうよ"
	keyWait
	clearMsg
	"""
	キミ どうしたの?
	しけん中 じゃないの?
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	さすが Sライセンスの しけんは
	てごわいぜーーー!!!
	"""
	keyWait
	clearMsg
	"""
	そら!
	キャノンA キャノンB キャノンC!
	ゼータキャノン はつどう だぜーーー!!
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	なんど やっても
	サバイバルバトルに かてないんだ・・・
	"""
	keyWait
	clearMsg
	"""
	やっぱ おばさんに ライセンスしけんは
	ムリ なのかねぇ・・・
	"""
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"ボクは もう3問目まで いったぞ!"
	keyWait
	clearMsg
	"""
	キミは? まだ 2問目かい?
	2問目は けっこう ハマったぞー
	"""
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	ごうかく おめでとう!
	こんどは Aライセンスの しけんで
	あいましょう!
	"""
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"しけん おちた・・・"
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"こんどは、"
	printItem
		buffer = 0
		item = 60
	"""
	に
	チャレンジするの?
	"""
	keyWait
	clearMsg
	"がんばってね!"
	keyWait
	end
}
script 31 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	くうううううっ!
	Sライセンスは オレには
	ムリなのかーー!?
	"""
	keyWait
	clearMsg
	"""
	いいや! あきらめたらダメだ!!
	ガンバれ オレ! まけるな オレ!
	"""
	keyWait
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ふう! あと もうちょっとで
	Bライセンスを ゲットできそうだよ!
	"""
	keyWait
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	あと、いっかいだけ ちょうせんして
	つぎ おちたら あきらめよう・・・
	"""
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"ごうかくしたの? おめでとう!!"
	keyWait
	clearMsg
	"キミの ねんれいで"
	printItem
		buffer = 0
		item = 60
	"""
	を
	もってるのは、なかなか スゴいコトよ
	"""
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	うがぁぁぁぁぁぁぁ!
	ダメだぁぁぁぁぁぁ!
	"""
	keyWait
	clearMsg
	"なんの、もういっちょーーー!"
	keyWait
	clearMsg
	"""
	はわぁぁぁぁぁぁぁぁ!
	ダメだぁぁぁぁぁぁ!
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	おばさん、しけん おちちゃったよ
	あと、もうちょっとだったんだけどね
	"""
	keyWait
	clearMsg
	"""
	でも、コツは つかんだから
	つぎ うけるときは
	ぜったいごうかくだよ!
	"""
	keyWait
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	keyWait
	clearMsg
	"""
	あと、いっかいだけ
	うけてみよう・・・
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	できるだけ、おおくの ゆうしゅうな
	じんざいを あつめるために
	しけんべやを かいほうしたの
	"""
	keyWait
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = TannedMan
	msgOpen
	"""
	や、やったーーーーっ
	つ、ついに ついにうかった!
	"""
	keyWait
	clearMsg
	"ねんがんのSライセンス!!"
	keyWait
	clearMsg
	"""
	あきらめずに つづけてきたかいが
	あったぜ!!!
	"""
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = Woman
	msgOpen
	"""
	ボウヤ、やったよ!
	おばさん Bライセンスうかったよ!
	"""
	keyWait
	clearMsg
	"""
	でも、Bライセンスを とったら
	よくが でてきちゃったわ
	Aライセンスも うけちゃおうかしら
	"""
	keyWait
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = Man
	msgOpen
	"""
	ダ、ダメだ~~~・・・
	またおちた・・・
	"""
	keyWait
	clearMsg
	"オレ さいのう ないのかな?"
	keyWait
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = OfficialWoman
	msgOpen
	"""
	インターネットから ちょくせつ
	しけんを うけに こられるように
	なったものだから
	"""
	keyWait
	clearMsg
	"""
	みんな、このへやを
	つかわなくなってしまったの
	"""
	keyWait
	clearMsg
	"すこし、さみしいきが するけど"
	keyWait
	clearMsg
	"""
	いまの ニホンには
	ひとりでも おおくのゆうしゅうな
	ネットバトラーを みつけだすコトが
	"""
	keyWait
	clearMsg
	"""
	いちばん じゅうようなコトだから
	さみしいなんて いってられないわね
	"""
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = OldWoman
	msgOpen
	"""
	今まで ネットバトラーには
	たいそう せわに なりました・・・
	"""
	keyWait
	clearMsg
	"""
	ライセンスしけんを うけて
	こんどは ワタシが
	みんなを たすけるばん ですじゃ
	"""
	keyWait
	clearMsg
	"そりゃ! プラグイン!"
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	おおきなパネルだ・・・
	ここからプラグインすると、
	"""
	keyWait
	clearMsg
	"""
	しみんネットバトラーの
	しけんかいじょうに、
	いくことができる
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	おおきなパネルだ・・・
	ここからプラグインすると、
	"""
	keyWait
	clearMsg
	"""
	しみんネットバトラーの
	しけんかいじょうに、
	いくことができる
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	おおきなパネルだ・・・
	ここからプラグインすると、
	"""
	keyWait
	clearMsg
	"""
	しみんネットバトラーの
	しけんかいじょうに、
	いくことができる
	"""
	keyWait
	end
}
