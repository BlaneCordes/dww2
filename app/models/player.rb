require 'open-uri'
class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  belongs_to :team

  def set_access_token(request_url)
  access_token = session[:access_token]
  response = access_token.request(:get,request_url)
  end

  def self.parse_players
  	#get the xml returned page
  	#iterate through the page

  	request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/team/nfl.l.182102.t.5/roster/players;output=json'
  	set_access_token(request_url)
  	data = Hash.from_xml(response.body)
  	render :json => data["fantasy_content"]["users"]["user"]["guid"]
  end

end