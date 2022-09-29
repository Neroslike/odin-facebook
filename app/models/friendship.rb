class Friendship < ApplicationRecord
  # Self referencing friendship system
  belongs_to :friends, class_name: 'User', foreign_key: :other_user_id
  belongs_to :pending_request, class_name: 'User', foreign_key: :other_user_id
  validates :identifier, uniqueness: true
  # Scopes
  scope :pending, -> { where(status: 'pending') }
  scope :confirmed, -> { where(status: 'confirmed') }
  scope :sent_requests, -> { where('sender_id = user_id') }
  scope :received_requests, -> { where('sender_id != user_id') }
  # Scopes
end
