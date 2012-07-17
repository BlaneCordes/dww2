require 'spec_helper'

describe "emails/index" do
  before(:each) do
    assign(:emails, [
      stub_model(Email,
        :email => "Email"
      ),
      stub_model(Email,
        :email => "Email"
      )
    ])
  end

  it "renders a list of emails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
