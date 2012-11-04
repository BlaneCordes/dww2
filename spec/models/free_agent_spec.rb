require 'spec_helper'

describe FreeAgent do
	it "should_not have a team" do
		visit '/free_agents'
    page.should have_content('Sample App')
 end
end