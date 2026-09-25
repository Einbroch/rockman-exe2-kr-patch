@archive 07924C0
@size 255

script 0 mmbn2 {
	flagSet
		flag = 538
	end
}
script 1 mmbn2 {
	flagSet
		flag = 539
	end
}
script 2 mmbn2 {
	flagSet
		flag = 540
	end
}
script 3 mmbn2 {
	flagSet
		flag = 541
	end
}
script 4 mmbn2 {
	flagSet
		flag = 542
	end
}
script 5 mmbn2 {
	flagSet
		flag = 543
	end
}
script 6 mmbn2 {
	flagSet
		flag = 544
	end
}
script 7 mmbn2 {
	flagSet
		flag = 545
	end
}
script 8 mmbn2 {
	flagSet
		flag = 546
	end
}
script 9 mmbn2 {
	flagSet
		flag = 547
	end
}
script 10 mmbn2 {
	flagSet
		flag = 548
	end
}
script 20 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 31
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 28
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 27
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 26
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 25
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 24
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 23
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 22
		jumpIfFalse = continue
	checkFlag
		flag = 514
		jumpIfTrue = 21
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"2 "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = continue,
			jump = continue
		]
	end
}
script 21 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 2
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 0
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 3,
			jump = continue,
			jump = continue
		]
	end
}
script 22 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"24"
	option
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 3,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 23 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"24"
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"25"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 24 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 25 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"25\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"27"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 26 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 27 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 28 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 31 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 38
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 37
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 36
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 35
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 34
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 33
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 32
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"23"
	option
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 3,
			jump = 6,
			jump = continue,
			jump = continue
		]
	end
}
script 32 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"23"
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 33 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"23"
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 34 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"24\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 35 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 36 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"23\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 37 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 38 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"2"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"20"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"23\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 40 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 51
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 48
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 47
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 46
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 45
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 44
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 43
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 42
		jumpIfFalse = continue
	checkFlag
		flag = 514
		jumpIfTrue = 41
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = continue,
			jump = continue
		]
	end
}
script 41 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 2
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 0
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 3,
			jump = continue,
			jump = continue
		]
	end
}
script 42 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"24"
	option
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 3,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 43 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"24"
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"25"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 44 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 45 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"25\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"27"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 46 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 47 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 48 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 51 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 58
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 57
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 56
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 55
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 54
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 53
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 52
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"23"
	option
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 3,
			jump = 6,
			jump = continue,
			jump = continue
		]
	end
}
script 52 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"23"
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 53 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"23"
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 54 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"24\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 55 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 56 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"23\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 57 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 58 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"20"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"23\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 60 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 71
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 68
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 67
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 66
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 65
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 64
		jumpIfFalse = continue
	end
}
script 64 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 65 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"25\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"27"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 66 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 4,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 67 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 68 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 71 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 78
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 77
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 76
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 75
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 74
		jumpIfFalse = continue
	end
}
script 74 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"24\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 75 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 76 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"23\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 4,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 77 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 78 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"8"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"20"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"23\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 80 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 91
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 88
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 87
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 86
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 85
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 84
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 83
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 82
		jumpIfFalse = continue
	checkFlag
		flag = 514
		jumpIfTrue = 81
		jumpIfFalse = continue
	end
}
script 81 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 2
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 0
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = continue,
			jump = continue
		]
	end
}
script 82 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"24"
	option
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 83 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"24"
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"25"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 84 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 85 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"25\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"27"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 86 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 4,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 87 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 88 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 91 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 98
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 97
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 96
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 95
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 94
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 93
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 92
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"23"
	option
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 6,
			jump = continue,
			jump = continue
		]
	end
}
script 92 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"23"
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 6,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 93 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"23"
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 94 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"24\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 95 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 96 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"23\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 4,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 97 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 98 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"9"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"20"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"23\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 100 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 111
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 108
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 107
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 106
		jumpIfFalse = continue
	end
}
script 106 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 107 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 108 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 111 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 118
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 117
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 116
		jumpIfFalse = continue
	end
}
script 116 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"23\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 117 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"20\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 118 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"20"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"23\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 120 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 131
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 128
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 127
		jumpIfFalse = continue
	end
}
script 127 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 128 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 131 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 138
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 137
		jumpIfFalse = continue
	end
}
script 137 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 138 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"9"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"23\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 140 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 151
		jumpIfFalse = continue
	end
}
script 151 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 158
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 157
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 156
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 155
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 154
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 153
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 152
		jumpIfFalse = continue
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"8 "
	option
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = continue,
			jump = continue
		]
	end
}
script 152 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 153 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 154 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"24\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 155 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"24\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 156 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"9 \n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 157 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 158 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"9"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"20\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 160 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 171
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 168
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 167
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 166
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 165
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 164
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 163
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 162
		jumpIfFalse = continue
	end
}
script 162 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 3
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"8 "
	option
		left = 2
		right = 0
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = continue,
			jump = continue
		]
	end
}
script 163 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"25"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 164 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 165 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"25\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"27"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 166 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"9\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 167 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 168 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 171 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 178
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 177
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 176
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 175
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 174
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 173
		jumpIfFalse = continue
	checkFlag
		flag = 517
		jumpIfTrue = 172
		jumpIfFalse = continue
	end
}
script 172 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 6,
			jump = continue,
			jump = continue
		]
	end
}
script 173 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"25\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 6,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 174 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"23\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 175 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"23\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 176 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 6,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 177 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"23"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 178 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"9"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"20\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 8,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 180 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 191
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 188
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 187
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 186
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 185
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 184
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 183
		jumpIfFalse = continue
	end
}
script 183 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 1
		down = 1
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 2
		down = 2
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 3
		down = 3
	space
		count = 2
	"24"
	option
		left = 3
		right = 0
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 184 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"24\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 185 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"24\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"27"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 186 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"9\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 7,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 187 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 188 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 191 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 198
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 197
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 196
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 195
		jumpIfFalse = continue
	checkFlag
		flag = 512
		jumpIfTrue = 194
		jumpIfFalse = continue
	checkFlag
		flag = 518
		jumpIfTrue = 193
		jumpIfFalse = continue
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 5
		down = 5
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 5
		down = 5
	space
		count = 2
	"8 "
	option
		left = 2
		right = 4
		up = 5
		down = 5
	space
		count = 2
	"23"
	option
		left = 3
		right = 0
		up = 5
		down = 5
	space
		count = 2
	"24\n"
	option
		left = 5
		right = 5
		up = 0
		down = 0
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 194 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"23\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = continue,
			jump = continue
		]
	end
}
script 195 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"23\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"27"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 196 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"27"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 6,
			jump = 7,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 197 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"23"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"24"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 198 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"9"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"20\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 9,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 200 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 211
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 208
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 207
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 206
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 205
		jumpIfFalse = continue
	end
}
script 205 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 6
		down = 6
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 6
		down = 6
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 6
		down = 6
	space
		count = 2
	"24\n"
	option
		left = 6
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"25"
	option
		left = 5
		right = 5
		up = 1
		down = 1
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 206 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"9\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 207 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 208 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"30"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 211 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 218
		jumpIfOutOfRange = continue
	checkFlag
		flag = 516
		jumpIfTrue = 217
		jumpIfFalse = continue
	checkFlag
		flag = 513
		jumpIfTrue = 216
		jumpIfFalse = continue
	checkFlag
		flag = 519
		jumpIfTrue = 215
		jumpIfFalse = continue
	end
}
script 215 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 7
		down = 7
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 7
		down = 7
	space
		count = 2
	"23\n"
	option
		left = 7
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"24"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"25"
	option
		left = 6
		right = 5
		up = 2
		down = 2
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 216 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 8
		down = 8
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 5
		up = 3
		down = 3
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 217 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"23"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"24"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"25"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = continue,
			jump = continue
		]
	end
}
script 218 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"30かいに 行けるように なったよ!\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"9"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"20\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"25"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"30"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 10,
			jump = continue,
			jump = continue
		]
	end
}
script 220 mmbn2 {
	checkFlag
		flag = 515
		jumpIfTrue = 231
		jumpIfFalse = continue
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 228
		jumpIfOutOfRange = continue
	end
}
script 228 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 4
		right = 1
		up = 5
		down = 5
	space
		count = 2
	"1 "
	option
		left = 0
		right = 2
		up = 6
		down = 6
	space
		count = 2
	"2 "
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4 "
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8 "
	option
		left = 3
		right = 0
		up = 9
		down = 9
	space
		count = 2
	"9\n"
	option
		left = 8
		right = 6
		up = 0
		down = 0
	space
		count = 2
	"20"
	option
		left = 5
		right = 7
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 6
		right = 8
		up = 2
		down = 2
	space
		count = 2
	"25"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"27"
	option
		left = 8
		right = 5
		up = 4
		down = 4
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
script 231 mmbn2 {
	checkChapter
		lower = 70
		upper = 72
		jumpIfInRange = 238
		jumpIfOutOfRange = continue
	end
}
script 238 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"なんかいに 行く?\n"
	option
		left = 5
		right = 1
		up = 6
		down = 6
	space
		count = 2
	"1"
	option
		left = 0
		right = 2
		up = 7
		down = 7
	space
		count = 2
	"2"
	option
		left = 1
		right = 3
		up = 7
		down = 7
	space
		count = 2
	"4"
	option
		left = 2
		right = 4
		up = 8
		down = 8
	space
		count = 2
	"8"
	option
		left = 3
		right = 5
		up = 9
		down = 9
	space
		count = 2
	"9"
	option
		left = 4
		right = 0
		up = 10
		down = 10
	space
		count = 2
	"20\n"
	option
		left = 10
		right = 7
		up = 0
		down = 0
	space
		count = 2
	"23"
	option
		left = 6
		right = 8
		up = 1
		down = 1
	space
		count = 2
	"24"
	option
		left = 7
		right = 9
		up = 3
		down = 3
	space
		count = 2
	"25"
	option
		left = 8
		right = 10
		up = 4
		down = 4
	space
		count = 2
	"27"
	option
		left = 9
		right = 6
		up = 5
		down = 5
	space
		count = 2
	"やめる"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 0,
			jump = 1,
			jump = 2,
			jump = 3,
			jump = 4,
			jump = 5,
			jump = 6,
			jump = 7,
			jump = 8,
			jump = 9,
			jump = continue,
			jump = continue
		]
	end
}
