require 'open-uri'
class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  belongs_to :team

  def set_access_token(request_url)
  access_token = session[:access_token]
  response = access_token.request(:get,request_url)
  end

  def get_players(session, user)
    team_key = user.teams.team_key
  	request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/team/#{team_key}/roster/players;output=json'
  	set_access_token(request_url)
  	data = Hash.from_xml(response.body)
  	players = data["fantasy_content"]["team"]["roster"]["players"]["player"].each do |player|
      new_player = Player.new
      new_player.first_name = player["name"]["first"]
      new_player.last_name = player["name"]["last"]
      new_player.save
    end
  end

end