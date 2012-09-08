class AuthenticationsController < ApplicationController
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

  def get_nfl_leagues
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=nfl/teams;output=json'
    set_access_token(request_url)
  end

  def get_mlb_leagues
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/users;use_login=1/games;game_keys=mlb/teams;output=json'
    set_access_token(request_url)
  end

  def set_access_token(request_url)
    access_token = session[:access_token]
    response = access_token.request(:get,request_url)
    render :json => response.body
    #This json is causing an error because it is being output in XML
    #I need to figure out how to pass in a param so that it returns me json
    #or I convert xml to json
  end
end





