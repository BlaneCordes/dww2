require 'open-uri'

class FreeAgent < ActiveRecord::Base
  attr_accessible :first_name, :last_name


	#returns all players that are currently on a team
	def self.taken_players
		free_agents = FreeAgent.all
		players = Player.all
		free_agents.keep_if do |player|
			!Player.find_by_last_name("#{player.last_name}")
	 end
	end


#scraping the yahoo transaction trends page to find the current players mostly being added
	def self.scrape_free_agents
	  transaction_trends_page = Nokogiri::HTML(open("http://baseball.fantasysports.yahoo.com/b1/buzzindex?date=#{Time.now.to_date}&pos=ALL&src=combined&sort=BI_A&sdir=1"))
	    	hot_players = transaction_trends_page.css(".name").text
	    	hot_players.gsub!(/([A-Z][^A-Z]+)/, '\1 ')
	    	hot_players.gsub!(/([A-Z])/, '\1\2')
	    	hot_players.gsub!(/(Shin-|O') /, '\1')
	    	hot_players.gsub!(/(Wei-|O') /, '\1')
	    	array_players = hot_players.split(' ')
	    	array_players.each_with_index do |name,index|
	    		if name == "CC"
	        next
	      elsif name == "Ty"
	        next
	       elsif name.length <= 2
	    			array_players[index] = "#{name} " + "#{array_players[index+1]}"
	    			array_players.delete_at(index+1)
	    		end
	    	end

			array_players.each_with_index do |player,index| 
				    		@free_agent = FreeAgent.new
				    		if index.even?
				    			@free_agent.first_name = player
				    			@free_agent.last_name = array_players[index+1]
				    		elsif player == "De"
				    				 array_players[i] = "De Aza"
				    			next
				    		end
				    	if @free_agent.first_name == nil
				    		next
				    	end
				    	@free_agent.save
					end 
				end
			end
