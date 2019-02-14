class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, length: { minimum: 10 }
end
