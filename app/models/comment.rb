class Comment < ApplicationRecord
  has_many :likes
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  belongs_to :post, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
end
