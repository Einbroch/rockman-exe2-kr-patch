@archive 07839C8
@size 17

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"あーあー"
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"どしたの?"
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
	お休みもさー、しらない あいだに
	はんぶん すぎちゃったなー
	と おもってさー
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"けっこう イロイロあったもんね"
	waitSkip
		frames = 30
	"""
	
	・・・でも しゅくだいは はんぶん
	どころか ほとんど おわってないよね
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ねぇ、ロックマ~ン"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	きゅうに そんなこえ 出してもダメ!
	しゅくだいは やんないよ!
	"""
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
	だって さんすうとか
	ロックマンが やったら
	すぐ おわっちゃうじゃんか~
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ダメったら ダメ!
	しゅくだいは じぶんで やるから
	いみが あるんだよっ
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
	"ちぇー"
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
	・・・ん、ちょっと まって、
	メールみたい
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	わ! すごいや!
	「オフィシャルネットバトラー世界ほんぶ」
	から だって!
	"""
	keyWait
	clearMsg
	"かいふう してみるね!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotHide
	msgOpen
	"""
	今回の
	「アジーナ&ニホン しゅうげきじけん」
	でも わかるように
	"""
	keyWait
	clearMsg
	"""
	ネットマフィア 「ゴスペル」の
	きょういは、ますます
	大きくなってきています
	"""
	keyWait
	clearMsg
	"""
	しかし、このたび わたしたちは
	「ゴスペル」についての じゅうだいな
	じょうほうを 手に入れました
	"""
	keyWait
	clearMsg
	"""
	そこで、ゆうしゅうな ネットバトラーの
	みなさんに そのじょうほうを れんらくし
	こんごに そなえたいと おもいます
	"""
	keyWait
	clearMsg
	"""
	あなたも わたしたちの かいさいする
	「オフィシャルネットバトラーかいぎ」に
	ぜひ さんかして下さい
	"""
	keyWait
	clearMsg
	jump
		target = 12
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"なんか むつかしそうだなー"
	keyWait
	clearMsg
	jump
		target = 13
}
script 13 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	まだ つづきがあるよ
	えーと、
	"""
	keyWait
	clearMsg
	"""
	かいぎは、アメロッパにある
	「オフィシャルネットバトラー世界ほんぶ」
	で 行います
	"""
	keyWait
	clearMsg
	"だって! "
	waitSkip
		frames = 30
	"""
	ひこうきの チケットも
	いっしょに ついてるよ!
	"""
	keyWait
	end
}
script 14 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	がいこく、アメロッパかー・・・
	おもしろそうだな! 行ってみるか!
	"""
	keyWait
	clearMsg
	jump
		target = 15
}
script 15 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	たのしみだね! でも
	ちゃんと しゅくだいも やろうね!
	"""
	keyWait
	clearMsg
	jump
		target = 16
}
