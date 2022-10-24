class AddSharedPoststoPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :shared_post
  end
end
