class AddIdentifierToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :identifier, :integer
  end
end
