class Email < ActiveRecord::Base
  attr_accessible :email
  validates_uniqueness_of :email
  validates_presence_of :email
end
