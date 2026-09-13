@archive 077C410
@size 15

script 0 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"う、"
	waitSkip
		frames = 30
	"うー"
	waitSkip
		frames = 30
	"・・・ん"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Dex
	msgOpen
	"気が ついたっ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"やいとちゃん! "
	waitSkip
		frames = 30
	"だいじょうぶ?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"あれ・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	"・"
	waitSkip
		frames = 30
	" あたしオフロに・・・"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"ガスをすって、気を うしなっていたの"
	waitSkip
		frames = 30
	"\n熱斗が たすけてくれたんだよ"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"光くんが・・・"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ヘッ"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	soundPlayBGM
		track = 4
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	・・・って あなた
	まさか レディのハダカを!
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
	"見てないよ!"
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"""
	そんなわけ ないでしょ!
	ちょっと! 
	"""
	waitSkip
		frames = 30
	"せきにん とりなさいよね!"
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Mayl
	msgOpen
	"熱斗は ウソついてないよ"
	keyWait
	clearMsg
	"""
	ガスをとめたのは 熱斗だけど、
	やいとちゃんを ここまで はこんだのは
	わたしだもの
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
	"""
	げんかんのロックを はずしたのは
	オレだぜ!
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Yai
	msgOpen
	"ふ~ん、な~んだ"
	waitSkip
		frames = 30
	"""
	
	光くん アタシのハダカ 見れなくて
	おしいこと したわね~
	"""
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ちぇ、あいかわらず
	口のへらない ヤツーーー!
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
