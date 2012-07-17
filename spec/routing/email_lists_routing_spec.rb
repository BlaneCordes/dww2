require "spec_helper"

describe EmailListsController do
  describe "routing" do

    it "routes to #index" do
      get("/email_lists").should route_to("email_lists#index")
    end

    it "routes to #new" do
      get("/email_lists/new").should route_to("email_lists#new")
    end

    it "routes to #show" do
      get("/email_lists/1").should route_to("email_lists#show", :id => "1")
    end

    it "routes to #edit" do
      get("/email_lists/1/edit").should route_to("email_lists#edit", :id => "1")
    end

    it "routes to #create" do
      post("/email_lists").should route_to("email_lists#create")
    end

    it "routes to #update" do
      put("/email_lists/1").should route_to("email_lists#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/email_lists/1").should route_to("email_lists#destroy", :id => "1")
    end

  end
end
