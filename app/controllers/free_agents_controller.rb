class FreeAgentsController < ApplicationController
  # GET /free_agents
  # GET /free_agents.json
  def index
    @free_agents = FreeAgent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @free_agents }
    end
  end

  # GET /free_agents/1
  # GET /free_agents/1.json
  def show
    @free_agent = FreeAgent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @free_agent }
    end
  end

  # GET /free_agents/new
  # GET /free_agents/new.json
  def new
    @free_agent = FreeAgent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @free_agent }
    end
  end

  # GET /free_agents/1/edit
  def edit
    @free_agent = FreeAgent.find(params[:id])
  end

  # POST /free_agents
  # POST /free_agents.json
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

  # PUT /free_agents/1
  # PUT /free_agents/1.json
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

  # DELETE /free_agents/1
  # DELETE /free_agents/1.json
  def destroy
    @free_agent = FreeAgent.find(params[:id])
    @free_agent.destroy

    respond_to do |format|
      format.html { redirect_to free_agents_url }
      format.json { head :no_content }
    end
  end
end
