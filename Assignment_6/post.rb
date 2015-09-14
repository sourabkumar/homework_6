require 'rubygems'
gem 'activerecord'

require 'sqlite3'
require 'active_record'

class Post < ActiveRecord::Base
	belongs_to :user
end

