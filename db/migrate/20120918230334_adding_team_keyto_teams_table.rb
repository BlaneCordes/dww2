class AddingTeamKeytoTeamsTable < ActiveRecord::Migration
  def change
    add_column :teams, :team_key, :integer
  end
end
