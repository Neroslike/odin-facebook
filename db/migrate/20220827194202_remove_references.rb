class RemoveReferences < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :user_id
    remove_column :users, :other_user_id
  end
end
