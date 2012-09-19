class AuthenticationsController < ApplicationController
require 'json'

  def index
    @authentications = current_user.authentications
    get_nfl_leagues
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authentications }
    end
  end

  def create
    ap request.env['omniauth.auth']
    auth = request.env['omniauth.auth']
    session[:access_token] = auth["extra"]["access_token"]

    #TODO: Need to either save the access_token here or persist it somewhere else
    #Access is an OAuth object so I may be able to inherit it somehow
    user = current_user.authentications.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
      Authentication.create!(
        :user_id => current_user.id,
        :provider => auth["provider"],
        :uid => auth["uid"], :token => auth["credentials"]["token"],
        :secret => auth["credentials"]["secret"]
    )
    redirect_to user_path(current_user), :notice => "Connected with Yahoo!"
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication"
    redirect_to users_path(current_user)
  end

  def current_user_info
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;' + 'use_login=' + current_user.id.to_s
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
    render :json => data
  end

  def get_team_key
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;' + 'use_login=' + current_user.id.to_s + '/games;game_keys=nfl/teams;output=json'
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
    teams = data["fantasy_content"]["users"]["user"]["games"]["game"]["teams"]

    teams["team"].map do |team|
      team_key = team["team_key"]
    end
  end

  
  def get_nfl_leagues
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;' + 'use_login=' + current_user.id.to_s + '/games;game_keys=nfl/teams;output=json'
    set_access_token(request_url)

    #TODO 
    #Iterate through the hash and create leagues and teams for the user
  end

  def get_nfl_players
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/team/nfl.l.182102.t.5/roster/players;format=json'
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
    players_hash = data["fantasy_content"]["team"]["roster"]["players"]
  end
  

  def get_mlb_leagues
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;' + 'use_login=' + current_user.id.to_s + '/games;game_keys=mlb/teams;output=json'
    set_access_token(request_url)
  end

  def get_my_mlb_players
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/team/mlb.l.182102.t.5/roster/players;output=json'
    set_access_token(request_url)
  end

  def get_top_mlb_free_agents
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/league/mlb.l.16633;sort=AR;status=A;count=10'
    set_access_token(request_url)
  end

  def get_mlb_player(player_name=nil)
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/league/mlb.l.16633/players;search=frazier/ownership'
    set_access_token(request_url)
  end

  def get_player_ownership(player_name)
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/league/mlb.l.16633/players;search=________/percent_owned'
    set_access_token(request_url)
  end

  def set_access_token(request_url)
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
    render :json => data
  end
end

