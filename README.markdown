# ForgeryJa

日本語のテストデータを作成します
Forgeryをベースにしています
出力オプションで平仮名・カタカナ・半角カタカナ・ローマ字・配列での出力が可能です
デフォルトは漢字です

Forgeryを継承して作成しており、既存のForgeryコードへ影響はでません

以下のコードはインストール前・後で動作に変更はありません
<pre><code>Forgery(:address).street_name
# => Emmet
</pre></code>

## install

Add Gemfile
<pre><code>gem 'forgery_ja'</code></pre>

## 出力オプション

* ForgeryJa::HIRA(or 1)で平仮名出力
* ForgeryJa::KANA(or 2)でカナ出力
* ForgeryJa::H_KANA(or 3)で半角カナ出力
* ForgeryJa::ROMA(or 4)で半角ローマ字出力
* ForgeryJa::ARRAY(or 5)で配列出力
※一部メソッドは対応してません

## Examples

<pre><code>ForgeryJa(:name).full_name
# => "山本 健"
ForgeryJa(:name).full_name(:to => ForgeryJa::HIRA
# => "なかむら しゅん"
ForgeryJa(:name).full_name(:to => ForgeryJa::KANA)
# => "フジタ アマネ"
ForgeryJa(:name).full_name(:to => ForgeryJa::H_KANA)
# => "ﾀﾏｼﾛ ﾕｽﾞﾊ" ... half kana
ForgeryJa(:name).full_name(:to => ForgeryJa::ROMA)
# => "suzuki midori"
</code></pre>

<pre><code>ForgeryJa(:name).first_name
# => "健"
ForgeryJa(:name).last_name
# => "鈴木"
ForgeryJa(:name).male_first_name
# => "健" ... 男性名
ForgeryJa(:name).female_first_name
# => "千夏" ... 女性名
ForgeryJa(:name).company_name
# => "エンプラス"
ForgeryJa(:name).job_title
# => "医師"
ForgeryJa(:name).title
# => "君"
</code></pre>

### Monetary(お金関連)

<pre><code>ForgeryJa(:monetary).formatted_money
# => 1000円
ForgeryJa(:monetary).money
# => 1000
ForgeryJa(:monetary).popularity_money
# => 1980
</code></pre>

#### options

* ForgeryJa(:monetary).formatted_money(:format => '\%d') #=> \1000
* それぞれ:max => 1000, :min => 500で最大値・最小値指定が可能

<pre><code>ForgeryJa.formatted_money(:max => 10000, :min => 5000)
# => 5000円 - 10000円</code></pre>

### Date(日付関連)

<pre><code>ForgeryJa(:date).month
# => "3月"
ForgeryJa(:date).day_of_week
# => "月曜日"
ForgeryJa(:date).month(:wa => true)
# => "弥生"
ForgeryJa(:date).day_of_week(:abbr => true)
# => "月"</code></pre>

### Mobile(日本携帯関連)

<pre><code>ForgeryJa(:mobile).emoji_unicode
# => Unicode絵文字を出力(Docomo, Kddi, Softbank, Google[*1])
ForgeryJa(:mobile).emoji_sjis
# => Sjis絵文字を出力(Docomo, Kddi, Softbank)
ForgeryJa(:mobile).phone_number
# => 090-xxxx-yyyy (実際には数値)を出力 ... 携帯電話番号
ForgeryJa(:mobile).ip
# => 124.146.175.226 ... 携帯から接続する際のIPアドレス
</code></pre>

[*1] Google絵文字を出力するには:google => trueをオプションに指定する必要があります

## features

* Gem化したい => OK
* Address作る => OK(~>v0.2.0)
* 日本の電話番号を出せるようにする(090-xxxx-xxxx, 0120-xxx...) => OK(~>v0.2.2)
* セキュリティチェックができるサンプルコードを出す(HTMLタグ等)
* 日本語の文章を出す(我輩は猫である等)

## Copyright

Copyright (c) 2011 NAMAKESUGI, released under the MIT license
