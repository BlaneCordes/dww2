require 'spec_helper'

describe "free_agents/index" do
  before(:each) do
    assign(:free_agents, [
      stub_model(FreeAgent,
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      stub_model(FreeAgent,
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of free_agents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
