require 'spec_helper'

describe "email_lists/new" do
  before(:each) do
    assign(:email_list, stub_model(EmailList,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new email_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => email_lists_path, :method => "post" do
      assert_select "input#email_list_email", :name => "email_list[email]"
    end
  end
end
