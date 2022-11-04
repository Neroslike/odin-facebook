class AddDefaults < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :occupation, :string, default: ''
    change_column :users, :country, :string, default: ''
    change_column :users, :birthday, :date, default: ''
    change_column :users, :school, :string, default: ''
    change_column :users, :company, :string, default: ''
  end
end
