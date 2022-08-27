class AddOtherUserId < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :other_user
  end
end
