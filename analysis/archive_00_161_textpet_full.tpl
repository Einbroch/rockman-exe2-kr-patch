@archive 077A1EC
@size 255

script 220 mmbn2 {
	checkChapter
		lower = 57
		upper = 57
		jumpIfInRange = 224
		jumpIfOutOfRange = continue
	msgOpen
	"ウラじょうほう けいじばんだ!"
	keyWait
	startBBS
		bbs = 6
	waitHold
}
script 221 mmbn2 {
	msgOpen
	"ヒミツのじょうほう けいじばんだ"
	keyWait
	startBBS
		bbs = 5
	waitHold
}
script 222 mmbn2 {
	msgOpen
	"かりです"
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"かりです"
	keyWait
	end
}
script 224 mmbn2 {
	checkFlag
		flag = 622
		jumpIfTrue = 225
		jumpIfFalse = continue
	checkFlag
		flag = 641
		jumpIfTrue = continue
		jumpIfFalse = 225
	flagSet
		flag = 621
	wait
		frames = 1
	end
}
script 225 mmbn2 {
	msgOpen
	"ウラじょうほう けいじばんだ!"
	keyWait
	startBBS
		bbs = 6
	waitHold
}
