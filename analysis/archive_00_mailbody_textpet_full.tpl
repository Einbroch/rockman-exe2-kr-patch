@archive 07E3420
@size 129

script 0 mmbn2 {
	msgOpenQuick
	"""
	WWWじけんいこう へっていた
	コンピュータウイルスが、
	このごろ ふたたび ふえています
	"""
	keyWait
	clearMsg
	"""
	ウイルスに 電子ききが おかされると
	こしょうや じこの げんいんと なります
	じゅうぶん 気をつけるように しましょう
	"""
	keyWait
	waitHold
}
script 1 mmbn2 {
	mugshotShow
		mugshot = Mayl
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	まってるっていったけど
	やっぱりシンパイだから・・・
	"""
	keyWait
	clearMsg
	"""
	これ、ロックマンの
	たすけに してあげて・・・
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 1921
		jumpIfTrue = continue
		jumpIfFalse = 128
	soundPlay
		track = 133
	itemGiveChip
		chip = 194
		code = R
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 194
	" "
	printCode
		buffer = 0
		code = R
	"""
	」
	を ゲットした!!
	"""
	keyWait
	waitHold
}
script 2 mmbn2 {
	mugshotShow
		mugshot = Dad
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	ママから きいたぞ 熱斗!
	アメロッパに 行くんだってな!
	パパも さんせいだ!
	"""
	keyWait
	clearMsg
	"""
	パスポートは オフィシャルセンターで
	はっこう してもらえるんだ
	"""
	keyWait
	clearMsg
	"""
	PETから
	データを よみこんで つくるから
	それだけ もってれば OKだ!
	"""
	keyWait
	clearMsg
	"""
	ついでに パパの けんきゅうしつに
	かお 見せにきてくれよ
	"""
	keyWait
	waitHold
}
script 3 mmbn2 {
	mugshotShow
		mugshot = Dad
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	やっかいな、じけんがおこって
	しばらく、いえに かえれそうにないんだ
	"""
	keyWait
	clearMsg
	"熱斗のカオがみたくなったんだ"
	keyWait
	clearMsg
	"""
	オフィシャルセンターの
	エレベーターを、熱斗もつかえるように
	しておいたから、いつでもきてくれ
	"""
	keyWait
	waitHold
}
script 4 mmbn2 {
	mugshotShow
		mugshot = Dex
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	なに やってんだ!
	「オフィシャルスクエア」 に
	早く ロックマンを つれてこい!
	"""
	keyWait
	waitHold
}
script 5 mmbn2 {
	mugshotShow
		mugshot = Mayl
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	熱斗、サブライセンス ゲット
	やったね!
	"""
	keyWait
	clearMsg
	"""
	ね、これが
	わたしの パソコンの パスコードだよ
	こんど ロックマンと あそびにきてね
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 1925
		jumpIfTrue = continue
		jumpIfFalse = 128
	soundPlay
		track = 133
	itemGive
		item = 80
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 80
	"""
	」
	を ゲットした!!
	"""
	keyWait
	waitHold
}
script 6 mmbn2 {
	msgOpenQuick
	printItem
		buffer = 0
		item = 58
	"を おもちの みなさまへ"
	keyWait
	clearMsg
	"""
	オフィシャルセンターでは ただいま
	あたらしく しみんネットバトラーを
	ぼしゅう しています
	"""
	keyWait
	clearMsg
	"""
	ライセンスしけんに ごうかくすれば
	あなたも しみんネットバトラーの
	なかまいり!
	"""
	keyWait
	clearMsg
	"""
	このきかいに ぜひ!
	マリンハーバーの オフィシャルセンター
	まで おこしください!
	"""
	keyWait
	waitHold
}
script 7 mmbn2 {
	mugshotShow
		mugshot = Chaud
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"(本文 ナシ)"
	keyWait
	waitHold
}
script 8 mmbn2 {
	mugshotShow
		mugshot = Chaud
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	きばくそうちの 中にある
	まるい モニターを さがし出せ
	"""
	keyWait
	clearMsg
	"""
	きばくプログラムは
	そこで せいぎょ されているはずだ
	"""
	keyWait
	clearMsg
	"""
	あとは
	おまえの ナビなら なんとかできる
	"""
	keyWait
	waitHold
}
script 9 mmbn2 {
	mugshotShow
		mugshot = Dex
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"あした だったら キャンプ 行くぜッ!"
	keyWait
	clearMsg
	"""
	そのかわり
	たいちょうは オレさま だからな!
	"""
	keyWait
	waitHold
}
script 10 mmbn2 {
	mugshotShow
		mugshot = Yai
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	アンタね! フツー
	せかいりょこうから かえってきた
	つぎの日に キャンプに さそう???
	"""
	keyWait
	clearMsg
	"""
	・・・でもまあ しょみんの くらしぶりを
	しるのも タイセツなこと だから
	つきあってあげる わけよ
	"""
	keyWait
	waitHold
}
script 11 mmbn2 {
	mugshotShow
		mugshot = Mayl
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"しゅくだい おわったんだ♪"
	keyWait
	clearMsg
	"だから あしたのキャンプ OKだよっ!"
	keyWait
	waitHold
}
script 12 mmbn2 {
	mugshotShow
		mugshot = Chaud
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"ひさしぶりだな 光・・・"
	keyWait
	clearMsg
	"""
	だが オフィシャルネットバトラーの
	オレに おまえたちと キャンプに
	行っている ひまなど ない
	"""
	keyWait
	clearMsg
	"""
	それに そうする すじあいも ない
	キャンプに 行くなら かってに行くんだな
	"""
	keyWait
	waitHold
}
script 13 mmbn2 {
	mugshotShow
		mugshot = Dex
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"熱斗、おそいぞ!"
	keyWait
	clearMsg
	"""
	いいか! たいちょうの メイレイだ!
	5ふん いないに バスていまで こい!
	こなかったら おいていっちまうぞっ!
	"""
	keyWait
	waitHold
}
script 14 mmbn2 {
	mugshotHide
	msgOpenQuick
	"""
	先日の ハイジャックじけんの ときは
	タイヘン おセワに なりました
	"""
	keyWait
	clearMsg
	"""
	その おれいに アメロッパこうくうの
	フリーパスの データを
	おくらせて いただきます
	"""
	keyWait
	clearMsg
	"""
	こんご、あのようなじけんが おこらぬよう
	しょくいん いちどう 気を ひきしめて
	きんむに あたっていきます
	"""
	keyWait
	clearMsg
	"""
	なお れいの ひこうきは、
	せいびのため とうぶんの あいだ
	デンサンくうこうに とまって おります
	"""
	keyWait
	clearMsg
	"""
	きかん中は きないを かいほうし
	みなさまに 見学 していただくことに
	なっております
	"""
	keyWait
	clearMsg
	"よろしければ、いちど おたちよりください"
	keyWait
	clearMsg
	"""
	こんごとも、アメロッパこうくうの
	ごあいこを よろしく おねがいします
	"""
	keyWait
	clearMsg
	checkItem
		item = 64
		amount = 1
		jumpIfEqual = 128
		jumpIfGreater = 128
		jumpIfLess = continue
	soundPlay
		track = 133
	itemGive
		item = 64
		amount = 1
	"""
	熱斗は、
	「
	"""
	printItem
		buffer = 0
		item = 64
	"""
	」
	を ゲットした!!
	"""
	keyWait
	waitHold
}
script 15 mmbn2 {
	mugshotHide
	msgOpenQuick
	"""
	世界かくちを おそう しぜんさいがいの
	いきおいは ますいっぽうです
	"""
	keyWait
	clearMsg
	"""
	ニホンでも だんぞくてきに
	つよいじしんが かんそくされており、
	かくちで ヒナンかんこくが出されています
	"""
	keyWait
	clearMsg
	"""
	この先、どれだけ ひがいが ひろがるか
	よそうが できない じょうきょうです
	"""
	keyWait
	waitHold
}
script 16 mmbn2 {
	mugshotShow
		mugshot = Mayl
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	熱斗、ロックマン、
	ロールを さがしてくれて ありがとう
	"""
	keyWait
	clearMsg
	"""
	ふたりとも 気をつけてね、
	ワタシ なんだか
	よくない よかんがして・・・
	"""
	keyWait
	clearMsg
	"""
	やくにたつか わからないけど、
	おまもりだと おもって もっていて
	"""
	keyWait
	clearMsg
	checkFlag
		flag = 1936
		jumpIfTrue = continue
		jumpIfFalse = 128
	soundPlay
		track = 133
	itemGiveChip
		chip = 196
		code = R
		amount = 1
	"""
	熱斗は、
	チップデータ「
	"""
	printChip
		buffer = 0
		chip = 196
	" "
	printCode
		buffer = 0
		code = R
	"""
	」
	を ゲットした!!
	"""
	keyWait
	waitHold
}
script 17 mmbn2 {
	mugshotShow
		mugshot = Chaud
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	伊集院 炎山です
	ちょうさの ちゅうかんほうこく です
	"""
	keyWait
	clearMsg
	"""
	ウラインターネット エリア3に
	ゴスペルかいいんと みられるナビが
	いるようです
	"""
	keyWait
	clearMsg
	"""
	しかし、なぞのコオリが あるため
	そのナビに せっしょくする コトが
	できませんでした
	"""
	keyWait
	clearMsg
	"""
	そのため、ウラインターネットに
	いくための べつルートを
	ちょうさしたトコロ、
	"""
	keyWait
	clearMsg
	"""
	コトブキスクエア いりぐちから
	ウラインターネットにつながる
	ルートが あるコトが わかりました
	"""
	keyWait
	clearMsg
	"""
	しかし、そのルートをつかうには、
	とくしゅなカギを つかうひつようが
	ありそうです
	"""
	keyWait
	clearMsg
	"""
	げんだんかいで、わかっているのは
	いじょうです
	"""
	keyWait
	clearMsg
	"ひきつづき、ちょうさをすすめます"
	keyWait
	waitHold
}
script 18 mmbn2 {
	mugshotHide
	msgOpenQuick
	"""
	先ほど デンサンじしんよちれん から
	出されました はっぴょうに よりますと、
	"""
	keyWait
	clearMsg
	"""
	これから すうじかんごに、かんそくしじょう
	さいだいきぼの じしんが おこる
	かのうせいが たかい、とのことです
	"""
	keyWait
	clearMsg
	"""
	しみんの みなさんは
	ヒナンじょに ヒナンし、
	じしんに そなえて下さい
	"""
	keyWait
	waitHold
}
script 19 mmbn2 {
	mugshotShow
		mugshot = Dad
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	かんきょういじシステムの
	フリーズがとけて せいじょうに
	うごきはじめた
	"""
	keyWait
	clearMsg
	"""
	これで、世界中の
	さいがいも おさまるだろう
	"""
	keyWait
	clearMsg
	"熱斗、ロックマン、よくやったぞ"
	keyWait
	waitHold
}
script 20 mmbn2 {
	msgOpenQuick
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
	"""
	かいぎは、アメロッパにある
	「オフィシャルネットバトラー世界ほんぶ」
	で 行います
	"""
	keyWait
	waitHold
}
script 21 mmbn2 {
	mugshotShow
		mugshot = Mayl
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	さっき、インターネットしてたら
	じしんがおきて・・・
	"""
	keyWait
	clearMsg
	"""
	ロールが インターネットから
	かえってこなくなっちゃったの
	どうしよう!?
	"""
	keyWait
	clearMsg
	"ぜんぜん れんらくもとれないし・・・"
	keyWait
	clearMsg
	"""
	たぶん、アジーナエリアにいると
	おもうんだけど・・・
	"""
	keyWait
	clearMsg
	"ロールになにかあったらワタシ・・・"
	keyWait
	waitHold
}
script 22 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	やあ!
	ワタシは ネットバトルめいじん!
	"""
	keyWait
	clearMsg
	"""
	先日のような じけんが あったからには
	ニホンの ネットバトラーは もっと
	つよくならないと いけないぞ!
	"""
	keyWait
	clearMsg
	"""
	・・・ということで ワタシは
	「ネットバトラーきょうかフェア」を
	かいさい することに した!
	"""
	keyWait
	clearMsg
	"""
	ぜんこくの ネットバトラーしょくん!
	ワタシに ネットバトルで
	ちょうせん するんだ!!
	"""
	keyWait
	clearMsg
	"""
	もし ちょっとホンキの ワタシに
	かてたら 「めいじんの とくせい
	チップフォルダ」を プレゼントしよう!
	"""
	keyWait
	clearMsg
	"""
	めいじんは マリンハーバーの
	オフィシャルセンターで いつでも
	キミの ちょうせんを まっているぞ!!
	"""
	keyWait
	waitHold
}
script 23 mmbn2 {
	mugshotShow
		mugshot = MrFamous
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	フォルダの つかいわけは
	チップフォルダ画面で 行うぞ!
	"""
	keyWait
	clearMsg
	"""
	チップフォルダ画面の フォルダ名の
	ところ、Eマークが ついてるのが
	今 そうびしている フォルダなんだ!
	"""
	keyWait
	clearMsg
	"""
	そうびする フォルダを かえたいときは
	そのフォルダに カーソルを あわせて
	Aボタン、
	"""
	keyWait
	clearMsg
	"""
	そこで そうびを えらべば、
	つぎの バトルから えらんだフォルダで
	たたかうことが できるぞ!
	"""
	keyWait
	clearMsg
	"""
	ただし! 2つの フォルダに
	戦力を ぶんさん してしまうのは
	トクサクとは いえないな
	"""
	keyWait
	clearMsg
	"""
	あくまで メインのフォルダは 1つ、
	もうひとつは とくていの じょうきょうで
	いりょくを はっき できればいい
	"""
	keyWait
	clearMsg
	"""
	ちなみに めいじんは
	ウイルス戦用と つうしんたいせん用とで
	つかいわけているぞ!!
	"""
	keyWait
	waitHold
}
script 24 mmbn2 {
	msgOpenQuick
	"""
	オフィシャルセンターに
	アッシが おいた チップトレーダー、
	みんなは もう あそんだでマスか?
	"""
	keyWait
	clearMsg
	"""
	はじめてあそぶ キミのために
	アッシから あそびかたを
	せつめい してあげるでマス
	"""
	keyWait
	clearMsg
	"""
	チップトレーダーに
	いらないチップを 3まい 入れると
	べつのチップが 1まい 出てくるでマス
	"""
	keyWait
	clearMsg
	"""
	いわば、
	「くじびき」 みたいなものでマス!
	"""
	keyWait
	clearMsg
	"""
	あと、いいチップを 入れても
	出てくるのが いいチップとは
	かぎらないでマス
	"""
	keyWait
	clearMsg
	"""
	なにを入れても 3まいは 3まい、
	すべては・・・キミの ウンしだいでマス!
	"""
	keyWait
	clearMsg
	"""
	ちなみに
	オフィシャルセンターに おいたのは
	ふつうのバージョン でマス
	"""
	keyWait
	clearMsg
	"""
	ほかに スペシャルバージョンや
	レトロバージョンも つくるつもりでマス
	たのしみに しているでマス!!
	"""
	keyWait
	clearMsg
	"""
	・・・
	だいじなことを わすれていたでマス!!
	"""
	keyWait
	clearMsg
	"""
	このチップトレーダーは
	1かい あそぶごとに
	PETに セーブを しているでマス!
	"""
	keyWait
	clearMsg
	"""
	だいじな セーブデータを
	うっかり けしてしまわないように
	チュウイしてください! 
	"""
	waitSkip
		frames = 15
	"でマス!!"
	keyWait
	waitHold
}
script 25 mmbn2 {
	msgOpenQuick
	"""
	さきほど メトロラインマリン駅で
	バクダンが バクハツする
	さわぎが ありました
	"""
	keyWait
	clearMsg
	"""
	バクダンは こがたで
	ひがいは さほど大きくなく、
	"""
	keyWait
	clearMsg
	"""
	げんざいの ところ
	ケガ人とうは かくにん されていない、
	との じょうほうです
	"""
	keyWait
	waitHold
}
script 26 mmbn2 {
	mugshotShow
		mugshot = Yai
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	おみやげが ほしくなったので
	かってきて ください
	"""
	keyWait
	waitHold
}
script 27 mmbn2 {
	mugshotShow
		mugshot = Mom
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	さっき
	おこづかい わたすの わすれてたから
	メールで おくるわね
	"""
	keyWait
	clearMsg
	"""
	たまには ママだって
	ドーンと ふんぱつ するのよ!
	"""
	keyWait
	clearMsg
	"""
	って ホントは ずっとあずかってた
	熱斗の おとしだま なんだけどね・・・
	"""
	keyWait
	clearMsg
	"じゃあ 気をつけてね"
	keyWait
	clearMsg
	checkFlag
		flag = 1947
		jumpIfTrue = continue
		jumpIfFalse = 128
	checkGiveZenny
		amount = 3000
		jumpIfAll = continue
		jumpIfNone = continue
		jumpIfSome = continue
	"""
	熱斗は、
	「3000ゼニー」
	を ゲットした!!
	"""
	keyWait
	waitHold
}
script 28 mmbn2 {
	msgOpenQuick
	"""
	「オフィシャルネットバトラーかいぎ」の
	かいぎじょうに ついて おしらせします
	"""
	keyWait
	clearMsg
	"""
	ゴスペルの ぼうがいこうさくを
	さけるため、かいぎじょうは
	ごくひに なっております
	"""
	keyWait
	clearMsg
	"""
	ネットバトラーの みなさんは
	みずからの手で かいぎじょうを
	さがして ごしゅっせき 下さい
	"""
	keyWait
	clearMsg
	"""
	オフィシャルが むせきにんと いわないで
	しんじられるのは じぶんだけ
	ロックマン.EXEという ナビもきます
	"""
	keyWait
	waitHold
}
script 29 mmbn2 {
	msgOpenQuick
	"""
	ゴスペルが
	いぜん かつどうを つづけている
	という ぎわくアリ
	"""
	keyWait
	clearMsg
	"""
	しきゅう コトブキスクエアを
	さいちょうさ せよ!
	"""
	keyWait
	waitHold
}
script 30 mmbn2 {
	msgOpenQuick
	"""
	こんどは レトロチップトレーダーを
	せっち したでマス!
	"""
	keyWait
	clearMsg
	"""
	あそびかたは きほんてきに
	ふつうの チップトレーダーと おなじ
	でマスが、
	"""
	keyWait
	clearMsg
	"""
	入れるチップが
	「ロックマンエグゼ(1)」の
	チップに なっているんでマス
	"""
	keyWait
	clearMsg
	"""
	「ロックマンエグゼ(1)」を
	もっている みんなに ちょっとおトクな
	マシンな わけでマス
	"""
	keyWait
	clearMsg
	"""
	それと、レトロチップトレーダーは
	ひとり 1回しか つかえないでマス
	ちゅういする でマスよ
	"""
	keyWait
	clearMsg
	"""
	ちゅうもくの せっちばしょ でマスが
	・・・
	"""
	keyWait
	clearMsg
	"""
	ヒミツ でマス!
	みんな さがしてみるでマス!
	"""
	keyWait
	waitHold
}
script 31 mmbn2 {
	mugshotShow
		mugshot = Dad
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	ガッツタイプの スタイルでは、
	まず バスターの攻撃力が 2バイになる
	"""
	keyWait
	clearMsg
	"""
	そのかわり 連射力は さいていに
	なってしまうが、それでも じゅうぶんな
	つよさを もっていると いえるだろう
	"""
	keyWait
	clearMsg
	"""
	そして てきの攻撃を うけても
	のけぞってしまう ことがない
	ということは・・・
	"""
	keyWait
	clearMsg
	"""
	チップを つかおうとしたときに
	攻撃を くらって、攻撃が できなかった
	なんてことも なくなるわけだ
	"""
	keyWait
	clearMsg
	"""
	力おしで つきすすむ!
	これこそが ガッツだ!
	ガンガンいけ! 熱斗!
	"""
	keyWait
	waitHold
}
script 32 mmbn2 {
	mugshotShow
		mugshot = Dad
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	カスタムタイプの スタイルでは、
	カスタム画面で えらべる
	チップの せんたくしが、
	"""
	keyWait
	clearMsg
	"""
	なんと さいしょから 7まいの
	じょうたいに なっている
	"""
	keyWait
	clearMsg
	"""
	ADDで フォルダオープンする
	てまが はぶけるわけだな
	"""
	keyWait
	clearMsg
	"""
	チップを つぎつぎ つなげて
	あざやかに たおす!
	これこそが カスタムスタイルだ!
	"""
	keyWait
	clearMsg
	"""
	いろんな くみあわせを
	さぐっていけ! 熱斗!
	"""
	keyWait
	waitHold
}
script 33 mmbn2 {
	mugshotShow
		mugshot = Dad
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	ブラザータイプの スタイルでは、
	1つのフォルダに ナビチップを
	8まいまで 入れられるようになる
	"""
	keyWait
	clearMsg
	"""
	やはり もつべきものは なかまと
	いうことだ!
	"""
	keyWait
	clearMsg
	"""
	なかまを たくさん あつめていけ!
	熱斗!
	"""
	keyWait
	waitHold
}
script 34 mmbn2 {
	mugshotShow
		mugshot = Dad
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	シールドタイプのスタイルでは、
	バトルが はじまったときに さいしょから
	バリアが ついている・・・オトクだろ?
	"""
	keyWait
	clearMsg
	"""
	そして、バトル中 いつでも
	Bボタンを おしたちょくごに
	すぐ 十字ボタンを 左にいれると、
	"""
	keyWait
	clearMsg
	"""
	シールドを つかって
	ガードすることが できるようになる
	"""
	keyWait
	clearMsg
	"""
	たまに ガードできない きょうりょくな
	はかい力を もつ攻撃もあるが、それは
	熱斗じしんが さがし出すんだ!
	"""
	keyWait
	clearMsg
	"ぼうぎょこそ さいだいの攻撃!"
	keyWait
	clearMsg
	"""
	まもるときは まもりながら
	タイミングを みはからって
	一気に せめたてるんだ! 熱斗!
	"""
	keyWait
	waitHold
}
script 35 mmbn2 {
	mugshotShow
		mugshot = Dad
	mugshotPalette
		palette = 1
	msgOpenQuick
	mugshotAnimate
		animation = 0
	"""
	サイトスタイルは
	ロックマンの せんざいのうりょくを
	100% ひき出せる スタイルだ
	"""
	keyWait
	clearMsg
	"""
	すなわち、サイトスタイルのときは
	あらゆる スタイルの せいのうが
	どうじに はつげん しているんだ
	"""
	keyWait
	clearMsg
	"バスターの 攻撃力は 2バイ・・・"
	keyWait
	clearMsg
	"""
	カスタム画面で
	さいしょから えらべるチップは
	なんと 10まい!・・・
	"""
	keyWait
	clearMsg
	"""
	1つのフォルダに ナビチップを
	8まいまで 入れることが でき・・・
	"""
	keyWait
	clearMsg
	"""
	バリアは ひょうじゅんそうび、
	そして バトル中 いつでも、
	"""
	keyWait
	clearMsg
	"""
	Bボタンを おした ちょくごに
	十字ボタンを 左に いれることで
	シールドをつかって ガードができる!
	"""
	keyWait
	clearMsg
	"""
	ただし、ロックマンの カラダのほうが
	ついていけないため、
	"""
	keyWait
	clearMsg
	"""
	HPは
	つうじょうの はんぶんの じょうたいに
	なってしまうぞ!
	"""
	keyWait
	clearMsg
	"""
	サイトスタイルは
	つよさと もろさを かねそなえた
	こうどな スタイルだ!
	"""
	keyWait
	clearMsg
	"""
	すべては
	オペレーティングに かかっているぞ
	おまえの がんばりしだいだ! 熱斗!
	"""
	keyWait
	waitHold
}
script 36 mmbn2 {
	msgOpenQuick
	"MAIL24 せつめい"
	keyWait
	waitHold
}
script 37 mmbn2 {
	msgOpenQuick
	"MAIL25 せつめい"
	keyWait
	waitHold
}
script 38 mmbn2 {
	msgOpenQuick
	"MAIL26 せつめい"
	keyWait
	waitHold
}
script 39 mmbn2 {
	msgOpenQuick
	"MAIL27 せつめい"
	keyWait
	waitHold
}
script 40 mmbn2 {
	msgOpenQuick
	"MAIL28 せつめい"
	keyWait
	waitHold
}
script 41 mmbn2 {
	msgOpenQuick
	"MAIL29 せつめい"
	keyWait
	waitHold
}
script 42 mmbn2 {
	msgOpenQuick
	"MAIL2A せつめい"
	keyWait
	waitHold
}
script 43 mmbn2 {
	msgOpenQuick
	"MAIL2B せつめい"
	keyWait
	waitHold
}
script 44 mmbn2 {
	msgOpenQuick
	"MAIL2C せつめい"
	keyWait
	waitHold
}
script 45 mmbn2 {
	msgOpenQuick
	"MAIL2D せつめい"
	keyWait
	waitHold
}
script 46 mmbn2 {
	msgOpenQuick
	"MAIL2E せつめい"
	keyWait
	waitHold
}
script 47 mmbn2 {
	msgOpenQuick
	"MAIL2F せつめい"
	keyWait
	waitHold
}
script 48 mmbn2 {
	msgOpenQuick
	"MAIL30 せつめい"
	keyWait
	waitHold
}
script 49 mmbn2 {
	msgOpenQuick
	"MAIL31 せつめい"
	keyWait
	waitHold
}
script 50 mmbn2 {
	msgOpenQuick
	"MAIL32 せつめい"
	keyWait
	waitHold
}
script 51 mmbn2 {
	msgOpenQuick
	"MAIL33 せつめい"
	keyWait
	waitHold
}
script 52 mmbn2 {
	msgOpenQuick
	"MAIL34 せつめい"
	keyWait
	waitHold
}
script 53 mmbn2 {
	msgOpenQuick
	"MAIL35 せつめい"
	keyWait
	waitHold
}
script 54 mmbn2 {
	msgOpenQuick
	"MAIL36 せつめい"
	keyWait
	waitHold
}
script 55 mmbn2 {
	msgOpenQuick
	"MAIL37 せつめい"
	keyWait
	waitHold
}
script 56 mmbn2 {
	msgOpenQuick
	"MAIL38 せつめい"
	keyWait
	waitHold
}
script 57 mmbn2 {
	msgOpenQuick
	"MAIL39 せつめい"
	keyWait
	waitHold
}
script 58 mmbn2 {
	msgOpenQuick
	"MAIL3A せつめい"
	keyWait
	waitHold
}
script 59 mmbn2 {
	msgOpenQuick
	"MAIL3B せつめい"
	keyWait
	waitHold
}
script 60 mmbn2 {
	msgOpenQuick
	"MAIL3C せつめい"
	keyWait
	waitHold
}
script 61 mmbn2 {
	msgOpenQuick
	"MAIL3D せつめい"
	keyWait
	waitHold
}
script 62 mmbn2 {
	msgOpenQuick
	"MAIL3E せつめい"
	keyWait
	waitHold
}
script 63 mmbn2 {
	msgOpenQuick
	"MAIL3F せつめい"
	keyWait
	waitHold
}
script 64 mmbn2 {
	msgOpenQuick
	"MAIL40 せつめい"
	keyWait
	waitHold
}
script 65 mmbn2 {
	msgOpenQuick
	"MAIL41 せつめい"
	keyWait
	waitHold
}
script 66 mmbn2 {
	msgOpenQuick
	"MAIL42 せつめい"
	keyWait
	waitHold
}
script 67 mmbn2 {
	msgOpenQuick
	"MAIL43 せつめい"
	keyWait
	waitHold
}
script 68 mmbn2 {
	msgOpenQuick
	"MAIL44 せつめい"
	keyWait
	waitHold
}
script 69 mmbn2 {
	msgOpenQuick
	"MAIL45 せつめい"
	keyWait
	waitHold
}
script 70 mmbn2 {
	msgOpenQuick
	"MAIL46 せつめい"
	keyWait
	waitHold
}
script 71 mmbn2 {
	msgOpenQuick
	"MAIL47 せつめい"
	keyWait
	waitHold
}
script 72 mmbn2 {
	msgOpenQuick
	"MAIL48 せつめい"
	keyWait
	waitHold
}
script 73 mmbn2 {
	msgOpenQuick
	"MAIL49 せつめい"
	keyWait
	waitHold
}
script 74 mmbn2 {
	msgOpenQuick
	"MAIL4A せつめい"
	keyWait
	waitHold
}
script 75 mmbn2 {
	msgOpenQuick
	"MAIL4B せつめい"
	keyWait
	waitHold
}
script 76 mmbn2 {
	msgOpenQuick
	"MAIL4C せつめい"
	keyWait
	waitHold
}
script 77 mmbn2 {
	msgOpenQuick
	"MAIL4D せつめい"
	keyWait
	waitHold
}
script 78 mmbn2 {
	msgOpenQuick
	"MAIL4E せつめい"
	keyWait
	waitHold
}
script 79 mmbn2 {
	msgOpenQuick
	"MAIL4F せつめい"
	keyWait
	waitHold
}
script 80 mmbn2 {
	msgOpenQuick
	"MAIL50 せつめい"
	keyWait
	waitHold
}
script 81 mmbn2 {
	msgOpenQuick
	"MAIL51 せつめい"
	keyWait
	waitHold
}
script 82 mmbn2 {
	msgOpenQuick
	"MAIL52 せつめい"
	keyWait
	waitHold
}
script 83 mmbn2 {
	msgOpenQuick
	"MAIL53 せつめい"
	keyWait
	waitHold
}
script 84 mmbn2 {
	msgOpenQuick
	"MAIL54 せつめい"
	keyWait
	waitHold
}
script 85 mmbn2 {
	msgOpenQuick
	"MAIL55 せつめい"
	keyWait
	waitHold
}
script 86 mmbn2 {
	msgOpenQuick
	"MAIL56 せつめい"
	keyWait
	waitHold
}
script 87 mmbn2 {
	msgOpenQuick
	"MAIL57 せつめい"
	keyWait
	waitHold
}
script 88 mmbn2 {
	msgOpenQuick
	"MAIL58 せつめい"
	keyWait
	waitHold
}
script 89 mmbn2 {
	msgOpenQuick
	"MAIL59 せつめい"
	keyWait
	waitHold
}
script 90 mmbn2 {
	msgOpenQuick
	"MAIL5A せつめい"
	keyWait
	waitHold
}
script 91 mmbn2 {
	msgOpenQuick
	"MAIL5B せつめい"
	keyWait
	waitHold
}
script 92 mmbn2 {
	msgOpenQuick
	"MAIL5C せつめい"
	keyWait
	waitHold
}
script 93 mmbn2 {
	msgOpenQuick
	"MAIL5D せつめい"
	keyWait
	waitHold
}
script 94 mmbn2 {
	msgOpenQuick
	"MAIL5E せつめい"
	keyWait
	waitHold
}
script 95 mmbn2 {
	msgOpenQuick
	"MAIL5F せつめい"
	keyWait
	waitHold
}
script 96 mmbn2 {
	msgOpenQuick
	"MAIL60 せつめい"
	keyWait
	waitHold
}
script 97 mmbn2 {
	msgOpenQuick
	"MAIL61 せつめい"
	keyWait
	waitHold
}
script 98 mmbn2 {
	msgOpenQuick
	"MAIL62 せつめい"
	keyWait
	waitHold
}
script 99 mmbn2 {
	msgOpenQuick
	"MAIL63 せつめい"
	keyWait
	waitHold
}
script 100 mmbn2 {
	msgOpenQuick
	"MAIL64 せつめい"
	keyWait
	waitHold
}
script 101 mmbn2 {
	msgOpenQuick
	"MAIL65 せつめい"
	keyWait
	waitHold
}
script 102 mmbn2 {
	msgOpenQuick
	"MAIL66 せつめい"
	keyWait
	waitHold
}
script 103 mmbn2 {
	msgOpenQuick
	"MAIL67 せつめい"
	keyWait
	waitHold
}
script 104 mmbn2 {
	msgOpenQuick
	"MAIL68 せつめい"
	keyWait
	waitHold
}
script 105 mmbn2 {
	msgOpenQuick
	"MAIL69 せつめい"
	keyWait
	waitHold
}
script 106 mmbn2 {
	msgOpenQuick
	"MAIL6A せつめい"
	keyWait
	waitHold
}
script 107 mmbn2 {
	msgOpenQuick
	"MAIL6B せつめい"
	keyWait
	waitHold
}
script 108 mmbn2 {
	msgOpenQuick
	"MAIL6C せつめい"
	keyWait
	waitHold
}
script 109 mmbn2 {
	msgOpenQuick
	"MAIL6D せつめい"
	keyWait
	waitHold
}
script 110 mmbn2 {
	msgOpenQuick
	"MAIL6E せつめい"
	keyWait
	waitHold
}
script 111 mmbn2 {
	msgOpenQuick
	"MAIL6F せつめい"
	keyWait
	waitHold
}
script 112 mmbn2 {
	msgOpenQuick
	"MAIL70 せつめい"
	keyWait
	waitHold
}
script 113 mmbn2 {
	msgOpenQuick
	"MAIL71 せつめい"
	keyWait
	waitHold
}
script 114 mmbn2 {
	msgOpenQuick
	"MAIL72 せつめい"
	keyWait
	waitHold
}
script 115 mmbn2 {
	msgOpenQuick
	"MAIL73 せつめい"
	keyWait
	waitHold
}
script 116 mmbn2 {
	msgOpenQuick
	"MAIL74 せつめい"
	keyWait
	waitHold
}
script 117 mmbn2 {
	msgOpenQuick
	"MAIL75 せつめい"
	keyWait
	waitHold
}
script 118 mmbn2 {
	msgOpenQuick
	"MAIL76 せつめい"
	keyWait
	waitHold
}
script 119 mmbn2 {
	msgOpenQuick
	"MAIL77 せつめい"
	keyWait
	waitHold
}
script 120 mmbn2 {
	msgOpenQuick
	"MAIL78 せつめい"
	keyWait
	waitHold
}
script 121 mmbn2 {
	msgOpenQuick
	"MAIL79 せつめい"
	keyWait
	waitHold
}
script 122 mmbn2 {
	msgOpenQuick
	"MAIL7A せつめい"
	keyWait
	waitHold
}
script 123 mmbn2 {
	msgOpenQuick
	"MAIL7B せつめい"
	keyWait
	waitHold
}
script 124 mmbn2 {
	msgOpenQuick
	"MAIL7C せつめい"
	keyWait
	waitHold
}
script 125 mmbn2 {
	msgOpenQuick
	"MAIL7D せつめい"
	keyWait
	waitHold
}
script 126 mmbn2 {
	msgOpenQuick
	"MAIL7E せつめい"
	keyWait
	waitHold
}
script 127 mmbn2 {
	msgOpenQuick
	waitHold
}
