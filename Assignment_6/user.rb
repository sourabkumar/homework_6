require 'rubygems'
gem 'activerecord'

require 'sqlite3'
require 'active_record'

class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	validates :full_name, presence: true
	has_many :posts
end

