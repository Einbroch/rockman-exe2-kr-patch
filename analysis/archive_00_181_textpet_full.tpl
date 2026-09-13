@archive 077C068
@size 13

script 0 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	いえの中のガス、おまえの しわざだな!
	すぐに ガスをとめるんだ!
	"""
	keyWait
	clearMsg
	jump
		target = 1
}
script 1 mmbn2 {
	mugshotShow
		mugshot = AirMan
	msgOpen
	"ホアーーーー"
	waitSkip
		frames = 30
	"\nそれはーーーできないーーーー!"
	waitSkip
		frames = 30
	"\nホアーーーー!!"
	keyWait
	clearMsg
	jump
		target = 2
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"ムリさ! "
	waitSkip
		frames = 30
	"""
	エアーマンが きくのは
	オンリー オレの メイレイだけさ!
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
	"!? さっきの ガスがいしゃの!"
	waitSkip
		frames = 30
	"""
	
	なんで ガスがいしゃの くせに
	こんなこと するんだよ!?
	"""
	keyWait
	clearMsg
	jump
		target = 4
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"""
	カイシャなんか カンケーないさ!
	もっと大きな もくてきが あるのさ!
	"""
	keyWait
	clearMsg
	jump
		target = 5
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"やいとに うらみでもあるのかよ!"
	keyWait
	clearMsg
	jump
		target = 6
}
script 6 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"""
	ないさ! 金もちの子なら
	だれでも よかったのさ!
	そうしておけば つぎに、
	"""
	keyWait
	clearMsg
	"""
	「金を ださなきゃ、
	 おまえの子どもが ガスでしぬぜー!」
	って おどした オヤどもから
	"""
	keyWait
	clearMsg
	"""
	1おくゼニーでも 2おくゼニーでも
	ふんだくれるって ものさ!
	"""
	keyWait
	clearMsg
	jump
		target = 7
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"こいつ! なんてヤツだ!"
	keyWait
	clearMsg
	jump
		target = 8
}
script 8 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"""
	お金のために 子どもをねらうなんて!
	ボク、こんな人 ゆるせない!
	"""
	keyWait
	clearMsg
	jump
		target = 9
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Arashi
	msgOpen
	"""
	なんとでも 言うがいいさ!
	おまえも このまま、ガスをすって
	しんでしまうのさ!
	"""
	keyWait
	clearMsg
	jump
		target = 10
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Lan
	msgOpen
	"そううまくは いくもんか!"
	waitSkip
		frames = 30
	"\nいくぜ! ロックマン!"
	waitSkip
		frames = 30
	"\nバトルオペレーション! "
	waitSkip
		frames = 30
	"セット!"
	keyWait
	clearMsg
	jump
		target = 11
}
script 11 mmbn2 {
	mugshotShow
		mugshot = MegaMan
	msgOpen
	"イン!"
	keyWait
	clearMsg
	jump
		target = 12
}
