class AuthenticationsController < ApplicationController
require 'json'

  def index
    @authentications = current_user.authentications
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authentications }
    end
  end

  def create
   auth = request.env['omniauth.auth']
   session[:access_token] = auth["extra"]["access_token"]

    #TODO: Need to either save the access_token here or persist it somewhere else
    user = current_user.authentications.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
      Authentication.create!(
        :user_id => current_user.id,
        :provider => auth["provider"],
        :uid => auth["uid"], :token => auth["credentials"]["token"],
        :secret => auth["credentials"]["secret"]
    )

    #grab the users teams and rosters
    #set up delayed job to do this so user is not slowed down on the authentication
    redirect_to user_path(current_user), :notice => "Connected with Yahoo!"
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication"
    redirect_to users_path(current_user)
  end
  
  def get_nfl_leagues
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;' + 'use_login=' + current_user.id.to_s + '/games;game_keys=nfl/teams;output=json'
    set_access_token(request_url)
  end

  def get_nfl_players
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/team/nfl.l.263673.t.9/roster/players;format=json'
    set_access_token(request_url)
  end

  def get_mlb_leagues
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;' + 'use_login=' + current_user.id.to_s + '/games;game_keys=mlb/teams;output=json'
    set_access_token(request_url)
  end

  def get_my_mlb_players
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/team/mlb.l.182102.t.5/roster/players;output=json'
    set_access_token(request_url)
  end

  def get_nfl_league_transactions
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/league/nfl.l.263673/transactions'
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    render response
    # data = Hash.from_xml(response.body)
    # player = data["fantasy_content"]["league"]["transactions"]["transaction"]["players"]["player"]["name"]["full"]
    # render :json => data["fantasy_content"]["league"]["transactions"]["transaction"][0]["players"]["player"][0]["name"]["full"]
  end

  def set_access_token(request_url)
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
  end
end

