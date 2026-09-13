@archive 0760ACC
@size 255

script 190 mmbn2 {
	checkFlag
		flag = 280
		jumpIfTrue = 193
		jumpIfFalse = continue
	checkFlag
		flag = 279
		jumpIfTrue = 191
		jumpIfFalse = continue
	flagSet
		flag = 279
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	だ~れがよんだか~ クイズキング!
	だ~れがよんだか~ クイズキング!
	"""
	keyWait
	clearMsg
	"""
	キング! キング! キング!
	キング! キング! キング!
	"""
	keyWait
	clearMsg
	"""
	いってみよ~! やってみよう!
	さーぁ さぁさぁ
	(チャッチャー)クイズアワ~~
	"""
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
	"オホン!"
	keyWait
	clearMsg
	"""
	わがなは、クイズキング!
	230ねんまえに ほろびしもの
	"""
	keyWait
	clearMsg
	"""
	カラダはとうに くちはてたが
	タマシイは、いきつづける・・・
	"""
	keyWait
	clearMsg
	"""
	いまは、このオトコの カラダをかり
	まちつづけているのだ
	"""
	keyWait
	clearMsg
	"""
	わが クイズが ぜんもん せいかいされ、
	わが タマシイが かいほうされる日を!
	"""
	keyWait
	clearMsg
	"""
	わが クイズに 15問れんぞく
	せいかいしてみよ・・・
	"""
	keyWait
	clearMsg
	"""
	なんじは、われを ときはなつコトが
	できるのか・・・?
	"""
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"できます! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"できません!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 194,
			jump = continue,
			jump = continue
		]
	"""
	われは まちつづけるぞ・・・
	わがタマシイが かいほうされる日を!
	"""
	keyWait
	end
}
script 191 mmbn2 {
	soundEnableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	だ~れがよんだか~ クイズキング!
	だ~れがよんだか~ クイズキング!
	"""
	keyWait
	clearMsg
	"""
	キング! キング! キング!
	キング! キング! キング!
	"""
	keyWait
	clearMsg
	"""
	いってみよ~! やってみよう!
	さーぁ さぁさぁ
	(チャッチャー)クイズアワ~~
	"""
	keyWait
	clearMsg
	"""
	わが クイズに こたえ、
	われを ときはなってくれるのか?
	"""
	keyWait
	clearMsg
	option
		left = 1
		right = 1
		up = 0
		down = 0
	space
		count = 2
	"おう! "
	option
		left = 0
		right = 0
		up = 1
		down = 1
	space
		count = 2
	"ムリ!"
	select
		default = 0
		disableB = false
		clear = true
		targets = [
			jump = 194,
			jump = continue,
			jump = continue
		]
	"""
	にげることは、
	けして まけるコトではない
	"""
	keyWait
	clearMsg
	"しかし・・・"
	keyWait
	clearMsg
	"""
	だんしたるもの、てきに なんども
	せを むけるのは、はじとしれ!!
	"""
	keyWait
	end
}
script 192 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	soundPlay
		track = 280
	waitSkip
		frames = 40
	"""
	おまえも、わがタマシイを
	かいほうするコトは、できなかったか・・・
	"""
	keyWait
	clearMsg
	"""
	だが、われは まちつづけるぞ・・・
	わがタマシイが かいほうされる日を!
	"""
	keyWait
	end
}
script 193 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	うーん・・・ボクはいままで、
	ナニを していたんだ?
	とてもながい ユメをみていた きがする
	"""
	keyWait
	clearMsg
	"""
	おもい・・・だせない・・・
	たしか、13さいの たんじょうびに
	おしろの けんがくにきて・・・
	"""
	keyWait
	clearMsg
	"""
	そのアト・・・?
	うーん・・・おもいだせない・・・
	"""
	keyWait
	end
}
script 194 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"では いくぞ!"
	keyWait
	clearMsg
	"だい1問"
	keyWait
	clearMsg
	"シャドーマンの属性は?"
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"水属性\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"属性はない\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"木属性"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = continue,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 195
}
script 195 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい2問"
	keyWait
	clearMsg
	"""
	いつもは、クチをとじていて、
	クチを ひらくと、どうじに
	ホウガンを うってくる ウイルスのなまえ
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"ホウガン\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ハンディース\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ハルドボルズ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 196
}
script 196 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい3問"
	keyWait
	clearMsg
	printChip
		buffer = 0
		chip = 232
	"に、\n"
	printChip
		buffer = 0
		chip = 49
	"と、"
	printChip
		buffer = 0
		chip = 193
	"""
	を
	くみあわせた こうげきりょくは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"190\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"220\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"240"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 197
}
script 197 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい4問"
	keyWait
	clearMsg
	"""
	ヒートマンの オペレータ、
	ヒノケンの フルネームは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"ヒノ ケンシロウ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ヒノ ケンジ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ヒノ ケンイチ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 198
}
script 198 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい5問"
	keyWait
	clearMsg
	"""
	マグネットマンの オペレータ
	ガウス マグネッツの
	おとうとのなまえは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"アンペア・マグネッツ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ヒポポタマス・マグネッツ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ジャック・エレキテル"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 199
}
script 199 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい6問"
	keyWait
	clearMsg
	"""
	つぎのうち、木属性のこうげきに
	よわい ナビは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"マグネットマン\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ヒートマン\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ナイトマン"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = continue,
			jump = 192,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 200
}
script 200 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい7問"
	keyWait
	clearMsg
	"""
	アメロッパの ホテルの
	へやにある れいぞうこの なかの
	おんどは、なんどでしょう?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"せっし ー3ど\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"せっし 0ど\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"せっし 3ど"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 201
}
script 201 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい8問"
	keyWait
	clearMsg
	"""
	アメロッパで 大ブレイク中の
	ロボットアニメのなまえは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"アメロンダム\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"アメロンガーX\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"アメロッターロボ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = continue,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 202
}
script 202 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい9問"
	keyWait
	clearMsg
	"秋原町には、いえが なんけんある?"
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"7けん\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"8けん\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"9けん"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 211
}
script 203 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい11問"
	keyWait
	clearMsg
	"""
	デンサンシティにあって、
	アメロッパにないものはどれ?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"メトロライン\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"バスてい\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"電脳スクエア"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = continue,
			jump = 192,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 204
}
script 204 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい12問"
	keyWait
	clearMsg
	"""
	ウラインターネットへは、
	どのエリアからはいるコトが
	できる?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"アメロッパスクエア入り口\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"アメロッパエリア2\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"アメロッパエリア3"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 205
}
script 205 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい13問"
	keyWait
	clearMsg
	"クイズくんは、どこにいた?"
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"おくデンだに\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"オフィシャルセンター\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"デンサンくうこう"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 206
}
script 206 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい14問"
	keyWait
	clearMsg
	"""
	マザーコンピュータの電脳1の
	2つめの キーワードは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"アリジゴク\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"シンゴウキ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"トオレマスヨ"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = continue,
			jump = 192,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	つぎは さいごの もんだいだ
	われを ときはなつのだ
	"""
	keyWait
	clearMsg
	jump
		target = 207
}
script 207 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい15問"
	keyWait
	clearMsg
	"WWWの リーダーのなまえは?"
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"ゴスペル\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"ダーク・ミヤビ\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"ワイリー"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 301
	waitSkip
		frames = 20
	"""
	おおおおおおおおお
	われ、ときはなたれり!
	"""
	keyWait
	clearMsg
	"なんじの なは なんという?"
	keyWait
	clearMsg
	jump
		target = 208
}
script 208 mmbn2 {
	flagSet
		flag = 280
	mugshotShow
		mugshot = Lan
	msgOpen
	"光・・・熱斗・・・"
	keyWait
	clearMsg
	jump
		target = 209
}
script 209 mmbn2 {
	mugshotShow
		mugshot = OldMan
	msgOpen
	"""
	光 熱斗・・・
	ありがとう・・・
	"""
	keyWait
	clearMsg
	"やっと ねむりに つくことができる"
	keyWait
	clearMsg
	"""
	・・・ダレがよんだか・・・
	ダレが・・・よん・か・・・
	"""
	keyWait
	clearMsg
	jump
		target = 210
}
script 210 mmbn2 {
	mugshotHide
	msgOpen
	playerLock
	playerAnimate
		animation = 24
	itemGive
		item = 100
		amount = 1
	"""
	熱斗は、
	きょうかプログラム「
	"""
	printItem
		buffer = 0
		item = 100
	"""
	」
	を ゲットした!!
	"""
	playerFinish
	playerUnlock
	keyWait
	clearMsg
	"""
	レギュラーメモリの ようりょうが、
	3メガ ふえた!!
	"""
	keyWait
	end
}
script 211 mmbn2 {
	soundDisableChoiceSFX
	mugshotShow
		mugshot = OldMan
	msgOpen
	"だい10問"
	keyWait
	clearMsg
	"""
	つぎのうち、イチバンこうげきりょくが
	タカい ウイルスは?
	"""
	keyWait
	clearMsg
	option
		left = 0
		right = 0
		up = 2
		down = 1
	space
		count = 2
	"スウォードラ\n"
	option
		left = 1
		right = 1
		up = 0
		down = 2
	space
		count = 2
	"スウォーディン\n"
	option
		left = 2
		right = 2
		up = 1
		down = 0
	space
		count = 2
	"スウォータル"
	select
		default = 0
		disableB = true
		clear = true
		targets = [
			jump = 192,
			jump = 192,
			jump = continue,
			jump = continue
		]
	soundPlay
		track = 231
	waitSkip
		frames = 20
	"""
	せいかい・・・
	では、つぎのもんだいだ
	"""
	keyWait
	clearMsg
	jump
		target = 203
}
script 220 mmbn2 {
	checkChapter
		lower = 48
		upper = 255
		jumpIfInRange = 223
		jumpIfOutOfRange = continue
	checkFlag
		flag = 555
		jumpIfTrue = 223
		jumpIfFalse = continue
	checkFlag
		flag = 554
		jumpIfTrue = 222
		jumpIfFalse = continue
	msgOpen
	"""
	ふるびた ランプのスイッチだ・・・
	そうさ できそうにない
	"""
	keyWait
	end
}
script 221 mmbn2 {
	msgOpen
	"もう やは でてこない・・・"
	keyWait
	end
}
script 222 mmbn2 {
	msgOpen
	"""
	ふるびた ランプのスイッチだ・・・
	そうさ できそうにない
	"""
	keyWait
	clearMsg
	"""
	・・・よく見ると、
	スイッチのそくめんに ひそかに
	プラグインようの アナがあいている!
	"""
	keyWait
	end
}
script 223 mmbn2 {
	msgOpen
	"""
	ふるびた ランプのスイッチだ・・・
	そくめんに プラグインようの
	アナが あいている
	"""
	keyWait
	end
}
