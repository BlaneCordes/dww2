# Load the rails application
require File.expand_path('../application', __FILE__)

require "/Users/blanecordes/dww2/db/sports_data_rosters.rb"

# Initialize the rails application
Dww2::Application.initialize!

# set ActionMailer’s delivery method to SMTP
