@archive 076A0DC
@size 255

script 0 mmbn2 {
	checkChapter
		lower = 8
		upper = 255
		jumpIfInRange = 10
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ココハ ネットサンノ
	パソコンノ ナカ デス
	"""
	keyWait
	clearMsg
	"""
	ココカラ インターネット、サラニ
	イロンナ トモダチノ タンマツニ
	ツナガッテイマス
	"""
	keyWait
	clearMsg
	"""
	ロックマンサンハ、イツデモ ドコデモ
	Rボタンデ プラグアウト デキマス
	"""
	keyWait
	clearMsg
	"""
	マタハ、ソコミタイニ アオト ミドリノ
	ピカピカガ アルトコロ デモ、
	プラグアウト デキマス
	"""
	keyWait
	end
}
script 1 mmbn2 {
	checkChapter
		lower = 8
		upper = 255
		jumpIfInRange = 11
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	「プラグアウト」ト イウノハ
	ロックマンサンガ デンノウセカイ カラ
	PETノナカニ モドルコトヲ イイマス
	"""
	keyWait
	clearMsg
	"""
	「プラグアウト」 スルト
	HPガ カイフク シマス
	"""
	keyWait
	clearMsg
	"""
	ウイルスニ ヤラレテ ピンチニ ナッタラ
	ムリセズ 「プラグアウト」 スルト
	イイデスヨ
	"""
	keyWait
	end
}
script 2 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	flagAddMail
		flag = 1796
	"熱斗くん、メールだよ!!"
	keyWait
	end
}
script 3 mmbn2 {
	checkChapter
		lower = 8
		upper = 72
		jumpIfInRange = 12
		jumpIfOutOfRange = continue
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	キョウモ オゲンキソウデスネ
	ロックマンサン!
	"""
	keyWait
	clearMsg
	"""
	ボクタチハ パソコンノ ナカデ
	ハタライテル プログラムデス!
	"""
	keyWait
	end
}
script 10 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"ヨットイセーノ ドッコイセ!"
	keyWait
	clearMsg
	"""
	ボクハ イツデモ マジメニ
	ハタラキマース
	"""
	keyWait
	clearMsg
	"""
	ロックマンサン モ
	ガンバッテ クダサイネー!
	"""
	keyWait
	end
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ウントコショ! ホラ ドッコイショ!
	ヨコノ ヤツニハ マケナイゾ!!
	"""
	keyWait
	end
}
script 12 mmbn2 {
	mugshotShow
		mugshot = MrProg
	msgOpen
	"""
	ボクタチハ ゼロト イチトデ
	モノゴトヲ ハンダン シマス
	"""
	keyWait
	clearMsg
	"""
	ダカラ
	チュウトハンパナ コトハ キライデス
	"""
	keyWait
	end
}
