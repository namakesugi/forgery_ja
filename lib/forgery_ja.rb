require 'forgery'
require 'forgery_ja/forgery_ja'
require 'forgery_ja/version'
require 'forgery_ja/constant'
require 'forgery_ja/forgery_ja_api'

current_path = File.expand_path(File.dirname(__FILE__)) + '/'
Dir[current_path + 'forgery_ja/forgery_ja/**/*.rb'].uniq.each do |file|
  require file
end

ForgeryJa.load_from! "#{current_path}/forgery_ja/"
#ForgeryJa.load_from! "#{ForgeryJa.rails_root}/lib/forgery" if Forgery.rails? && Rails::VERSION::STRING < "3.0.0"
#require 'forgery_ja/forgery_ja_railtie' if ForgeryJa.rails? && Rails::VERSION::STRING >= "3.0.0"
