class AddReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :user
  end
end
