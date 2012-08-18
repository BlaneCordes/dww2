class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authentications }
    end
  end

  def create
    ap request.env['omniauth.auth']
    auth = request.env['omniauth.auth']
    user = current_user.authentications.find_by_provider_and_uid(auth["provider"], auth["uid"]) ||
      Authentication.create!(:user_id => current_user.id, :provider => auth["provider"], :uid => auth["uid"])
    redirect_to user_path(current_user), :notice => "Connected with Yahoo!"
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication"
    redirect_to users_path(current_user)
  end
end





