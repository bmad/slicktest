class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :email
  acts_as_authentic
end
