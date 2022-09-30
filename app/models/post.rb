class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :likes
  has_many_attached :pictures
  has_many :comments

  # Build initial index feed by adding all posts by the current user
  # friends to the current user posts
  def self.build_feed(current_user)
    posts = current_user.posts.includes(:author, :likes)
    current_user.friends.each do |friend|
      posts = posts.or(friend.posts.includes(:author, :likes))
    end
    posts
  end
end
