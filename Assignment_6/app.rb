require 'rubygems'
gem 'activerecord'

require 'sqlite3'
require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'

#set :port, 8080  #defauly port switched to 8080

set :public_folder, 'public'
#set :views, 'templates'


ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'w'))
#ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :host => "localhost",
  :database => 'db/development.db'
)

require './user'
require './post'


class App < Sinatra::Base
#class App < Sinatra::Application
#end
  enable :logging


  get '/users' do
        @users = User.all
        #"user nil #{@users.nil?}"
	erb :users
  end

  get '/users/:id' do
        puts "id is #{@id}"
	@user = User.find_by(id:params[:id])
        puts "is @user nil #{@user.nil?}"
	@posts = Post.where(user_id:params[:id])
        puts "is @posts nil #{@posts.nil?}"
 #       puts "post info #{@posts.title}"
	erb :userDetails
       # puts "hello #{@user.email} and post info #{@posts.title}"
  end

end
