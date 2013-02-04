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
		  PlayerFeed.player_triggers(entry)
		  end
		end
	end

	#regex should work on all name formats, only outlier is if person has two first names not
	#seperated by a hyphen i.e. John Michael Smith would cause an issue

	#TODO need to tweak regex since names are now 1 field instead of first and last
	def self.find_player(entry)
		player_string = entry.title.split(' - ')
  	player_name = player_string[1].scan(/^([.a-zA-z\-]+) ([a-zA-z]+[\w|\-][a-zA-z]+)/).flatten
  	first_name = player_name[0]
  	last_name = player_name[1]
  		if Player.find_by_first_name_and_last_name(first_name, last_name) != nil
				player.id
			else
				Player.create!(:first_name => first_name, :last_name => last_name)
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
