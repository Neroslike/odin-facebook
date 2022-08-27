class User < ApplicationRecord
  # belongs_to :user_friend, class_name: 'User', foreign_key: 'user_id', optional: true
  # has_many :friends, class_name: 'User', foreign_key: 'user_id'
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
