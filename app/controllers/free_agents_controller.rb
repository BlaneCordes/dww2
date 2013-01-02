class FreeAgentsController < ApplicationController

  def add_nfl_player
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/league/nfl.l.263673/transactions;type=add;player=273.p.9004'
    access_token = session[:access_token]
    # debugger
    response = access_token.request(:post, request_url)
    # debugger
    data = Hash.from_xml(response.body)
    # debugger
    render :json => data
  end

  def get_top_mlb_free_agents
    request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/league/mlb.l.16633;sort=AR;status=A;count=10'
    set_access_token(request_url)
  end

  def index
    @free_agents = FreeAgent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @free_agents }
    end
  end

  def show
    @free_agent = FreeAgent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @free_agent }
    end
  end

  def new
    @free_agent = FreeAgent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @free_agent }
    end
  end

  def edit
    @free_agent = FreeAgent.find(params[:id])
  end

  def create
    @free_agent = FreeAgent.new(params[:free_agent])

    respond_to do |format|
      if @free_agent.save
        format.html { redirect_to @free_agent, notice: 'Free agent was successfully created.' }
        format.json { render json: @free_agent, status: :created, location: @free_agent }
      else
        format.html { render action: "new" }
        format.json { render json: @free_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @free_agent = FreeAgent.find(params[:id])

    respond_to do |format|
      if @free_agent.update_attributes(params[:free_agent])
        format.html { redirect_to @free_agent, notice: 'Free agent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @free_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @free_agent = FreeAgent.find(params[:id])
    @free_agent.destroy

    respond_to do |format|
      format.html { redirect_to free_agents_url }
      format.json { head :no_content }
    end
  end
end
