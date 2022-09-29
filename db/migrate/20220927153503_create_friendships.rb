class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :other_user_id
      t.string :status
      t.integer :sender_id

      t.timestamps
    end
  end
end
