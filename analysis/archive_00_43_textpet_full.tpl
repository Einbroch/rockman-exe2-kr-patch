@archive 0761844
@size 255

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	熱斗くん!
	ここまできて にげちゃダメだ!
	"""
	keyWait
	end
}
script 190 mmbn2 {
	checkItem
		item = 56
		amount = 1
		jumpIfEqual = 198
		jumpIfGreater = 198
		jumpIfLess = continue
	checkFlag
		flag = 3217
		jumpIfTrue = 198
		jumpIfFalse = continue
	checkFlag
		flag = 285
		jumpIfTrue = 194
		jumpIfFalse = continue
	flagSet
		flag = 285
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	ふふふ アナタね、
	ねえさんと、いもうとから きいてるわ
	"""
	keyWait
	clearMsg
	"""
	あの ふたりは、ひょうじゅんごが
	マスター できなかったから
	カンタンに みつかってしまったみたいね
	"""
	keyWait
	clearMsg
	"でも、ワタシは ひとあじ ちがうわよ!"
	keyWait
	clearMsg
	jump
		target = 191
}
script 191 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ぬすんだ ほうせきを かえすんだ!"
	keyWait
	clearMsg
	jump
		target = 192
}
script 192 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"それは、できない そうだんよ!"
	keyWait
	clearMsg
	"""
	この ほうせきたち は、
	ワタシたちにとっても
	だいじな モノなのよ
	"""
	keyWait
	clearMsg
	"""
	どうしても、とりかえしたいのなら、
	チカラづくで でも うばってみなさい!!
	"""
	keyWait
	clearMsg
	startFixedBattle
		background = 255
		mode = 0
		folderPtr = 0
		shuffleFolder = true
		saveOWPosition = true
		hideOWObjects = false
		noEscape = true
		battle = 56
		field = 65
		music = 27
}
script 193 mmbn2 {
	mugshotHide
	msgOpen
	"かり"
	keyWait
	end
}
script 194 mmbn2 {
	flagSet
		flag = 170
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"ま、まけたわ・・・"
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
	"\nしかたないわね・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"・"
	waitSkip
		frames = 20
	"\nぜんぶ はなすわ・・・"
	keyWait
	clearMsg
	"""
	その ほうせきは、
	ほうせきコレクターだった
	おじいちゃんの カタミなの・・・
	"""
	keyWait
	clearMsg
	"""
	ある あくとく ほうせきしょうが、
	おじいちゃんを、だまして
	その ほうせきたちを うばっていったの
	"""
	keyWait
	clearMsg
	"""
	おじいちゃんが、なくなる まぎわ
	その ほうせきを、もういちど みたいって
	そういって、なくなったの・・・
	"""
	keyWait
	clearMsg
	"""
	ワタシたち しまいで、そうだんして
	その ほうせきを、とりかえすコトにしたの
	"""
	keyWait
	clearMsg
	"""
	だって、ほうせきの ほんとうの かちが
	わかるヒトのもとに あるほうが
	ほうせきたちも、シアワセでしょ!?
	"""
	keyWait
	clearMsg
	jump
		target = 195
}
script 195 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	いくら だいじなモノだからって、
	ドロボウは、よくないよ!
	"""
	keyWait
	clearMsg
	"""
	じぶんの まごたちが、
	ドロボウしているだなんて、
	おじいさんも、きっとかなしむよ!!
	"""
	keyWait
	clearMsg
	jump
		target = 196
}
script 196 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	そう・・・だよね・・・
	こんなコトしても、おじいちゃんは
	よろこんじゃ くれないよね
	"""
	keyWait
	clearMsg
	"""
	わかったわ、ほうせきを かえすわ
	そして、いつか そのほうせきを
	かいもどしてやるわ
	"""
	keyWait
	clearMsg
	"いつか、かならず・・・"
	keyWait
	clearMsg
	"""
	じゃあ、コレ・・・
	おみせのヒトに、ごめんなさいって
	つたえておいて・・・
	"""
	keyWait
	clearMsg
	jump
		target = 197
}
script 197 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 56
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 56
	"""
	」
	を ゲットした!!
	"""
	keyWait
	playerFinish
	playerReset
	playerUnlock
	end
}
script 198 mmbn2 {
	mugshotShow
		mugshot = CampWoman
	msgOpen
	"""
	ワタシたち 3しまい
	ココロを いれかえて
	"""
	keyWait
	clearMsg
	"""
	はたらいて、おカネをためて
	もういちど、あの ほうせきを
	かいもどすわ
	"""
	keyWait
	end
}
script 200 mmbn2 {
	flagSet
		flag = 307
	mugshotShow
		mugshot = NetopiaAirportWoman
	msgOpen
	"""
	SSSライセンスしけんの
	じゅけんしゃね
	"""
	keyWait
	clearMsg
	"これが、ワタシのキーワードよ"
	keyWait
	clearMsg
	"""
	「ヒトから すてられしモノの ひつぎ
	その いずれか・・・」
	"""
	keyWait
	end
}
script 220 mmbn2 {
	checkChapter
		lower = 48
		upper = 255
		jumpIfInRange = 221
		jumpIfOutOfRange = continue
	msgOpen
	"""
	ワイヤレスプラグが
	トラップの コントロールボードに
	ささっている!
	"""
	keyWait
	clearMsg
	"プラグインできる!"
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"""
	ワイヤレスプラグが
	トラップの コントロールボードに
	ささっている・・・
	"""
	keyWait
	clearMsg
	"プラグインできる"
	keyWait
	end
}
