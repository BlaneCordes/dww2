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
		  #PlayerFeed.player_triggers(entry)
		  end
		end
	end

	def self.find_player(entry)
		player_string = entry.title.split(' - ')
  	player_name = player_string[1].scan(/^([.a-zA-z\-]+) ([a-zA-z]+[\w|\-][a-zA-z]+)/).flatten
  	name = player_name.join(" ")
		if Player.find_by_name(name) != nil
			player = Player.find_by_name(name)
			player.id
		else
			player = Player.new
			player.name = name
			player.save!
		end
  end

  def self.player_triggers(entry)
  	text = entry.summary
	  	case
		  	when text.match(/[Ii]njur/)
		  		InjuryAlert.send_injury_alert(1).deliver
		  	when text.match(/[Nn]ot [Pp]lay/)
		  		InjuryAlert.send_injury_alert(1).deliver
		  	when text.match(/[Nn]ot be [Pp]lay/)
		  		InjuryAlert.send_injury_alert(1).deliver
		  	when text.match(/[Nn]ot in lineup/)
		  		InjuryAlert.send_injury_alert(1).deliver
				when text.match(/[Oo]ut of lineup/)
		  		InjuryAlert.send_injury_alert(1).deliver
				when text.match(/contract/)
		  		InjuryAlert.send_injury_alert(1).deliver
				when text.match(/contract/)
		  		InjuryAlert.send_injury_alert(1).deliver
			else
				puts "no update in this article"
			end
  end


end
