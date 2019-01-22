require 'nokogiri'
require 'active_record'
require 'open-uri'
require 'pp'

ActiveRecord::Base.establish_connection(
  adapter:  "mysql2",  #アダプター名
  host:     "gs-premire-rails_db_1",  #nameでも入れる。
  username: "root",  #ユーザー名
  password: "password",  #パスワード
  database: "ruby_study",  #データベース名
)
