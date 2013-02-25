class RemoveTeamId < ActiveRecord::Migration
  def change
    remove_column :players, :team_id
  end
end
