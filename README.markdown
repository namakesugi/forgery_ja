ForgeryJa
========

Forgeryにおいて日本語のテストデータを作成します

install
---------

<pre><code>
# Add this to your Gemfile
gem 'forgery'
</code></pre>

<pre><code>
cd vendor/plugins
git clone git://github.com/namakesugi/forgery_ja.git
</code></pre>

Examples
-----------

* Name関連
<pre><code>ForgeryJa(:name).full_name                            # => "山本 健"
ForgeryJa(:name).full_name(ForgeryJa::Name::HIRA)     # => "なかむら しゅん"
ForgeryJa(:name).full_name(ForgeryJa::NameJa::KANA)   # => "フジタ アマネ"
ForgeryJa(:name).full_name(ForgeryJa::NameJa::H_KANA) # => "ﾀﾏｼﾛ ﾕｽﾞﾊ" = half kana
ForgeryJa(:name).full_name(ForgeryJa::NameJa::ROMA)   # => "suzuki midori"
</code></pre>

* 
features
-----------

* Gem化したい(やり方よくわからん)
* Address作る
* 電話番号作る

Copyright
------------

Copyright (c) 2011 NAMAKESUGI, released under the MIT license
