class AddSenderIdToPendingFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :pending_friendships, :sender_id, :integer
  end
end
