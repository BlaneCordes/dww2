class ChangeTeamIdType < ActiveRecord::Migration
  def change
    change_column :players, :team_id, :integer
  end
end
