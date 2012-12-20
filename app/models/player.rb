require 'open-uri'
class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  belongs_to :team
  validates_uniqueness_of :last_name, :scope => :team_id
  validates_uniqueness_of :first_name, :scope => :team_id



end