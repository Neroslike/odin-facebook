class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :likes
  has_many_attached :pictures
  has_many :comments
end
