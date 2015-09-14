class CreatePosts < ActiveRecord::Migration
#  def change
#  end
  def up
     create_table :posts do |t|
         t.integer :user_id
         t.string :title
         t.text :body
     end
    add_foreign_key :posts, :users
  end

  def down
    drop_table :posts
   end

end
