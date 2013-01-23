class UsersController < ApplicationController
  before_filter :authorize, :only => [:index, :destroy]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.csv { render text: @users.to_csv }
    end
  end

  def leagues
    @user = current_user
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/leagues'
    access_token = session[:access_token]
    response = access_token.request(:get, request_url)
    data = Hash.from_xml(response.body)
    render :json => data["fantasy_content"]
  end


  def show
    @user = User.find(params[:id])
    # @response = current_user.get_nfl if current_user.authentications.any?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end

