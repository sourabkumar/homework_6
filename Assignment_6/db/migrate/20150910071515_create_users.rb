class CreateUsers < ActiveRecord::Migration
# def change
#  end
  def up
     create_table :users do |t|
        t.string :email, :null => false
        t.string :full_name
     end
  end

  def down
      drop table :users
  end
end
