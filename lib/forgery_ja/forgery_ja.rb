# coding: utf-8
require 'forgery/forgery'
class ForgeryJa < Forgery
  # merge option
  def self.default_options(option)
    {:to => ForgeryJa::KANJI}.merge(option)
  end
  # parse dictionaries data
  def self.parse(str, ret_type)
    strs = str.split(',')
    return strs if ret_type == ForgeryJa::ARRAY
    strs[ret_type]
  end
end
