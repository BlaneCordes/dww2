require 'spec_helper'

describe "FreeAgents" do
  describe "GET /free_agents" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get free_agents_path
      response.status.should be(200)
    end
  end
end
