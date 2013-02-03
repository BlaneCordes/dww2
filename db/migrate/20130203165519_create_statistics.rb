class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
    	t.integer :player_id
    	t.integer	:wins
    	t.integer :losses
    	t.float :earned_run_average
    	t.integer :games
    	t.integer :games_started
    	t.integer :games_finished
    	t.integer :complete_games
    	t.integer :shutouts
    	t.integer :saves
    	t.float :innings_pitched
    	t.integer :hits
    	t.integer :runs
    	t.integer :earned_runs
    	t.integer :home_runs
    	t.integer :walks
    	t.integer :intentional_walks
    	t.integer :strikeouts
    	t.integer :hit_by_pitch
    	t.integer :balks
    	t.integer :wild_pitches
    	t.integer :batters_faced
    	t.float :walks_hits_per_innings_pitched

      t.timestamps
    end
  end
end
