require 'open-uri'
class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :player_id, :id

  # TODO: Players can be on more than one team, need to introduce leagues 
  belongs_to :team
  has_many :player_feeds
 
  validates_uniqueness_of :last_name, :scope => :team_id
  validates_uniqueness_of :first_name, :scope => :team_id

  def player=(str)
    self.player = Player.find_or_create_by_name(player_attributes[:id]) 
  end 

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |player|
        csv << player.attributes.values_at(*column_names)
      end
    end
  end



end