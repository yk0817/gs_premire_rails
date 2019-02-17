require 'nokogiri'
require 'active_record'
require 'open-uri'
require 'pp'
require 'redis'

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",  #アダプター名
  host:     "gs-premire-rails_db_1",  #nameでも入れる。
  username: "root",  #ユーザー名
  password: "password",  #パスワード
  database:  "ruby_test",  #データベース名
)

class Headline < ActiveRecord::Base

end



$redis = Redis.new \
  url: ENV["REDIS_URL"],
  port: ENV["REDIS_PORT"]
