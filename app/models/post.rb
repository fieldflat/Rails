class Post < ApplicationRecord
  has_many :comments
  # @post.comments
  validates :title, presence: true, length: {minimum: 3, message: 'Too short to post!'} #message: エラーメッセージの編集
  validates :body, presence: true
end
