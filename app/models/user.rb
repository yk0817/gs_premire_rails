class User < ApplicationRecord
  validates :name, presence: true
  has_many :posts

  self.has_secure_password
  # ↑参考(興味がある人向け)
  # ActiveModel::SecurePasswordのクラスメソッドを用いてる。
  # https://github.com/rails/rails/blob/b965ce361b89ad33a4a4b422f8e564233926c723/activemodel/lib/active_model/secure_password.rb#L42
  # ApplicationRecordはActiveModel::SecurePasswordを継承している
  #   [20] pry(main)> ApplicationRecord.ancestors.flat_map{|klass| [klass.to_s]}.select{|klass| klass.match(/ActiveModel::SecurePassword/)}
  # => ["ActiveModel::SecurePassword"]
end
