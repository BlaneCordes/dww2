require 'open-uri'
class Team < ActiveRecord::Base
  include ApiModule
    attr_accessible :name, :team_url, :team_key, :sport
    validates_uniqueness_of :name
    belongs_to :user
    has_many :players

  # def self.get_team_details(session, user)
  #   request_url = 'http://api.cbssports.com/fantasy/pro-teams?version=2.0'
  #   access_token = session[:access_token]
  #   response = access_token.request(:get, request_url)
  #   data = Hash.from_xml(response.body)`
  #   raise data.inspect
  # end

  # def self.get_team_details(session, user)
  #   request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=nfl/teams;output=json'
  #   access_token = session[:access_token]
  #   response = access_token.request(:get, request_url)
  #   data = Hash.from_xml(response.body)
  #   team_hash = data["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"]
  #   team_hash.each do |n|
  #     team = user.teams.new
  #     team.name = n["name"]
  #     team.team_key = n["team_key"]
  #     team.save
  #   end
  # end

  def self.get_mlb_team_details(session, user)
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=mlb/teams;output=json'
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
    team_hash = data["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"]
    team = Team.new
    team.name = team_hash["name"]
    team.team_key = team_hash["team_key"]
    team.sport = "mlb"
    team.save
    user.teams << team
  end

  def self.get_players(session, user)
    user.teams.each do |team|
      team_key = team.team_key
      request_url = "http://fantasysports.yahooapis.com/fantasy/v2/team/#{team_key}/roster/players;output=json"
      access_token = session[:access_token]
      response = access_token.request(:get, request_url)
      data = Hash.from_xml(response.body)
      raise data.inspect
        players = data["fantasy_content"]["team"]["roster"]["players"]["player"].each do |player|
          name = player["name"]["full"]
          new_player = Player.find_or_create_by_name(name)
          new_player.eligible_position_one = player["eligible_positions"]["position"]
          new_player.lineup_position = player["selected_position"]["position"]
          new_player.player_key = player["editorial_player_key"]
          new_player.team_id = Team.find_by_team_key(team_key).id
          new_player.save
       end
    end
  end

end
