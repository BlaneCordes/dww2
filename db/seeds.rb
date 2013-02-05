# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

pitchers = File.open("#{Rails.root}/db/pitch2012.txt", "r")

pitchers.each_line do |line|
	array = line.split(",")
	player = Player.new
	stat = Statistic.new
		player.name = array[1].chomp.delete("#")
		player.age = array[2]
		player.team = array[3]
		stat.season = 2012
		stat.wins = array[4]
		stat.losses = array[5]
		stat.earned_run_average = array[6]
		stat.games = array[7]
		stat.games_started = array[8]
		stat.games_finished = array[9]
		stat.complete_games = array[10]
		stat.shutouts = array[11]
		stat.saves = array[12]
		stat.innings_pitched = array[13]
		stat.hits = array[14]
		stat.runs = array[15]
		stat.earned_runs = array[16]
		stat.home_runs = array[17]
		stat.walks = array[18]
		stat.intentional_walks = array[19]
		stat.strikeouts = array[20]
		stat.hit_by_pitch = array[21]
		stat.balks = array[22]
		stat.wild_pitches = array[23]
		stat.batters_faced = array[24]
		stat.walks_hits_per_innings_pitched = array[25]

		player.save
		player.statistics << stat
end

batters = File.open("#{Rails.root}/db/batter2012.txt", "r")

batters.each_line do |line|
	array = line.split(",")
	player = Player.new
	stat = Statistic.new
		player.name = array[1].chomp.delete("#")
		player.age = array[2]
		player.team = array[3]
		stat.season = 2012
		stat.games = array[4]
		stat.plate_appearances = array[5]
		stat.at_bats = array[6]
		stat.runs = array[7]
		stat.hits = array[8]
		stat.doubles = array[9]
		stat.triples = array[10]
		stat.home_runs = array[11]
		stat.runs_batted_in = array[12]
		stat.stolen_bases = array[13]
		stat.caught_stealing = array[14]
		stat.walks = array[15]
		stat.strikeouts = array[16]
		stat.batting_average = array[17]
		stat.on_base_percentage = array[18]
		stat.slugging_percentage = array[19]
		stat.on_base_plus_slugging_percentage = array[20]
		stat.total_bases = array[22]
		stat.double_plays = array[23]
		stat.hit_by_pitch = array[24]
		stat.sacrifice_flies = array[26]
		stat.intentional_walks = array[27]

		player.save
		player.statistics << stat
end


