# coding: utf-8
class ForgeryJa::Date < Forgery::Date
  # the day name in Japanese
  JA_DAYS = %w{日曜日 月曜日 火曜日 水曜日 木曜日 金曜日 土曜日}
  # the abbreviated form day name in Japanese
  JA_DAYS_ABBR = %w{日 月 火 水 木 金 土}
  # the Japanese name of the month ( "WA" )
  JA_MONTHS_WA = %w{睦月 如月 弥生 卯月 皐月 水無月 文月 葉月 長月 神無月 霜月 師走}
  # the Japanese name of the month
  JA_MONTHS = %w{1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月}

  # Returns a random day name in Japanese
  # @param Hash options
  # @option options [String] :abbr (false) 短縮形を使うかどうか
  # @return String 曜日を日本語で返します
  def self.day_of_week(options={})
    options.reverse_merge!(:abbr => false)

    if options[:abbr]
      JA_DAYS_ABBR.random
    else
      JA_DAYS.random
    end
  end
  # Returns a random month name in Japanese
  # @param Hash options
  # @option options [String] :wa (false) 和名を使うかどうか
  # @return String 月の名前を日本語で返します
  def self.month(options={})
    options.reverse_merge!(:wa => false)

    if options[:wa]
      JA_MONTHS_WA.random
    else
      JA_MONTHS.random
    end
  end
end
