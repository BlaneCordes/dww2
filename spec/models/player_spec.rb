require 'spec_helper'

describe Player do
   it "should have the content" do
    visit '/players'
    page.should have_content
  end
end
