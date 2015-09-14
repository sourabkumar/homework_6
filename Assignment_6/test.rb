require 'rubygems'
gem 'activerecord'

require 'sqlite3'
require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'

ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'w'))

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :host => "localhost",
  :database => 'db/development.db'
)

require './user'
require './post'


class App < Sinatra::Base
end

puts "full_name for user:"
full_name = gets.chomp
puts "email address:"
email = gets.chomp

#create user
user = User.create(email: email, full_name: full_name) ##create 
puts("user nil: #{user.nil?}")
puts("User created with email: #{user.email} and full_name: #{user.full_name}")

#find
puts("lets find a user")
puts("type email address of user")
user_email = gets.chomp
find_user = User.find_by(email:user_email) # read
puts("is find_user nil: #{find_user.nil?}")
puts("user retrieved with email: #{find_user.email} and full_name: #{find_user.full_name}")


#update
puts("lets update a user")
puts("type email address of user to be updated")
update_user_email = gets.chomp
update_user = User.find_by(email:update_user_email)
puts("type new email address of user")
new_user_email = gets.chomp
update_user.update(email:new_user_email)  # update


#delete
puts("lets delete a user")
puts("type email address of user to be deleted")
delete_user_email = gets.chomp
User.find_by(email:delete_user_email).delete  # delete
