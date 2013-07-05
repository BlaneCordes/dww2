class BaseballReferenceStats

require 'rubygems'
require 'mechanize'

  def self.perform
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }

    players = Player.all

    players.each do |player|
      a.get('http://google.com/') do |page|
        search_result = page.form_with(:name => 'f') do |search|
          search.q = "#{player.name}  baseball-reference"
          puts "Searching for #{player.name}"
        end.submit

        search_result.links.each do |link|
          puts link.text
        end
      end
    end
  end

end