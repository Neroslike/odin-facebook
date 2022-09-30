class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :school, :string, default: ''
    add_column :users, :high_school, :string, default: ''
    add_column :users, :college, :string, default: ''
    add_column :users, :university, :string, default: ''
    add_column :users, :profession, :string, default: ''
  end
end
