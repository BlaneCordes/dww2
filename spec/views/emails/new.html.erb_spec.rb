require 'spec_helper'

describe "emails/new" do
  before(:each) do
    assign(:email, stub_model(Email,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => emails_path, :method => "post" do
      assert_select "input#email_email", :name => "email[email]"
    end
  end
end
