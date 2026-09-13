@archive 07877C8
@size 25

script 0 mmbn2 {
	mugshotHide
	msgOpen
	"いろいろあった はじめての かいがい"
	keyWait
	clearMsg
	"""
	なんども あぶないメにも、あったけど
	いまは、いいおもいでだ
	"""
	keyWait
	clearMsg
	"どんどん とおざかっていく アメロッパ"
	keyWait
	clearMsg
	"""
	ちょっと さみしい き もするけど
	また いつかやってくるよ
	・・・・・・
	"""
	keyWait
	clearMsg
	"""
	もうすぐ、ひこうきは、
	ニホンに とうちゃくする
	"""
	keyWait
	clearMsg
	"""
	はなれていたのは、
	すこしの あいだ だったけど、
	"""
	keyWait
	clearMsg
	"""
	とても なつかしい き がするのは
	なぜだろう
	"""
	keyWait
	clearMsg
	"みんな、いまごろ なにしてるのかな"
	keyWait
	clearMsg
	"はやく、みんなに あいたいな"
	keyWait
	clearMsg
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
	waitSkip
		frames = 20
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"熱斗、まってたぜ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	きいたわよ!
	アメロッパでも だいかつやくだった
	そうじゃない!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"・・・・・・"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"なに、もじもじしてんだよ!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	そうよ、いちばんに 光くんを
	むかえてあげるんじゃ なかったの
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"お・おかえり、熱斗・・・"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	お、おう
	どしたんだよ、そんなカオして
	"""
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	アンタがアメロッパで じけんに
	まきこまれたってきいて、
	ずっと しんぱいしてたのよ!
	"""
	keyWait
	flagSet
		flag = 519
	end
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"""
	熱斗~!!
	しんぱいしてたのよ~!
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
	おっおい!
	そんなにくっつくなって
	デカオたちが みてるじゃん
	"""
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"ヒューヒュー"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"おアツイね! おふたりさん!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗、もう はなさないんだから!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"メ、メイル・・・"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotHide
	msgOpen
	"アテンションプリーズ"
	keyWait
	clearMsg
	"""
	ただいま とうきは、じゅんちょうに
	ひこうを つづけております
	"""
	keyWait
	clearMsg
	"""
	もくてきち デンサンくうこうへの
	とうちゃくじこくは、
	"""
	keyWait
	clearMsg
	"""
	ひづけへんこうせんを またぎまして
	本日の ごぜん7じ45ふんを
	よてい しております
	"""
	keyWait
	clearMsg
	"""
	それでは みなさま
	ひきつづき かいてきな そらのたびを
	おたのしみください
	"""
	keyWait
	end
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	・・・メイル~ むにゃむにゃ
	アテンションプリーズ・・・ん?
	"""
	keyWait
	clearMsg
	flagSet
		flag = 520
	"あ・へ? あれ? ここは?"
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ひこうきのなかだよ
	もう、ねぼけちゃって
	"""
	keyWait
	clearMsg
	"""
	きいちゃったよ~、
	ね・
	"""
	waitSkip
		frames = 20
	"ご・"
	waitSkip
		frames = 20
	"と"
	keyWait
	clearMsg
	"""
	「メイル~」ってね
	かえったら、みんなにいってやろ!
	"""
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そ、そんなこといってないって!"
	keyWait
	clearMsg
	jump
		target = 19
}
script 19 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	じょうだんだよ
	めがさめた?
	"""
	keyWait
	clearMsg
	jump
		target = 20
}
script 20 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	お、おう
	ところで、いまなんじだ?
	"""
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ごぜん11じ30ぷん
	もうすぐ、おひるだね
	"""
	keyWait
	clearMsg
	"""
	そうだ、熱斗くん
	せっかく ひこうきに のったんだから、
	コクピット みせてもらおうよ
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	そんなに カンタンに
	みせてもらえるのかな
	"""
	keyWait
	clearMsg
	jump
		target = 23
}
script 23 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	きっと だいじょうぶだって!
	おねがいしたら みせてもらえるよ
	"""
	keyWait
	clearMsg
	jump
		target = 24
}
