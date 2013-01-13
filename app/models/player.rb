require 'open-uri'
class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :player_id, :id

  # TODO: Players can be on more than one team, need to introduce leagues 
  belongs_to :team
  has_many :player_feeds

  validates_uniqueness_of :last_name, :scope => :team_id
  validates_uniqueness_of :first_name, :scope => :team_id



end