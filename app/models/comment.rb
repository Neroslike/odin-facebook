class Comment < ApplicationRecord
  has_many :likes
  has_one_attached :picture
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  belongs_to :post, optional: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  scope :original_comment, -> { where(parent_id: nil) }

  def assign_identifier
    id = parent_id.nil? ? 1 : (parent.identifier + 1)
    update_attribute(:identifier, id)
  end
end
