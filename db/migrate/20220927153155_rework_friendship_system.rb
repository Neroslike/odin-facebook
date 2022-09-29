class ReworkFriendshipSystem < ActiveRecord::Migration[7.0]
  def change
    drop_table :friendships
    drop_table :pending_friendships
  end
end
