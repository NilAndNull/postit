class AddPostsToUser < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.references :user, index:true
    end
  end
  add_foreign_key :posts, :users
end
