require 'spec_helper'

describe "free_agents/edit" do
  before(:each) do
    @free_agent = assign(:free_agent, stub_model(FreeAgent,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit free_agent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => free_agents_path(@free_agent), :method => "post" do
      assert_select "input#free_agent_first_name", :name => "free_agent[first_name]"
      assert_select "input#free_agent_last_name", :name => "free_agent[last_name]"
    end
  end
end
