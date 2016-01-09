# coding: utf-8

class ForgeryJa::Mobile < ForgeryJa
  # Return Unicode Emoji
  #   optionsで指定したキャリアの絵文字をUnicodeで返します
  # @param [Hash] options キャリア指定
  # @option options [boolean] :docomo (true) Docomo絵文字を返すかどうか
  # @option options [boolean] :kddi (true) Kddi絵文字を返すかどうか
  # @option options [boolean] :softbank (true) Softbank絵文字を返すかどうか
  # @option options [boolean] :google (false) Google絵文字を返すかどうか
  # @return [String] Unicode絵文字
  def self.emoji_unicode(options={})
    options = { :docomo => true, :kddi => true, :softbank => true, :google => false }.merge(options)
    list = []
    list << emoji_docomo_unicode if options[:docomo]
    list << emoji_kddi_unicode if options[:kddi]
    list << emoji_softbank_unicode if options[:softbank]
    list << emoji_google_unicode if options[:google]
    list.random
  end

  # Return Sjis Emoji
  #   optionsで指定したキャリアの絵文字をSjisで返します
  # @param [Hash] options キャリア指定
  # @option options [boolean] :docomo (true) Docomo絵文字を返すかどうか
  # @option options [boolean] :kddi (true) Kddi絵文字を返すかどうか
  # @option options [boolean] :softbank (true) Softbank絵文字を返すかどうか
  # @return [String] Sjis絵文字
  def self.emoji_sjis(options={})
    options = { :docomo => true, :kddi => true, :softbank => true }.merge(options)
    list = []
    list << emoji_docomo_sjis if options[:docomo]
    list << emoji_kddi_sjis if options[:kddi]
    list << emoji_softbank_sjis if options[:softbank]
    list.random
  end

  # Returns Mobile Phone Number in Japaneses
  #   携帯電話番号を返します
  # @param [Hash] options
  # @option options [boolean] :hyphen (true) ハイフンを含めるかどうか
  # @return [String]
  def self.phone_number(options={})
    options = {:hyphen => true}.merge(options)
    local_office_number_prefix = Kernel.rand(1..9)
    format = ( options[:hyphen] ? "-#{local_office_number_prefix}###-####" : "#{local_office_number_prefix}#######" )
    ["090", "080", "070"].random + format.to_numbers
  end

  # Returns Mobile IP
  #   携帯電話から接続する際のIPアドレスを返します
  # @param [Hash] options キャリア指定
  # @option options [boolean] :docomo (true) DocomoのIPを返すかどうか
  # @option options [boolean] :kddi (true) KddiのIPを返すかどうか
  # @option options [boolean] :softbank (true) SoftbankのIPを返すかどうか
  # @return [String] ipアドレス
  # @example
  #   ForgeryJa(:mobile).ip
  #   # => 124.146.175.254
  def self.ip(options={})
    options = { :docomo => true, :kddi => true, :softbank => true }.merge(options)
    list = []
    list << docomo_ip if options[:docomo]
    list << kddi_ip if options[:kddi]
    list << softbank_ip if options[:softbank]
    list.random
  end
  
  # Docomoの絵文字をUnicodeで返します
  def self.emoji_docomo_unicode
    Emoji::Docomo.list.random
  end

  # Docomoの絵文字をSjisで返します
  def self.emoji_docomo_sjis
    emoji_docomo_unicode.encode("SJIS-DOCOMO")
  end

  # Kddiの絵文字をUnicodeで返します
  def self.emoji_kddi_unicode
    Emoji::Kddi.list.random
  end

  # Kddiの絵文字をSjisで返します
  def self.emoji_kddi_sjis
    emoji_kddi_unicode.encode("SJIS-KDDI")
  end

  # Softbankの絵文字をUnicodeで返します
  def self.emoji_softbank_unicode
    Emoji::Softbank.list.random
  end

  # Softbankの絵文字をSjisで返します
  def self.emoji_softbank_sjis
    emoji_softbank_unicode.encode("SJIS-SOFTBANK")
  end

  # Googleの絵文字をUnicodeで返します
  def self.emoji_google_unicode
    Emoji::Google.list.random
  end

  # DocomoのIPアドレスを返します
  #   返すIPはimode接続時のIPとなります
  #   フルブラウザの場合は異なるIPとなるようです
  # @see http://www.nttdocomo.co.jp/service/imode/make/content/ip/index.html
  def self.docomo_ip
    calc_ip( dictionaries[:docomo_ip].random ).join "."
  end
  
  # Kddiからの接続時のIPアドレスを返します
  #   返すIPは EZweb接続時のIPとなります
  #   PCサイトビューアー（PCSV)の際には異なるIPとなります
  #   2011年7月にリストが増えるようです
  # @see http://www.au.kddi.com/ezfactory/tec/spec/ezsava_ip.html
  def self.kddi_ip
    calc_ip( dictionaries[:kddi_ip].random ).join "."
  end
  
  # Softbankからの接続時のIPアドレスを返します
  #   返すIPは Yahoo!ケータイからの接続時のIPとなります
  #   PCサイトブラウザのIPアドレスは異なります
  #   SSL接続時の仕様が変わるようです(http://creation.mb.softbank.jp/web/web_ssl.html)
  # @see http://creation.mb.softbank.jp/web/web_ip.html
  def self.softbank_ip
    calc_ip( dictionaries[:softbank_ip].random ).join "."
  end
  
  private
    def self.calc_ip(ip)
      ip_array = ip.split "."
      # 最大で254
      s = ( 2 ** ( 32 - ip_array[3].split("/")[1].to_i ) ) - 2
      # 1 - 254の間で第4オクテットを生成
      ip_array[3] = (ip_array[3].to_i + (1 .. s).random).to_s
      ip_array
    end
end

