class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.references :user

      t.timestamps
    end

    create_table :comments do |t|
      t.string :body
      t.references :user
      t.references :post
      t.timestamps
    end

    create_table :likes do |t|
      t.references :user
      t.references :post
      t.timestamps
    end
  end
end
