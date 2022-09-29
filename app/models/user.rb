class User < ApplicationRecord
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'
  has_many :posts
  has_many :comments

  # Self referencing friendship system
  has_many :friendship_list, -> { confirmed }, foreign_key: :user_id, class_name: 'Friendship'
  has_many :pending_list, -> { pending }, foreign_key: :user_id, class_name: 'Friendship'
  has_many :friends, through: :friendship_list
  has_many :pending_requests, through: :pending_list do
    def sent
      where('sender_id = user_id')
    end

    def received
      where('sender_id != user_id')
    end
  end
  # has_many :friendlies, foreign_key: :other_user_id, class_name: 'Friendship'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def send_friend_request(user)
    Friendship.create(user_id: id, other_user_id: user.id, status: 'pending', sender_id: id, identifier: "#{id}_to_#{user.id}")
    Friendship.create(user_id: user.id, other_user_id: id, status: 'pending', sender_id: id, identifier: "#{user.id}_to_#{id}")
  end

  def accept_friend_request(user)
    friend1 = pending_list.where(other_user_id: user.id)[0]
    friend2 = user.pending_list.where(other_user_id: id)[0]
    friend1.update_attribute(:status, 'confirmed') unless friend1.sender_id == id
    friend2.update_attribute(:status, 'confirmed') unless friend2.sender_id == id
  rescue StandardError => e
    print e
  end

  def pending_friend_of?(user)
    pending_requests.include?(user)
  end

  def friend_of?(user)
    friends.include?(user)
  end

  def remove_pending_request(user)
    pending_requests.delete(user)
    user.pending_requests.delete(self)
  end

  def remove_friend(user)
    friends.delete(user)
    user.friends.delete(self)
  end
end
