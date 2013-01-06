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
		  #send email notification if player is on roster
		end
	end

	#regex should work on all name formats, only outlier is if person has two first names not
	#seperated by a hyphen i.e. John Michael Smith would cause an issue

	def self.find_player(entry)
		player_string = entry.title.split(' - ')
  	player_name = player_string[1].scan(/^([.a-zA-z\-]+) ([a-zA-z]+[\w|\-][a-zA-z]+)/).flatten
  	first_name = player_name[0]
  	last_name = player_name[1]
  	player = Player.find_by_first_name_and_last_name(first_name, last_name)
			if player.present? 
				player.id
			else
				00
			end
  end

end
