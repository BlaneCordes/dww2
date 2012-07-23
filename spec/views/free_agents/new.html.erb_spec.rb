require 'spec_helper'

describe "free_agents/new" do
  before(:each) do
    assign(:free_agent, stub_model(FreeAgent,
      :first_name => "MyString",
      :last_name => "MyString"
    ).as_new_record)
  end

  it "renders new free_agent form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => free_agents_path, :method => "post" do
      assert_select "input#free_agent_first_name", :name => "free_agent[first_name]"
      assert_select "input#free_agent_last_name", :name => "free_agent[last_name]"
    end
  end
end
