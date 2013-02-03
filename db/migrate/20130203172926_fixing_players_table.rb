class FixingPlayersTable < ActiveRecord::Migration
  def up
  	add_column :players, :name, :string
  	add_column :players, :team, :string
  	add_column :players, :age, :integer
  end

  def down
  	remove_column :players, :first_name
  	remove_column :players, :last_name
  	remove_column :players, :team_id
  	remove_column :players, :nfl_team
  end
end
