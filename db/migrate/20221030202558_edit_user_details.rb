class EditUserDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :school
    remove_column :users, :high_school
    remove_column :users, :college
    remove_column :users, :university
    remove_column :users, :profession

    add_column :users, :occupation, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :school, :string
    add_column :users, :company, :string
  end
end
