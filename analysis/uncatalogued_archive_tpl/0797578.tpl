@archive 0797578
@size 30

script 0 mmbn2 {
	msgOpen
	"""
	きゅうけつプログラムに つかまった!!
	HPを すいとられる!!
	"""
	keyWait
	waitHold
}
script 1 mmbn2 {
	msgOpen
	"""
	きゅうけつプログラムに つかまった!!
	しかし きゅうけつきは これいじょう
	HPを すいとれなかった・・・
	"""
	keyWait
	waitHold
}
script 10 mmbn2 {
	msgOpen
	"""
	ゾンビプログラムに つかまった!!
	ゾンビの すみかに つれていかれる!
	"""
	keyWait
	waitHold
}
script 20 mmbn2 {
	msgOpen
	"とうぞくプログラムに つかまった!!\n"
	printBuffer
		minLength = 0
		padZeros = false
		padLeft = false
		buffer = 1
	"ゼニーを ぬすまれた!"
	keyWait
	waitHold
}
script 21 mmbn2 {
	msgOpen
	"""
	とうぞくプログラムに つかまった!!
	しかし とうぞくプログラムは
	ゼニーを うばわず さっていく!
	"""
	keyWait
	waitHold
}
