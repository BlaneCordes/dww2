desc "This task is called by the Heroku scheduler add-on"


task :scrape_league_players => :environment do
    puts "Scraping the current teams from Yahoo.."
    Team.scrape_yahoo_league
    puts "done."
end

task :scrape_most_added_players => :environment do
    puts "Scraping Most Added Players.."
    FreeAgent.scrape_free_agents
    puts "done."
end

task :send_free_agent_email => :environment do
    puts "Sending free agent email.."
  	FreeAgentMailer.free_agent_email(blane).deliver
  	FreeAgentMailer.free_agent_email(User.first).deliver
  	puts "done."
end