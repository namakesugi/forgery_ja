# coding: utf-8
class ForgeryJa::Address < Forgery::Address
  # Returns Zipcode in Japanese
  #   日本の郵便番号を返します
  #
  # @param Hash options
  # @option options [Boolean] :hyphen (true) ハイフン(-)を含めるかどうかを指定します
  # @return [String]
  # @example
  #   ForgeryJa(:address).zip
  #   # => "123-4567"
  #   ForgeryJa(:address).zip(:hyphen => true)
  #   # => "1234567"
  def self.zip(options={})
    options = {:hyphen => true}.merge(options)
    format = ( options[:hyphen] ? "###-####" : "#######" )
    format.to_numbers
  end

  # Returns StateName in Japanese
  #   都道府県名を返します
  #
  # dictionary file name : states_ja
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANA) 生成する文字の種類を指定します
  # @return [String]
  # @example
  #   ForgeryJa(:address).state
  #   # => "東京都"
  #   ForgeryJa(:address).state(ForgeryJa::KANA)
  #   # => "トウキョウト"
  def self.state(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse(dictionaries[:states_ja].random, options[:to])
  end

  # Returns CityName in Japanese
  #   郡市区を返します
  #
  # dictionary file name : cities_ja
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANA) 生成する文字の種類を指定します
  # @return [String]
  # @example
  #   ForgeryJa(:address).city
  #   # => 鉾田市
  def self.city(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse(dictionaries[:cities_ja].random, options[:to])
  end

  # Returns StreetName in Japanese
  #   町名を返します
  #
  # dictionary file name : streets_ja
  # @param Hash options
  # @option options [Fixnum] :to (ForgeryJa::KANA) 生成する文字の種類を指定します
  # @return [String]
  # @example
  #   ForgeryJa(:address).street_name
  #   # => 富士見町
  def self.street_name(options={})
    options = ForgeryJa.default_options(options)
    ForgeryJa.parse(dictionaries[:streets_ja].random, options[:to])
  end

  # Returns StreetName in Japanese
  #   番地を返します
  #
  # format file name : streets_number_ja
  # @return [String]
  # @example
  #   ForgeryJa(:address).streets_number
  #   # => "1234-5"
  def self.street_number
    formats[:street_number_ja].random.to_numbers
  end

  # Returns FullAddress in Japanese
  #   完全な住所を返します
  #
  # @param Hash options
  # @option options [Boolean] :state (true) 都道府県を含めるかどうか
  # @option options [Boolean] :city (true) 群市区を含めるかどうか
  # @option options [Boolean] :street (true) 町名を含めるかどうか
  # @option options [Boolean] :number (true) 番地を含めるかどうか
  # @option options [Boolean] :blank (false) それぞれのフィールドを半角スペースで区切るかどうか
  # @option options [Fixnum] :to (ForgeryJa::KANA) 生成する文字の種類を指定します
  # @return [String]
  # @example
  #   ForgeryJa(:address).full_address(:blank => true)
  #   # => "愛媛県 掛川市 大手町 4-6-2"
  #   ForgerJa(:address).full_address(ForgeryJa::ARRAY)
  #   # => ["大阪府甘楽郡下仁田町山池町0-9-8", "おおさかふかんらぐんしもにたまちやまいけちょう0-9-8", "オオサカフカンラグンシモニタマチヤマイケチョウ0-9-8", "ｵｵｻｶﾌｶﾝﾗｸﾞﾝｼﾓﾆﾀﾏﾁﾔﾏｲｹﾁｮｳ0-9-8", "OsakaKanra-gun Shimonita-machiYamaike-cho0-9-8"]
  def self.full_address(options={})
    options = {:blank => false}.merge(ForgeryJa.default_options(options))
    list = address_list(options)

    result = []
    result = list[:state] if list[:state]
    result = list_merge(result, list[:city], options[:blank])
    result = list_merge(result, list[:street], options[:blank])
    result.collect!{|f| f + (options[:blank] ? ' ':'') + list[:number] } if list[:number]
    options[:to] == ForgeryJa::ARRAY ? result : result[options[:to]]
  end

  # Returns AddressList in Japanese
  #   日本語の住所のリストを生成して返します
  #
  # @param Hash options
  # @option options [Boolean] :state (true) 都道府県を含めるかどうか
  # @option options [Boolean] :city (true) 群市区を含めるかどうか
  # @option options [Boolean] :street (true) 町名を含めるかどうか
  # @option options [Boolean] :number (true) 番地を含めるかどうか
  # @return [Hash]
  # @example
  #   ForgeryJa(:address).address_list
  #   # => {:state=>["大阪府", "おおさかふ", "オオサカフ", "ｵｵｻｶﾌ", "Osaka"], :city=>["新宿区", "しんじゅくく", "シンジュクク", "ｼﾝｼﾞｭｸｸ", "Shinjyuku-ku"], :street=>["高倉町", "たかくらちょう", "タカクラチョウ", "ﾀｶｸﾗﾁｮｳ", "Takakura-cho"], :number=>"6750-0"}
  def self.address_list(options={})
    options = {:state => true, :city => true, :street => true, :number => true}.merge(options)
    list = {}
    list[:state] = state(:to => ForgeryJa::ARRAY) if options[:state]
    list[:city] = city(:to => ForgeryJa::ARRAY) if options[:city]
    list[:street] = street_name(:to => ForgeryJa::ARRAY) if options[:street]
    list[:number] = street_number if options[:number]
    list
  end

  private
  # Arrayの各列をmergeします
  #
  # @example
  #   list_merge(['x', 'y'], ['1', '2'], true)
  #   # => ['x 1', 'y 2']
  def self.list_merge(target, data, blank=true)
    return data if target.size == 0
    return target if data.size == 0
    target.zip(data).map{|f| f.join blank ? ' ' : ''}
  end
end

