class EmailListsController < ApplicationController
  # GET /email_lists
  # GET /email_lists.json
  def index
    @email_lists = EmailList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @email_lists }
    end
  end

  # GET /email_lists/1
  # GET /email_lists/1.json
  def show
    @email_list = EmailList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email_list }
    end
  end

  # GET /email_lists/new
  # GET /email_lists/new.json
  def new
    @email_list = EmailList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_list }
    end
  end

  # GET /email_lists/1/edit
  def edit
    @email_list = EmailList.find(params[:id])
  end

  # POST /email_lists
  # POST /email_lists.json
  def create
    @email_list = EmailList.new(params[:email_list])

    respond_to do |format|
      if @email_list.save
        format.html { redirect_to @email_list, notice: 'Email list was successfully created.' }
        format.json { render json: @email_list, status: :created, location: @email_list }
      else
        format.html { render action: "new" }
        format.json { render json: @email_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /email_lists/1
  # PUT /email_lists/1.json
  def update
    @email_list = EmailList.find(params[:id])

    respond_to do |format|
      if @email_list.update_attributes(params[:email_list])
        format.html { redirect_to @email_list, notice: 'Email list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_lists/1
  # DELETE /email_lists/1.json
  def destroy
    @email_list = EmailList.find(params[:id])
    @email_list.destroy

    respond_to do |format|
      format.html { redirect_to email_lists_url }
      format.json { head :no_content }
    end
  end
end
