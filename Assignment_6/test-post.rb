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

puts "add a post for a user - specify email for user"
user_email = gets.chomp
user = User.find_by(email:user_email)
puts "is user nil #{user.nil?}"
puts "Let's add a post title for user #{user.full_name}"
title = gets.chomp
puts "post body"
body = gets.chomp
puts "user id #{user.id}"
#user_id = #{user.id}
post = Post.create(user_id: user.id, title: title, body: body)

