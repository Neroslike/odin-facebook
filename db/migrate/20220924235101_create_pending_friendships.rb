class CreatePendingFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :pending_friendships do |t|
      t.integer :user_id
      t.integer :other_user_id

      t.timestamps
    end
  end
end
