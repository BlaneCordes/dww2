module SportsDataMlb
URL = "http://api.sportsdatallc.org"
KEY = SPORTS_DATA_CONFIG['SPORTS_DATA_MLB']
ACCESS = "t"
VERSION = "3"

  def self.three_day_schedule
  	HTTParty.get("#{URL}/mlb-#{ACCESS}#{VERSION}/schedule-3day?api_key=#{KEY}")
  end

  def self.rosters
  	HTTParty.get("#{URL}/mlb-#{ACCESS}#{VERSION}/rosters/2013.xml?api_key=#{KEY}")
  end

end