# encoding: utf-8
# ForgeryJa::Name
#   日本語の名前関連のダミーデータを生成します
#   一部を除き引数に:to => ForgeryJa::KANA等を指定するとその指定した形式で出力されます
# @example
#   ForgeryJa[:name].last_name #=> "佐藤"
#   ForgeryJa[:name].last_name(:to => ForgeryJa::KANA) #=> "サトウ"
#   ForgeryJa[:name].last_name(:to => ForgeryJa::ARRAY) #=> ["佐藤", "さとう", "サトウ", "ｻﾄｳ", "sato"]
class ForgeryJa::Name < Forgery::Name
  # Returns LastName in Japanese
  #   日本語の名字を返します
  # * 辞書ファイル : last_names_ja
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANJI) 生成する文字の種類を指定します
  def self.last_name(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse(dictionaries[:last_names_ja].random, options[:to])
  end

  # Returns FirstName in Japanese
  #   日本語の名前を返します
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANJI) 生成する文字の種類を指定します
  def self.first_name(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse([dictionaries[:male_first_names_ja], dictionaries[:female_first_names_ja]].random.random, options[:to])
  end

  # Returns FullName in Japanese
  #   日本語のフルネームを返します
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANJI) 生成する文字の種類を指定します
  def self.full_name(options={})
    options = ForgeryJa.default_options(options)
    "#{self.last_name(options)} #{self.first_name(options)}"
  end

  # Returns Male FirstName in Japanese
  #   日本語の男性の名前を返します
  # * 辞書ファイル : male_first_names_ja
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANJI) 生成する文字の種類を指定します
  def self.male_first_name(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse(dictionaries[:male_first_names_ja].random, options[:to])
  end

  # Returns Female FirstName in Japanese
  #   日本語の女性の名前を返します
  # * 辞書ファイル : female_first_names_ja
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANJI) 生成する文字の種類を指定します
  def self.female_first_name(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse(dictionaries[:female_first_names_ja].random, options[:to])
  end

  # Returns CompanyName in Japanese
  #   日本語の企業名を返します
  #   利用している企業は上場企業から適当に抽出しています
  # * 辞書ファイル : company_names_ja
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANJI) 生成する文字の種類を指定します
  def self.company_name(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse(dictionaries[:company_names_ja].random, options[:to])
  end

  # Returns JobTitle in Japanese
  #   日本語の職業名を返します
  # * 辞書ファイル : job_titles_ja
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANJI) 生成する文字の種類を指定します
  def self.job_title(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse(dictionaries[:job_titles_ja].random, options[:to])
  end

  # Returns NameTitle in Japanese
  #   日本語の敬称名を返します
  # * 辞書ファイル : name_titles_ja
  # * optionの指定はできません
  def self.title
    dictionaries[:name_titles_ja].random
  end
end
