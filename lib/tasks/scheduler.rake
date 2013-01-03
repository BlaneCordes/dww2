desc "This task is called by the Heroku scheduler add-on"


task :grab_nfl_player_news => :environment do
    puts "Grabbing latest rotoworld nfl player updates.."
    PlayerFeed.update_from_feed("http://www.rotoworld.com/rss/feed.aspx?sport=nfl&ftype=news&format=rss")
    puts "done."
end

task :grab_mlb_player_news => :environment do
    puts "Grabbing latest rotoworld mlb player updates.."
    PlayerFeed.update_from_feed("http://www.rotoworld.com/rss/feed.aspx?sport=mlb&ftype=news&format=rss")
    puts "done."
end

task :send_free_agent_email => :environment do
    puts "Sending free agent email.."
  	FreeAgentMailer.free_agent_email(User.blane).deliver
  	FreeAgentMailer.free_agent_email(User.first).deliver
  	puts "done."
end
