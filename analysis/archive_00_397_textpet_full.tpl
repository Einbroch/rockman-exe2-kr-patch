@archive 07483F4
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 61
		upper = 61
		jumpIfInRange = 71
		jumpIfOutOfRange = continue
	checkChapter
		lower = 58
		upper = 60
		jumpIfInRange = 62
		jumpIfOutOfRange = continue
	checkChapter
		lower = 56
		upper = 57
		jumpIfInRange = 60
		jumpIfOutOfRange = continue
	checkChapter
		lower = 55
		upper = 55
		jumpIfInRange = 55
		jumpIfOutOfRange = continue
	checkChapter
		lower = 32
		upper = 47
		jumpIfInRange = 50
		jumpIfOutOfRange = continue
	checkChapter
		lower = 10
		upper = 15
		jumpIfInRange = 30
		jumpIfOutOfRange = continue
	checkChapter
		lower = 8
		upper = 9
		jumpIfInRange = 25
		jumpIfOutOfRange = continue
	checkChapter
		lower = 7
		upper = 7
		jumpIfInRange = 20
		jumpIfOutOfRange = continue
	checkChapter
		lower = 4
		upper = 6
		jumpIfInRange = 15
		jumpIfOutOfRange = continue
	checkChapter
		lower = 2
		upper = 3
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	checkFlag
		flag = 517
		jumpIfTrue = 4
		jumpIfFalse = continue
	flagSet
		flag = 516
	mugshotShow
		mugshot = Mom
	msgOpen
	"熱斗、おかえり"
	keyWait
	clearMsg
	jump
		target = 2
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、いえに かえったら
	ママに ただいまを 言わなきゃ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ただいま! ママ!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"え・・・と"
	waitSkip
		frames = 30
	"""
	
	今日は ママ、熱斗に なにか
	ようじが あったんだけどな・・・
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"しゅくだいは おわったの?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"はい "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"いいえ"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 5,
			jump = continue,
			jump = continue
		]
	"""
	ちゃんと やるまで
	あそびに 行っちゃダメよっ
	"""
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"こら! "
	waitSkip
		frames = 30
	"ウソついても ダメ!"
	waitSkip
		frames = 30
	"\nママ ちゃんと わかるんだからねっ"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"ちゃんと しゅくだい やったみたいね"
	waitSkip
		frames = 30
	"\nえらかったね"
	keyWait
	clearMsg
	"""
	・・・でも、パパの子なのに なんで
	べんきょうが キライなのかしら
	"""
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	どこかに あそびに行くの?
	くらくならないうちに かえってくるのよ
	"""
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"おかえり 熱斗"
	keyWait
	clearMsg
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
	まぁ!
	そんな たいへんなことが あったの?
	"""
	keyWait
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1817
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 25 mmbn2 {
	checkFlag
		flag = 590
		jumpIfTrue = 26
		jumpIfFalse = continue
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	こどもだけで キャンプ?
	まぁ だいじょうぶかしら・・・
	"""
	keyWait
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	キャンプは あしたに したの?
	そうね、それが いいかもね
	"""
	keyWait
	end
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	熱斗たちが 行く キャンプじょうって
	川ぞい なんでしょ
	"""
	keyWait
	clearMsg
	"""
	おとついまで あめ だったから
	きっと 水かさが ふえてるわ
	水の ジコには 気をつけるようにね
	"""
	keyWait
	end
}
script 35 mmbn2 {
	checkChapter
		lower = 64
		upper = 72
		jumpIfInRange = 80
		jumpIfOutOfRange = continue
	checkChapter
		lower = 28
		upper = 31
		jumpIfInRange = 46
		jumpIfOutOfRange = continue
	checkChapter
		lower = 27
		upper = 27
		jumpIfInRange = 44
		jumpIfOutOfRange = continue
	checkChapter
		lower = 22
		upper = 26
		jumpIfInRange = 42
		jumpIfOutOfRange = continue
	checkChapter
		lower = 20
		upper = 21
		jumpIfInRange = 40
		jumpIfOutOfRange = continue
	checkChapter
		lower = 18
		upper = 19
		jumpIfInRange = 38
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = Mom
	msgOpen
	"あそんでばっかじゃ ダメよ!"
	keyWait
	clearMsg
	"""
	え? じゆうけんきゅうの
	しゅざいに いくの・・・
	"""
	keyWait
	clearMsg
	"それは、ガンバらないとね"
	keyWait
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"どう? けんきゅうは、すすんでる?"
	keyWait
	end
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	ママも なにか けんきゅう
	はじめようかしら
	"""
	keyWait
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	また、パパの おしごとが
	いそがしくなったんだって
	"""
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"ニホンに しんにゅうしゃが?"
	keyWait
	clearMsg
	"""
	ゆういちろうさん、
	だいじょうぶかしら?
	"""
	keyWait
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	マザーコンピュータが
	のっとられそうなの?
	"""
	keyWait
	clearMsg
	"""
	ゆういちろうさん
	ホントに だいじょうぶかしら?
	ますます シンパイだわ・・・
	"""
	keyWait
	end
}
script 50 mmbn2 {
	checkFlag
		flag = 514
		jumpIfTrue = 52
		jumpIfFalse = continue
	mugshotShow
		mugshot = Mom
	msgOpen
	"どしたの?"
	keyWait
	clearMsg
	"・・・まあ! アメロッパへ!?"
	waitSkip
		frames = 30
	"\nこども ひとりで!?"
	keyWait
	clearMsg
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"いいわ 行ってらっしゃい!"
	waitSkip
		frames = 30
	"""
	
	それも しゃかいべんきょうの ひとつ
	だものね
	"""
	keyWait
	clearMsg
	"""
	パスポートは オフィシャルセンターで
	もらえたと おもうけど、いちおう
	ママから パパに きいておいてあげる
	"""
	keyWait
	clearMsg
	"気をつけて 行ってくるのよ"
	keyWait
	flagSet
		flag = 514
	end
}
script 51 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん、いくらなんでも
	ママにナイショで がいこくに 行くのは
	まずいよ・・・
	"""
	keyWait
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	ママは おみやげは いいから
	そのぶん いっぱい たのしんでらっしゃい
	"""
	keyWait
	end
}
script 55 mmbn2 {
	flagSet
		flag = 577
	mugshotShow
		mugshot = Mom
	msgOpen
	"おかえり 熱斗"
	keyWait
	clearMsg
	"ながたび ごくろうさま!!"
	keyWait
	clearMsg
	"""
	みんなに、あいさつしてきた?
	みんな シンパイしてたわよ
	"""
	keyWait
	clearMsg
	"""
	行ってきたら 今日は
	スグねなさい
	"""
	keyWait
	clearMsg
	"つかれが たまってるでしょ?"
	keyWait
	end
}
script 60 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	熱斗、そとはあぶないから
	きを つけなさいよ!
	"""
	keyWait
	end
}
script 62 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"ママは、ひなんしないわ"
	keyWait
	clearMsg
	"""
	だって パパが いないあいだ
	このいえを まもるのは、
	ママのしごとだもんね
	"""
	keyWait
	end
}
script 70 mmbn2 {
	checkFlag
		flag = 659
		jumpIfTrue = 71
		jumpIfFalse = continue
	flagSet
		flag = 658
	wait
		frames = 1
	end
}
script 71 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	おつかれさま
	ゆっくり おやすみなさい
	"""
	keyWait
	end
}
script 80 mmbn2 {
	mugshotShow
		mugshot = Mom
	msgOpen
	"""
	このぶんじゃ、とうぶん また
	パパ かえってこれそうに ないわね・・・
	"""
	keyWait
	end
}
script 220 mmbn2 {
	msgOpen
	"""
	ママのしゅみで おいてある カビンだ
	じつに シブい・・・
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	ママが さいきん ちょうせんしている
	チーズケーキだ・・・
	"""
	keyWait
	clearMsg
	"""
	なっとくの ケーキが やけるまで、
	まいにち つくりつづけるそうだ
	"""
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	たくさんの しょくざいが
	たばを つらねている
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ママが ケーキをやくのに つかう
	とくちゅうひんの レンジだ
	"""
	keyWait
	clearMsg
	"ママいわく、かりょくが ちがうらしい"
	keyWait
	end
}
script 224 mmbn2 {
	msgOpen
	"""
	さまざまな しょっきが ならんでいる
	どれもこれも ハイセンスな いっぴんだ
	"""
	keyWait
	end
}
script 225 mmbn2 {
	msgOpen
	"""
	ちょう うすがたテレビだ
	このタイプの テレビは
	プラグイン できない
	"""
	keyWait
	end
}
script 227 mmbn2 {
	checkChapter
		lower = 1
		upper = 15
		jumpIfInRange = 228
		jumpIfOutOfRange = continue
	msgOpen
	"""
	このいえの でんかせいひんを
	この コントロールパネルで
	そうさ することができる
	"""
	keyWait
	clearMsg
	"プラグイン できる"
	keyWait
	end
}
script 228 mmbn2 {
	msgOpen
	"""
	このいえの でんかせいひんを
	この コントロールパネルで
	そうさ することができる
	"""
	keyWait
	clearMsg
	"""
	プラグインできる つくりだが
	今日は もうママが ウイルスチェックを
	すませているようだ・・・
	"""
	keyWait
	end
}
