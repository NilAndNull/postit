class AddPostsToUser < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index:true
  end
  add_foreign_key :posts, :users
end
