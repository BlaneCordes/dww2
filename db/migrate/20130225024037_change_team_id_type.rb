class ChangeTeamIdType < ActiveRecord::Migration
  def up
    change_column :players, :team_id, :integer, :default => nil
  end
end
