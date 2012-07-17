require 'spec_helper'

describe "emails/edit" do
  before(:each) do
    @email = assign(:email, stub_model(Email,
      :email => "MyString"
    ))
  end

  it "renders the edit email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => emails_path(@email), :method => "post" do
      assert_select "input#email_email", :name => "email[email]"
    end
  end
end
