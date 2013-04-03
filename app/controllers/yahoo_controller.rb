class YahooController < ApplicationController

	def yahoo_mlb_teams
		Team.get_mlb_team_details(session, current_user)
		Team.get_players(session, current_user)
		redirect_to users_path(current_user)
	end

	def bench_player
		request_body = "<?xml version='1.0' encoding='UTF-8'?><fantasy_content><roster><coverage_type>date</coverage_type><date>2013-04-03</date><players><player><player_key>mlb.p.8629</player_key><position>3B</position></player></players></roster></fantasy_content>"
		request_url = 'http://fantasysports.yahooapis.com/fantasy/v2/team/308.l.19602.t.4/roster'
    access_token = session[:access_token]
    response = access_token.put(request_url, body = request_body, {'Content-Type'=>'application/xml'})
    data = Hash.from_xml(response.body)
    raise data.inspect
	end
end
