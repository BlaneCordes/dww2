require 'open-uri'
class Player < ActiveRecord::Base
  attr_accessible :name, :age, :eligible_positions, :player_key, :roster_position, :team
  # TODO: Players can be on more than one team, need to introduce leagues
  has_many :player_articles
  has_many :player_feeds, :through => :player_articles
  has_many :statistics


  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |player|
        csv << player.attributes.values_at(*column_names)
      end
    end
  end



end