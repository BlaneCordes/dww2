class PlayerFeed < ActiveRecord::Base
	attr_accessible :guid, :description, :title, :url, :published_at, :player_id
	belongs_to :player


	def self.update_from_feed(feed_url)
		feed = Feedzirra::Feed.fetch_and_parse(feed_url)
		feed.entries.each do |entry|
		  unless exists? :guid => entry.id
		    create!(
		      :title        => entry.title,
		      :description  => entry.summary,
		      :url          => entry.url,
		      :published_at => entry.published,
		      :guid         => entry.id,
		      :player_id    => find_player(entry)
		    )
		  end
		end
	end

	#TODO need to update regular expression for weird names like I used to have ie McCann

	def self.find_player(entry)
		player_string = entry.title.split(' - ')
  	player_name = player_string[1].scan(/([A-Z][a-z]+\s)/).join.chop.split(" ")
  	first_name = player_name[0]
  	last_name = player_name[1]
  	player = Player.where(:first_name => first_name, :last_name => last_name)
			if player.present? 
				player.id
			else
				0
			end
  end

end
