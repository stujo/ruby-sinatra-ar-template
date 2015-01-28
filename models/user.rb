class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :email
end  