require "spec_helper"

describe FreeAgentsController do
  describe "routing" do

    it "routes to #index" do
      get("/free_agents").should route_to("free_agents#index")
    end

    it "routes to #new" do
      get("/free_agents/new").should route_to("free_agents#new")
    end

    it "routes to #show" do
      get("/free_agents/1").should route_to("free_agents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/free_agents/1/edit").should route_to("free_agents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/free_agents").should route_to("free_agents#create")
    end

    it "routes to #update" do
      put("/free_agents/1").should route_to("free_agents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/free_agents/1").should route_to("free_agents#destroy", :id => "1")
    end

  end
end
