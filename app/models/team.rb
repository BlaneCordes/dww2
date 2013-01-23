require 'open-uri'
class Team < ActiveRecord::Base
  include ApiModule
    attr_accessible :name, :team_url, :team_key
    validates_uniqueness_of :name
    belongs_to :user
    has_many :players

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |team|
        csv << team.attributes.values_at(*column_names)
      end
    end
  end

  def self.get_team_details(session, user)
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=nfl/teams;output=json'
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
    team_hash = data["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]["team"]
    team_hash.each do |n|
      team = user.teams.new
      team.name = n["name"]
      team.team_key = n["team_key"]
      team.save
    end
  end

  def self.get_players(session, user)
    user.teams.each do |team|
      team_key = team.team_key
      request_url = "http://fantasysports.yahooapis.com/fantasy/v2/team/#{team_key}/roster/players;output=json"
      access_token = session[:access_token]
      response = access_token.request(:get, request_url)
      data = Hash.from_xml(response.body)
        players = data["fantasy_content"]["team"]["roster"]["players"]["player"].each do |player|
          new_player = Player.new
          new_player.first_name = player["name"]["first"]
          new_player.last_name = player["name"]["last"]
          new_player.eligible_positions = player["eligible_positions"]["position"]
          new_player.roster_position = player["selected_position"]["position"]
          new_player.nfl_team = player["editorial_team_full_name"]
          new_player.player_key = player["editorial_player_key"]
          new_player.team_id = Team.find_by_team_key(team_key).id
          new_player.save
        end
    end
  end



end
