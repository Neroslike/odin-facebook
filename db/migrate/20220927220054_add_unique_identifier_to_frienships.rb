class AddUniqueIdentifierToFrienships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :identifier, :string
  end
end
