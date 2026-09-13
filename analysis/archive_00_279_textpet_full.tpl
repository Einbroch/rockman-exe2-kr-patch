@archive 07881B4
@size 16

script 0 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"どうしたんだい? ボウヤ"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あの、おじさんってムシのコトくわしい?"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	くわしいかって?
	くわしいなんて もんじゃないよ
	"""
	keyWait
	clearMsg
	"""
	おじさんは、ムシのコトについては
	あるくムシじてん とよばれるほどだよ
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"それじゃ、しつもんなんだけどさ、"
	keyWait
	clearMsg
	"""
	くろいケが モサモサっとしてて
	あしが、ぶっといクモって しってる?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	フム・・・おもいあたるクモは
	たくさんあるな・・・
	"""
	keyWait
	clearMsg
	"ほかに、とくちょうはないのかね?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うーんと、たしか・・・
	めが、いじょうにあかいって
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	おぉっ、それならカンタンだよ
	そのクモは、アメロッパのいちぶにしか
	せいそくしない
	"""
	keyWait
	clearMsg
	"メアカモッサドクグモ"
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"メアカモッサドクグモ!?"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Entomologist
	msgOpen
	"""
	そう、そのクモはとても
	めずらしいクモでな・・・
	"""
	keyWait
	clearMsg
	"""
	モサモサした たいもうと
	らんらんとひかる あかいめが
	とくちょうだ
	"""
	keyWait
	clearMsg
	"あと、きょうりょくなドクをもっている"
	keyWait
	clearMsg
	"""
	ニンゲンがさされると、
	すうじかんは、からだがしびれて
	うごけなくなる・・・
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotHide
	msgOpen
	"うわぁぁぁっ!!"
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんだ!?"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	エコノミークラスの ほうから
	きこえたよ!
	"""
	keyWait
	clearMsg
	"熱斗くん、まさか!?"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン いくぞ!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!"
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	flagSet
		flag = 519
	mugshotShow
		mugshot = Lan
	msgOpen
	"おじさん、ありがとう!"
	keyWait
	clearMsg
	jump
		target = 15
}
