@archive 0788FCC
@size 7

script 0 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン、
	うよくエンジンプログラムを
	さがしてくれ!!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"うん!\n"
	flagSet
		flag = 519
	"・・・うわっ!!"
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"どうした ロックマン!?"
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ひこうきのなか、ものスゴイ
	じりょくが はっせいしているよ!
	"""
	keyWait
	end
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"ロックマン、だいじょうぶか!?"
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	flagClear
		flag = 519
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	ハァハァ、だいじょうぶ みたいだけど
	ボクの カラダも、じりょくを
	おびてしまったみたいだ・・・
	"""
	keyWait
	clearMsg
	"""
	もしかすると、ひこうきないの
	じりょくの、えいきょうを
	うけちゃうかもしれないけど・・・
	"""
	keyWait
	clearMsg
	"""
	いくしかないよね!
	熱斗くん、オペレーションよろしくね!
	"""
	keyWait
	clearMsg
	jump
		target = 6
}
