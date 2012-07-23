class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name

  belongs_to :team

  # def self.scrape_yahoo_transaction_trends
  # 	transaction_trends_page = Nokogiri::HTML(open(http://baseball.fantasysports.yahoo.com/b1/buzzindex?date=2012-07-22&pos=ALL&src=combined&sort=BI_A&sdir=1))
  #   	hot_players = transaction_trends_page.css(".name").text
  #   	puts hot_players
  #   	end

end
