class ChangeTeamIdType < ActiveRecord::Migration
  def up
    change_column :players, :team_id, :integer
  end
end
