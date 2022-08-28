class User < ApplicationRecord
  has_many :liked_posts, class_name: 'Like', foreign_key: 'user_id'
  has_many :posts
  has_and_belongs_to_many :friends,
                          class_name: 'User',
                          join_table: 'friendships',
                          foreign_key: 'user_id',
                          association_foreign_key: 'other_user_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
