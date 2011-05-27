# ForgeryJa

Forgeryにおいて日本語のテストデータを作成します

## install

Add Gemfile
<pre><code>gem 'forgery'</code></pre>

Clone forgery_ja Plugin
<pre><code>cd vendor/plugins
git clone git://github.com/namakesugi/forgery_ja.git
</code></pre>

## Examples

### Name関連

<pre><code>ForgeryJa(:name).full_name                            # => "山本 健"
ForgeryJa(:name).full_name(ForgeryJa::Name::HIRA)     # => "なかむら しゅん"
ForgeryJa(:name).full_name(ForgeryJa::Name::KANA)     # => "フジタ アマネ"
ForgeryJa(:name).full_name(ForgeryJa::Name::H_KANA)   # => "ﾀﾏｼﾛ ﾕｽﾞﾊ" ... half kana
ForgeryJa(:name).full_name(ForgeryJa::Name::ROMA)     # => "suzuki midori"
ForgeryJa(:name).first_name                           # => "健"
ForgeryJa(:name).last_name                            # => "鈴木"
ForgeryJa(:name).male_first_name                      # => "健" ... 男性名
ForgeryJa(:name).female_first_name                    # => "千夏" ... 女性名
ForgeryJa(:name).company_name                         # => "エンプラス"
ForgeryJa(:name).job_title                            # => "医師"
ForgeryJa(:name).title                                # => "君"
</code></pre>

#### option

* ForgeryJa::Name::HIRA(or 1)で平仮名出力
* ForgeryJa::Name::KANA(or 2)でカナ出力
* ForgeryJa::Name::H_KANA(or 3)で半角カナ出力
* ForgeryJa::Name::ROMA(or 4)で半角ローマ字出力
※titleは対応してません

### Monetary(お金関連)

<pre><code>ForgeryJa(:monetary).formatted_money # => 1000円
ForgeryJa(:monetary).money # => 1000
ForgeryJa(:monetary).popularity_money # => 1980
</code></pre>

#### options

それぞれ:max => 1000, :min => 500で最大値・最小値指定が可能

<pre><code>ForgeryJa.formatted_money(:max => 10000, :min => 5000) # => 5000円 - 10000円</code></pre>

### Date(日付関連)

<pre><code>ForgeryJa(:date).month # => "3月"
ForgeryJa(:date).day_of_week　# => "月曜日"</code></pre>

#### options

<pre><code>ForgeryJa(:date).month(:wa => true) # => "弥生"
ForgeryJa(:date).day_of_week(:abbr => true) # => "月"</code></pre>

## features

* Gem化したい(やり方よくわからん)
* Address作る
* 電話番号作る

## Copyright

Copyright (c) 2011 NAMAKESUGI, released under the MIT license
