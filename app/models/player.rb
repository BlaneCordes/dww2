require 'open-uri'
class Player < ActiveRecord::Base
  attr_accessible :name, :age, :lineup_position, :eligible_position_one, :eligible_position_two, :eligible_position_three, :player_key, :roster_position, :team
  # TODO: Players can be on more than one team, need to introduce leagues
  has_many :player_articles
  has_many :player_feeds, :through => :player_articles
  has_many :statistics
  validates :name, :uniqueness => true

  def position(string)
    positions = {"1" => "Pitcher", "2" => "Catcher", "3" => "1B", "4" => "2B", "5" => "3B", "6" => "SS", "7" => "LF", "8" => "CF", "9" => "RF"}
    positions[string]
  end

  def reliever?
    if self.statistics.last.saves > 0
      true
    end
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