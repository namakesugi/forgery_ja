# encoding: utf-8
class ForgeryJa::Name < Forgery::Name
  # Define RET_TYPE : Kanji
  KANJI = 0
  # Define RET_TYPE : Hiragana
  HIRA = 1
  # Define RET_TYPE : Katakana
  KANA = 2
  # Define RET_TYPE : Half Katakana
  H_KANA = 3
  # Define RET_TYPE : Romaji
  ROMA = 4

  # Returns LastName in Japanese
  # @params ret_type [Fixnum] 戻す形を指定します
  # @example
  #   Forgery[:name_ja].last_name #=> "佐藤"
  #   Forgery[:name_ja].last_name(Forgery::NameJa::HIRA) #=> "さとう"
  #   Forgery[:name_ja].last_name(Forgery::NameJa::KANA) #=> "サトウ"
  #   Forgery[:name_ja].last_name(Forgery::NameJa::H_KANA) #=> "ｻﾄｳ" = half kana
  #   Forgery[:name_ja].last_name(Forgery::NameJa::ROMA) #=> "sato"
  #   Forgery[:name_ja].last_name(nil) #=> ["佐藤", "さとう", "サトウ", "ｻﾄｳ", "sato"]
  def self.last_name(ret_type=KANJI)
    parse(dictionaries[:last_names_ja].random, ret_type)
  end

  def self.first_name(ret_type=KANJI)
    parse([dictionaries[:male_first_names_ja], dictionaries[:female_first_names_ja]].random.random, ret_type)
  end

  def self.full_name(ret_type=KANJI)
    "#{self.last_name(ret_type)} #{self.first_name(ret_type)}"
  end

  def self.male_first_name(ret_type=KANJI)
    parse(dictionaries[:male_first_names_ja].random, ret_type)
  end

  def self.female_first_name(ret_type=KANJI)
    parse(dictionaries[:female_first_names_ja].random, ret_type)
  end

  def self.company_name(ret_type=KANJI)
    parse(dictionaries[:company_names_ja].random, ret_type)
  end

  def self.job_title(ret_type=KANJI)
    parse(dictionaries[:job_titles_ja].random, ret_type)
  end

  def self.title
    dictionaries[:name_titles_ja].random
  end

  private
  def self.parse(str, ret_type)
    strs = str.split(' ')
    ret_type ? strs[ret_type] : strs
  end
end
