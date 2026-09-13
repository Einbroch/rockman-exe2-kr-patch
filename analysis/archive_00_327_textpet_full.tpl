@archive 078E02C
@size 46

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ん?"
	keyWait
	end
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"みんな! きてくれたの!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ロールちゃん? みんな?"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ガッ!"
	keyWait
	end
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ガッツマン! なにするんだ!?"
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
	まて ロックマン!
	みんな ようすが おかしいぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"フハハハハハ! やっと 気が ついたか!"
	keyWait
	clearMsg
	"""
	こいつらは、ちょうど さっき
	しんにゅうした コドモどもから
	うばった ザコナビだ!
	"""
	keyWait
	clearMsg
	"""
	ただし ロックマン.EXEを
	こうげき するように
	ちょっと カスタマイズ してあるがな!
	"""
	keyWait
	clearMsg
	"どうした?"
	waitSkip
		frames = 30
	"""
	
	ごじまんの ロックマン.EXEで
	こいつらを デリート しないのか?
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
	"ひきょうだぞ!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	みんなを デリートなんて・・・
	そんなこと できるわけない!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"ククク、ゆうじょうか・・・"
	waitSkip
		frames = 30
	"\nまったく おろかなものだな"
	keyWait
	clearMsg
	"では こちらは えんりょなく いくぞ!"
	waitSkip
		frames = 30
	"\nロールよ、ロックマンを デリートせよ!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"ハイ・・・"
	waitSkip
		frames = 30
	"\nロックマン.EXE、デリート シマス"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ロールちゃん! "
	waitSkip
		frames = 30
	"ボクだよ! ロックだよ!"
	waitSkip
		frames = 30
	"\nホントに わかんないの!?"
	keyWait
	end
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"クッ・・・"
	waitSkip
		frames = 30
	"このままじゃ・・・"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、はんげき!!"
	waitSkip
		frames = 30
	"\nちくしょー! できるわけ ないか!"
	waitSkip
		frames = 30
	"\nどうすりゃいいんだ!"
	keyWait
	end
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"熱斗くん・・・"
	waitSkip
		frames = 30
	"""
	ダメだ
	げんかい
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
	clearMsg
	jump
		target = 16
}
script 16 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"""
	ハハハハハハハハハ!
	それが おまえたちの だいじにしている
	ゆうじょうか!
	"""
	keyWait
	clearMsg
	"""
	さむい ヤツらだ!
	「きゅうきょくのナビ」を もち出すまでも
	なかったな!
	"""
	keyWait
	end
}
script 17 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"!? ロールちゃーーーーん!"
	waitSkip
		frames = 30
	"\n・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"ひどい! だれだ!?"
	keyWait
	clearMsg
	jump
		target = 18
}
script 18 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"こらー! ロックー!"
	waitSkip
		frames = 30
	"""
	
	わたしと ニセモノの くべつも
	つかないのっ?
	"""
	keyWait
	end
}
script 19 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"え!? だれ?"
	keyWait
	end
}
script 20 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"みんな! ロールちゃん!?"
	waitSkip
		frames = 30
	"\n・・・これ いったい どういうこと?"
	keyWait
	clearMsg
	jump
		target = 21
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Glide
	msgOpen
	"""
	じつは・・・さっき マンションに
	しんにゅうしたときに データの コピーを
	とられていた ようなのです
	"""
	keyWait
	clearMsg
	jump
		target = 22
}
script 22 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"ゴメンね ロック・・・"
	waitSkip
		frames = 30
	"\nそのせいで あぶない目に あわせちゃって"
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
	これくらい ボクは ヘイキさ!
	それに・・・
	みんな たすけに きてくれたから
	"""
	keyWait
	clearMsg
	jump
		target = 24
}
script 24 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"""
	でも、アタシと ニセモノの くべつくらい
	ついてほしかったなぁ
	"""
	keyWait
	clearMsg
	jump
		target = 25
}
script 25 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"えーと・・・"
	waitSkip
		frames = 30
	"ゴメン"
	keyWait
	clearMsg
	jump
		target = 26
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"""
	こんど そんなこと あったら
	ロックのこと デリート しちゃうんだから
	"""
	keyWait
	clearMsg
	jump
		target = 27
}
script 27 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"そりゃないよぉ・・・"
	keyWait
	clearMsg
	jump
		target = 28
}
script 28 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ハハハハハ・・・"
	waitSkip
		frames = 30
	"って ことは?"
	keyWait
	clearMsg
	jump
		target = 29
}
script 29 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗! アタシたち きちゃった・・・"
	keyWait
	clearMsg
	jump
		target = 30
}
script 30 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"メイル!"
	keyWait
	clearMsg
	jump
		target = 31
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"おそくなっちまったな!"
	keyWait
	clearMsg
	jump
		target = 32
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"デカオ! やいとも!"
	keyWait
	clearMsg
	jump
		target = 33
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	あんたたちって
	なんか あぶなかしくって
	ほおって おけないのよねー
	"""
	keyWait
	clearMsg
	jump
		target = 34
}
script 34 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ありがとう! みんな!"
	keyWait
	clearMsg
	"""
	どうだ!?
	これが オレたちの ゆうじょうパワーだ!
	"""
	keyWait
	clearMsg
	jump
		target = 35
}
script 35 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"""
	フフフ おもしろい
	では これは どうだ!?
	"""
	keyWait
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = Roll
	msgOpen
	"キャー!"
	keyWait
	clearMsg
	jump
		target = 37
}
script 37 mmbn2 {
	mugshotShow
		mugshot = Glide
	msgOpen
	"グワーーーー!!!"
	keyWait
	clearMsg
	jump
		target = 38
}
script 38 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ロールちゃん! みんな!"
	keyWait
	end
}
script 39 mmbn2 {
	mugshotShow
		mugshot = LordGospel
	msgOpen
	"""
	どうだ?
	こいつも よくできた コピーだろ?
	"""
	keyWait
	clearMsg
	jump
		target = 40
}
script 40 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン いけるか?"
	keyWait
	clearMsg
	jump
		target = 41
}
script 41 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ダメージ あるけど・・・"
	waitSkip
		frames = 30
	"\nでも みんなを・・・"
	waitSkip
		frames = 30
	"""
	きずつける ヤツは
	ボク・・・
	"""
	waitSkip
		frames = 30
	"ゆるさ・・・"
	waitSkip
		frames = 30
	"グフッ"
	keyWait
	clearMsg
	jump
		target = 42
}
script 42 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	くそ! やっぱり
	さっきのが ひびいてるか・・・
	"""
	keyWait
	clearMsg
	jump
		target = 43
}
script 43 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"コウゲキ タイショウ ロックマン.EXE"
	waitSkip
		frames = 30
	"\nスイテイ デリートタイム・・・"
	waitSkip
		frames = 30
	"5ビョウ"
	waitSkip
		frames = 30
	"\nプログラム ジッコウ!"
	keyWait
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = ProtoMan
	msgOpen
	"ブルース けんざんっ!!"
	keyWait
	clearMsg
	"""
	・・・わが名を かたる まがいものの
	そんざいなど ゆるさん!
	"""
	keyWait
	clearMsg
	jump
		target = 45
}
