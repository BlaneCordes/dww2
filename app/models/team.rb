require 'open-uri'

class Team < ActiveRecord::Base
  include ApiModule

  attr_accessible :name, :team_url

  belongs_to :user
  has_many :players

  def get_teams(session)
    request_url = "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=mlb/teams?format=json"
    http_method = "get"
    build_request(http_method, request_url, session)
  end

  # 1. I am going to want to get each user's mlb fantasy team.
  # 2. I then need to pull all the players which is most likely a different API
  # call. I need to figure out how I want to do that and if I want to do that all in
  # the same call.
  # This is beginning to look like a great use of a server side JS framework
  #


  @teams = {
  :trippingolney => 'http://baseball.fantasysports.yahoo.com/b1/16633/1',
  :emiliobonerfacio => 'http://baseball.fantasysports.yahoo.com/b1/16633/2',
  :fistyuinthebumgarner => 'http://baseball.fantasysports.yahoo.com/b1/16633/3',
  :paisanoscalzones => 'http://baseball.fantasysports.yahoo.com/b1/16633/4',
  :gentianswardrobe => 'http://baseball.fantasysports.yahoo.com/b1/16633/5',
  :whowantskimbrel => 'http://baseball.fantasysports.yahoo.com/b1/16633/6',
  :thefuturegentian => 'http://baseball.fantasysports.yahoo.com/b1/16633/7',
  :highonethier => 'http://baseball.fantasysports.yahoo.com/b1/16633/8',
  :adamjonesisblack => 'http://baseball.fantasysports.yahoo.com/b1/16633/9',
  :lincecumdumpster => 'http://baseball.fantasysports.yahoo.com/b1/16633/10',
  :lyanbruanmvp => 'http://baseball.fantasysports.yahoo.com/b1/16633/11',
  :thetroutsniffers => 'http://baseball.fantasysports.yahoo.com/b1/16633/12',
}

#looping through teams
def self.scrape_yahoo_league
	@teams.each do |team, team_url|
  	@team = Team.new
  	@team.name = team
  	@team.team_url = team_url
  	team_page = Nokogiri::HTML(open("#{team_url}"))
    	players = team_page.css(".name").text
    	players.gsub!(/([A-Z][^A-Z]+)/, '\1 ')
    	players.gsub!(/([A-Z])/, '\1\2')
    	players.gsub!(/(Shin-|O') /, '\1')
    	array_players = players.split(' ')
    	array_players.each_with_index do |name,index|
    		if name == "CC"
        next
      elsif name == "Ty"
        next
        elsif name.length <= 2
          #TODO fix CC outlier
    			array_players[index] = "#{name} " + "#{array_players[index+1]}"
    			array_players.delete_at(index+1)
    		end
    	end

    	array_players.each_with_index do |player,index|
    		@player = Player.new
    		if index.even?
    			@player.first_name = player
    			@player.last_name = array_players[index+1]
    		elsif player == "De"
    				 array_players[i] = "De Aza"
    		else
    			next
    		end
    	@team.players << @player
    	end

    	@team.save
	end
end

end
