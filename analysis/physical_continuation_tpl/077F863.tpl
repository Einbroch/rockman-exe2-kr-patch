@archive 077F863
@size 2

script 0 mmbn2 {
	mugshotShow
		mugshot = OfficialMan
	msgOpen
	"""
	ちょっと キミの PETを
	見せてもらえるかな?
	"""
	keyWait
	clearMsg
	"""
	じゃあ
	データを しょうかい させてもらうよ
	"""
	keyWait
	clearMsg
	controlLock
	soundDisableTextSFX
	soundPlay
		track = 266
	mugshotAnimate
		animation = 0
	"カタカタカタ"
	wait
		frames = 86
	controlUnlock
	keyWait
	clearMsg
	soundEnableTextSFX
	mugshotAnimate
		animation = 1
	"""
	うーん・・・
	まだ けいけんが たりないみたいだね
	"""
	keyWait
	clearMsg
	"""
	Aライセンスを とるには、
	しみんネットバトラーとして じけんを
	いくつか かいけつしないと いけないんだ
	"""
	keyWait
	clearMsg
	"""
	じけんを かいけつすると
	いらいしゃから ココに れんらくが
	くるように なっていて、
	"""
	keyWait
	clearMsg
	"""
	それをもとに こちらで
	じゅけんしかくが あるか どうか
	はんだん するんだが・・・
	"""
	keyWait
	clearMsg
	"そうだな・・・"
	keyWait
	clearMsg
	"""
	じゃあ、今 ワタシが うけおっている
	いらいが 3つ あるんだが
	それを キミに まかせよう
	"""
	keyWait
	clearMsg
	"""
	どれも てごわい いらいばかりだが
	けいけんを つむには さいてきだ
	"""
	keyWait
	clearMsg
	"""
	いらいけいじばん には、
	とくべつにんむ というカタチで
	かきこんでおくよ
	"""
	keyWait
	clearMsg
	"けいけんをつんで またココに きたまえ"
	keyWait
	clearMsg
	"""
	でも、
	あんまり ムチャしたら ダメだぞ
	"""
	keyWait
	end
	"   "
}
