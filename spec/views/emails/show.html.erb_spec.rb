require 'spec_helper'

describe "emails/show" do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
