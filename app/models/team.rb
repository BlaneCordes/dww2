require 'open-uri'
class Team < ActiveRecord::Base
  include ApiModule
    attr_accessible :name, :team_url, :team_key
    belongs_to :user
    has_many :players


  def get_teams(session)
    request_url = "http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=#{current_user.id}/games;game_keys=mlb/teams?format=json"
    http_method = "get"
    build_request(http_method, request_url, session)
  end

  def get_team_details(session)
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;' + 'use_login=' + current_user.id.to_s + '/games;game_keys=nfl/teams;output=json'
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
    team_name = data["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"][0]["name"]
    @team.name = team_name
    @team.save
  end


end
