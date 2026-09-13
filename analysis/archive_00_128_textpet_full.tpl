@archive 076E1C0
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	シッテマスカ?
	HPハ、バトルガ オワッタトキノ
	ソノママ ナノデス
	"""
	keyWait
	clearMsg
	"""
	バトルチュウニ リカバリーヲ ツカッタリ
	バトルノアイマニ サブチップヲ ツカッテ
	カイフク シテオクト アンシンデス
	"""
	keyWait
	clearMsg
	"""
	HPハ ガメンノ ヒダリウエニ
	ヒョウジサレテイテ、イツデモ ミレマス
	"""
	keyWait
	clearMsg
	"""
	イマハ、ボクガ
	カイフク シテオイテ アゲマスネ
	"""
	waitSkip
		frames = 10
	"・"
	waitSkip
		frames = 10
	"・"
	waitSkip
		frames = 10
	"・"
	keyWait
	clearMsg
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	startHeal
	"""
	ロックマンの HPが、
	MAXに なった!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 3
		upper = 255
		jumpIfInRange = 5
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	さっき、
	オオきいナビと オンナのコのナビが
	オフィシャルスクエアのホウに イってたよ
	"""
	keyWait
	clearMsg
	"""
	オフィシャルスクエアなら
	このシタ すぐのトコロさ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	「バスティングレベル」は
	どれだけウマく ウイルスを タオしたか
	を アラワします
	"""
	keyWait
	clearMsg
	"""
	ウイルスを ハヤく タオしたり
	まとめて タオしたりすると、
	バスティングレベルは タカくなるようです
	"""
	keyWait
	clearMsg
	"""
	そして バスティングレベルが タカいと
	ウイルスから チップデータを
	ゲット しやすいです
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"へーエ、"
	printItem
		buffer = 0
		item = 58
	"""
	の シケンを
	うけてるんだー
	"""
	keyWait
	clearMsg
	"「"
	printItem
		buffer = 0
		item = 1
	"""
	」 と
	「
	"""
	printItem
		buffer = 0
		item = 2
	"""
	」 ねー
	ボクは シらないなー
	"""
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = GutsMan
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 1
	"""
	」は どこでガッツ!
	「
	"""
	printItem
		buffer = 0
		item = 2
	"」は どこでガッツ?"
	keyWait
	end
}
script 15 mmbn2 {
	checkItem
		item = 6
		amount = 1
		jumpIfEqual = 17
		jumpIfGreater = 17
		jumpIfLess = continue
	checkItem
		item = 5
		amount = 1
		jumpIfEqual = 17
		jumpIfGreater = 17
		jumpIfLess = continue
	checkFlag
		flag = 602
		jumpIfTrue = 16
		jumpIfFalse = continue
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	なんだ ボウズ!
	ムヤミにチカヅくと デリートしちまうぞ!
	"""
	keyWait
	end
}
script 16 mmbn2 {
	flagSet
		flag = 606
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"「"
	printItem
		buffer = 0
		item = 5
	"」?"
	waitSkip
		frames = 30
	"""
	
	チッ! バレちまったか!
	オメエら! ヤっちまいな!
	"""
	keyWait
	clearMsg
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 0
		field = 0
		music = 27
}
script 17 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	チ! コゾウだと オモって
	ユダン しちまったゼ・・・
	"""
	keyWait
	end
}
script 18 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	コノサキハ コトブキエリア デスガ
	セツゾク コウジチュウニ ツキ
	ススムコトハ デキマセン
	"""
	keyWait
	end
}
script 19 mmbn2 {
	checkChapter
		lower = 10
		upper = 72
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkItem
		item = 6
		amount = 1
		jumpIfEqual = 20
		jumpIfGreater = 20
		jumpIfLess = continue
	checkItem
		item = 5
		amount = 1
		jumpIfEqual = 20
		jumpIfGreater = 20
		jumpIfLess = continue
	checkFlag
		flag = 602
		jumpIfTrue = 22
		jumpIfFalse = continue
	checkChapter
		lower = 9
		upper = 9
		jumpIfInRange = 21
		jumpIfOutOfRange = 20
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	デカオという ヒトの
	Pコードを モっていると
	スクエアに すぐイけて ベンリですね
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	コマっている
	ナビを おサガしですか・・・
	"""
	keyWait
	clearMsg
	"""
	こちらのホウでは ミてませんね
	ガラの ワルそうな ナビなら
	さっき ミましたけど
	"""
	keyWait
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	ガラの ワルそうな ナビが
	むこーうのホウに いて
	どうも トオりヌけにくいんですよ・・・
	"""
	keyWait
	end
}
script 25 mmbn2 {
	checkChapter
		lower = 18
		upper = 18
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ウエの ミチは、コトブキエリアに
	ツナがってるんだって
	"""
	keyWait
	clearMsg
	"""
	イってみたいんだけど
	でも、まだ コウジチュウで
	イけないんだよね~
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ウエのミチの コウジが
	オワったらしいんだ イってみようかな~
	"""
	keyWait
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	なんやコラ! なんやコラ!
	やんのかコラ!
	"""
	keyWait
	clearMsg
	"""
	やんのか? やんのか?
	アイテになったるで!
	"""
	keyWait
	clearMsg
	"""
	ワシをダレか ワカッてんのやろなぁ!
	インターネットゴロツキ2きょうだいの
	ジナンさまよ!
	"""
	keyWait
	clearMsg
	"""
	アニキは ホカのエリアをアラしていて
	イマはいないが、
	"""
	keyWait
	clearMsg
	"""
	オマエくらいなら、アニキやオレが
	テを クダすまでもないわ
	"""
	keyWait
	clearMsg
	"ホレ! コイツらがあいてじゃ!"
	keyWait
	clearMsg
	flagSet
		flag = 548
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 6
		field = 0
		music = 27
}
script 36 mmbn2 {
	msgOpen
	"""
	あくとうナビは
	なにかを おとして
	にげていった
	"""
	keyWait
	clearMsg
	playerAnimate
		animation = 24
	itemGive
		item = 16
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 16
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	end
}
script 37 mmbn2 {
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	せっかく ココまで コれたけど
	ヒトリで イくのは、ちょっと
	フアンだな~
	"""
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	う~ん コトブキエリアに
	イくのは またコンドに しようかな?
	"""
	keyWait
	end
}
script 50 mmbn2 {
	mugshotShow
		mugshot = OfficialNavi
	msgOpen
	"""
	このエリアは トクに
	ナニもナいようだな・・・
	"""
	keyWait
	clearMsg
	"しかし ユダンは キンモツ!"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"タダイマ カイセンノ テンケンチュー"
	keyWait
	clearMsg
	"イジョウ ナーシ!"
	keyWait
	end
}
script 70 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"やぁ キョウも ヘイワですねえ!"
	keyWait
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	アメロッパでは、ケッコウ
	オオきな ジケンがオこった
	らしいですよ
	"""
	keyWait
	end
}
script 80 mmbn2 {
	checkItem
		item = 34
		amount = 1
		jumpIfEqual = 92
		jumpIfGreater = 92
		jumpIfLess = continue
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"おかしいなぁ・・・"
	keyWait
	clearMsg
	"""
	アイツ、ヨウジが すんだら
	ここに モドってクるハズ なんだけど
	もう イチジカンも タつんだ・・・
	"""
	keyWait
	clearMsg
	"コトブキエリアで ナニか あったのかな?"
	keyWait
	clearMsg
	"""
	キミ、イソいでる みたいだけど
	ちょっと ミてキてくれない?
	"""
	keyWait
	end
}
script 81 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 95
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 90
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 70
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ナンだか、アチコチでユクエ フメイシャが
	ゾクシュツしてる みたいですね
	"""
	keyWait
	end
}
script 82 mmbn2 {
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 91
		jumpIfOutOfRange = continue
	checkChapter
		lower = 48
		upper = 55
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	キミはこのコオリが コワせるんだね
	なら、おネガいがアるんだ
	"""
	keyWait
	clearMsg
	"""
	デキるカギり、コワせるコオリは
	スベて コワしてホしい
	"""
	keyWait
	clearMsg
	"""
	ナゼなら、このコオリが
	ハッしているデンパは、
	"""
	keyWait
	clearMsg
	"""
	あるトクテイのプログラムを
	こおりついたヨウに フリーズさせる
	チカラを モっているみたいなんだ
	"""
	keyWait
	clearMsg
	"""
	ハヤくコワさないと
	タイヘンなコトになるかもしれないよ
	"""
	keyWait
	end
}
script 90 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	ゲンジツセカイの ヒガイは
	ますます カクダイしているようです
	"""
	keyWait
	end
}
script 91 mmbn2 {
	mugshotShow
		mugshot = PurpleNavi
	msgOpen
	"""
	ワタシの オペレータが
	ヒナン するそうです・・・
	プラグアウト しないと
	"""
	keyWait
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	mugshotPalette
		palette = 1
	msgOpen
	"""
	コトブキエリアで
	オレの トモダチ ミなかった?
	"""
	keyWait
	clearMsg
	"コオリに? ウヘェ!"
	keyWait
	clearMsg
	"""
	オレも そうなっちゃ、かなわないな
	プラグアウトしよっと!
	"""
	keyWait
	end
}
script 95 mmbn2 {
	mugshotShow
		mugshot = NormalNavi
	msgOpen
	"""
	コオリが なくなって
	コオリに とじこめられたヒトも
	タスかったようです
	"""
	keyWait
	end
}
script 100 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	デデデデターーーー!
	ゴスペルノ ウイルスーーーーー!
	"""
	keyWait
	clearMsg
	"""
	オタスケクダサイ オタスケクダサイ
	ボクハ タダノ プログラム デス
	"""
	keyWait
	clearMsg
	"""
	ケイサン ダッテ タマニ マチガイマス
	コワシテモ アンマリ トクジャ ナイデス
	"""
	keyWait
	clearMsg
	"・・・エ? チガウノ?"
	keyWait
	clearMsg
	"ホッ"
	keyWait
	end
}
script 190 mmbn2 {
	flagSet
		flag = 143
	mugshotShow
		mugshot = EvilNavi
	msgOpen
	"""
	おいおいおい なんだ?
	オレさまにインネンつけるキか?
	"""
	keyWait
	clearMsg
	"""
	オレさまのウイルスこうげきで
	デリートしてやろうか?
	ああん?
	"""
	keyWait
	clearMsg
	"""
	ナニ? イライをウけてオレを?
	ちいっ!! バレちまったらしかたねえ!
	これでもくらえ!
	"""
	keyWait
	clearMsg
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 47
		field = 0
		music = 27
}
script 210 mmbn2 {
	mugshotHide
	msgOpen
	"ロックマンは、コオリをこわした!"
	keyWait
	clearMsg
	flagSet
		flag = 586
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 14
		field = 65
		music = 27
}
script 211 mmbn2 {
	checkItem
		item = 35
		amount = 1
		jumpIfEqual = continue
		jumpIfGreater = continue
		jumpIfLess = 212
	mugshotHide
	msgOpen
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 35
	"""
	」
	を つかった!
	"""
	keyWait
	clearMsg
	"こおりが おとを たてて くだけちる!"
	keyWait
	clearMsg
	flagSet
		flag = 587
	wait
		frames = 18
	"""
	くだけた こおりの中から
	ウイルスが あらわれた!
	"""
	keyWait
	clearMsg
	flagSet
		flag = 635
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 15
		field = 65
		music = 27
}
script 212 mmbn2 {
	mugshotHide
	msgOpen
	"""
	ロックマンの チカラだけでは、
	この こおりは、こわせないようだ!
	"""
	keyWait
	end
}
script 221 mmbn2 {
	checkItem
		item = 81
		amount = 1
		jumpIfEqual = 222
		jumpIfGreater = 222
		jumpIfLess = continue
	msgOpen
	"""
	デカオの かんりする
	セキュリティキューブだ
	"""
	keyWait
	clearMsg
	"""
	パスコードが ないので
	キューブを かいじょ することが
	できない・・・
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	デカオの かんりする
	セキュリティキューブだ
	"""
	keyWait
	clearMsg
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 81
	"""
	」
	を つかった!!
	"""
	keyWait
	clearMsg
	"""
	セキュリティキューブが
	かいじょ された!!
	"""
	keyWait
	msgClose
	flagSet
		flag = 27
	wait
		frames = 102
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ヒダリ デカオさまのパソコン
	ミギ  オフィシャルスクエア入口
	"""
	keyWait
	end
}
script 230 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1289
	playerLock
	playerAnimate
		animation = 24
	itemGiveChip
		chip = 6
		code = S
		amount = 1
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 6
	" "
	printCode
		buffer = 0
		code = S
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 231 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1290
	jumpRandom
		untrap = false
		targets = [
			ratio = 0
			jump = 233,
			ratio = 64
			jump = 233,
			ratio = 0
			jump = 234,
			ratio = 64
			jump = 234
		]
}
script 232 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	clearMsg
	startRandomBattle
	end
}
script 233 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 5
			code = P,
			chip = 16
			code = B,
			chip = 23
			code = S,
			chip = 39
			code = U
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 234 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 200,
			amount = 400,
			amount = 800,
			amount = 1500
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 235 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1291
	jumpRandom
		untrap = false
		targets = [
			ratio = 0
			jump = 237,
			ratio = 64
			jump = 237,
			ratio = 0
			jump = 238,
			ratio = 64
			jump = 238
		]
}
script 236 mmbn2 {
	msgOpen
	"""
	なんと、ミステリーデータは
	ウイルスだった!!
	"""
	keyWait
	clearMsg
	startRandomBattle
	end
}
script 237 mmbn2 {
	msgOpen
	startGiveRandomChipCode
		pool = [
			chip = 5
			code = P,
			chip = 16
			code = B,
			chip = 23
			code = S,
			chip = 39
			code = U
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	チップデータ「
	"""
	printChip
		buffer = 1
		chip = 0
	" "
	printCode
		buffer = 2
		code = A
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 238 mmbn2 {
	msgOpen
	startGiveRandomZenny
		pool = [
			amount = 200,
			amount = 400,
			amount = 800,
			amount = 1500
		]
	playerLock
	playerAnimate
		animation = 24
	"""
	ロックマンは、
	「
	"""
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"""
	ゼニー」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
script 239 mmbn2 {
	msgOpen
	"""
	ロックマンは、
	ミステリーデータを しらべた・
	"""
	wait
		frames = 10
	"・"
	wait
		frames = 10
	"・"
	wait
		frames = 10
	keyWait
	clearMsg
	flagSet
		flag = 1292
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 69
		amount = 1
	"""
	ロックマンは、
	「
	"""
	printItem
		buffer = 0
		item = 69
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	end
}
