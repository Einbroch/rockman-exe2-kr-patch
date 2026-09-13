@archive 077E260
@size 6

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	おまえが クイックマンだな!
	きばくプログラムは
	そうしん させないぞ!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = QuickMan
	msgOpen
	"""
	わらわせる! オレの スピードに
	ついてこれる わけない!
	"""
	keyWait
	clearMsg
	"じゃあもう いくぜ!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = SpeedyDave
	msgOpen
	"クイックマン まあ そうあせるな"
	keyWait
	clearMsg
	"""
	あいては こども じゃないか
	ここは ひとつ かれいに ボクたちの
	テクニックを 見せてやろうよ!
	"""
	keyWait
	clearMsg
	jump
		target = 3
}
script 3 mmbn2 {
	mugshotShow
		mugshot = QuickMan
	msgOpen
	"OK! しょうぶっ!!"
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"""
	ロックマン!
	ヤツの スピードを けいかいしろよ!
	"""
	keyWait
	clearMsg
	"バトルオペレーション! "
	waitSkip
		frames = 30
	"セット!"
	keyWait
	clearMsg
	jump
		target = 5
}
