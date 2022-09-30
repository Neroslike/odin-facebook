class AddQuoteToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :quote, :string, default: ''
  end
end
