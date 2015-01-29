class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :value, index: true
      t.references :voteable, polymorphic: true, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :users
    add_index :votes, [:user_id, :voteable_id, :voteable_type], :unique => true
  end
end
