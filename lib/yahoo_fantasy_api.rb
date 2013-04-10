module YahooFantasyApi

	def yahoo_mlb_teams
		Team.get_mlb_team_details(session, current_user)
		Team.get_players(session, current_user)
		redirect_to users_path(current_user)
	end

	def move_player(team_key, player_key, position, date)
		request_body = "<?xml version='1.0' encoding='UTF-8'?><fantasy_content><roster>
		<coverage_type>date</coverage_type>
		<date>#{date}</date><players><player><player_key>#{player_key}</player_key>
		<position>#{position}</position>
		</player></players></roster></fantasy_content>"
		request_url = "http://fantasysports.yahooapis.com/fantasy/v2/team/#{team_key}/roster"
    access_token = session[:access_token]
    response = access_token.put(request_url, body = request_body, {'Content-Type'=>'application/xml'})
    data = Hash.from_xml(response.body)
    redirect_to players_path, :notice => "Successfully added player to #{position} for #{date}"
	end

	def set_lineup(user_id, team_key)
	end

end

=begin 
#if positions taken
{"error"=>{"xml:lang"=>"en-us", "yahoo:uri"=>"http://fantasysports.yahooapis.com/fantasy/v2/team/308.l.19602.t.4/roster", 
	"xmlns:yahoo"=>"http://www.yahooapis.com/v1/base.rng", "xmlns"=>"http://www.yahooapis.com/v1/base.rng", 
	"description"=>"That position has already been filled.", "detail"=>nil}}

#if success
{"fantasy_content"=>{"xml:lang"=>"en-US", "yahoo:uri"=>"http://fantasysports.yahooapis.com/fantasy/v2/team/308.l.19602.t.4/roster",
xmlns:yahoo"=>"http://www.yahooapis.com/v1/base.rng", "xmlns"=>"http://fantasysports.yahooapis.com/fantasy/v2/base.rng", 
"confirmation"=>{"status"=>"success"}}}
=end