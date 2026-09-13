@archive 078C0C0
@size 15

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだ コレ・・・"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	このまえ、こんなことに
	なってなかったと おもうけど・・・
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
	くそ! まちがいない!
	ゴスペルは かいめつ なんか
	していなかったんだ
	"""
	keyWait
	clearMsg
	"これじゃ じけんが へらないわけだぜ!"
	waitSkip
		frames = 30
	"\nロックマン!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	つぎは そいつだ!
	なんとか ならねえか?
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"やってみる!"
	keyWait
	end
}
script 6 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"ダメだ・・・"
	keyWait
	end
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"わ!"
	keyWait
	end
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"これじゃ キリが ないってか・・・"
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
	熱斗くん、コトブキ町に 行ってみよう!
	なにか げんいんが わかるかもしれない!
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
	"だな!"
	waitSkip
		frames = 30
	"\n・・・でも どうやって 行くんだっけ?"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"う~ん・・・"
	waitSkip
		frames = 30
	"\nこういうときは・・・"
	waitSkip
		frames = 30
	"ね?"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やっぱ パパに そうだんか!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"じゃ いこ!"
	keyWait
	clearMsg
	jump
		target = 14
}
