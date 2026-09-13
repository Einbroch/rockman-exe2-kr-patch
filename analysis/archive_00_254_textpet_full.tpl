@archive 0784AA0
@size 17

script 0 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"""
	あや? ・・・キミは
	光熱斗くんで ないでマスか!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あ! 日暮(ひぐれ)さん!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	soundPlayBGM
		track = 3
	mugshotShow
		mugshot = Higsby
	msgOpen
	"おひさしぶり でマスな!"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	秋原町の チップショップ
	きゅうに なくなってるんだもん
	オレ びっくりしたよー
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"ハハハ でマス!"
	keyWait
	clearMsg
	"""
	おかげサマで すこしは お金も
	たまったので、いまは レアチップもとめて
	世界中を たびしているでマス
	"""
	keyWait
	clearMsg
	"""
	そして、あっしの ナンバーマンも
	インターネットを さすらって
	ネットショウニンを しているでマスよ
	"""
	keyWait
	clearMsg
	"すべては レアチップのため でマス!!"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あいかわらずだなー"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"""
	あいかわらずと いえば、熱斗くんも
	あいかわらず ロックマンと バリバリ
	ウイルスバスティング してるんでマショ?
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	soundStop
	mugshotShow
		mugshot = Lan
	msgOpen
	"・・・しらないよ! あんなヤツ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"""
	あややや!
	なんでマスか? どうしたでマスか?
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotHide
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
	"""
	熱斗は
	ニホンを 出てからの できごとを
	日暮に はなした
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"・・・熱斗くん ダメでマスーーー!!!!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"! きゅうに びっくりするじゃん!"
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	soundPlayBGM
		track = 15
	mugshotShow
		mugshot = Higsby
	msgOpen
	"""
	アッシのしってる 熱斗くんは
	そんなんじゃ ないでマス!
	"""
	keyWait
	clearMsg
	"""
	ひょうめんでは ケンカしてても
	ココロの中では だれよりも ロックマンを
	すきだった でマス!
	"""
	keyWait
	clearMsg
	"""
	2人のココロが ほんとうに ひとつ
	だったから、かずかずの 大じけんを
	かいけつしてきたんでは ないでマスか!
	"""
	keyWait
	clearMsg
	"""
	そんな 熱斗くんたちと であったから
	アッシも アクのみちから あしをあらい
	こうして まっとうにくらせているでマス!
	"""
	keyWait
	clearMsg
	"""
	熱斗くんたちが そんなふう だったら
	アッシは かなしくて かなしくて・・・
	"""
	keyWait
	clearMsg
	"オヨヨヨヨーーーーーーーー!"
	waitSkip
		frames = 30
	"\nでマス!!!"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Lan
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
	"\nわかった、そうだね 日暮さん"
	keyWait
	clearMsg
	"""
	オレ はじめての がいこくで
	ふあんだったから どこかで ロックマンに
	あまえてたのかも しれない
	"""
	keyWait
	clearMsg
	"""
	きっと それで、
	ロックマンに やつあたりして・・・
	"""
	keyWait
	clearMsg
	jump
		target = 14
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Higsby
	msgOpen
	"オヨヨヨ・・・ "
	waitSkip
		frames = 30
	"""
	熱斗くん・・・
	わかってくれた でマスか?
	"""
	soundStop
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	うん、ありがとう! 日暮さん、
	オレ ロックマンに あやまってくる!
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
