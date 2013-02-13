class AddingTeamIdToPlayer < ActiveRecord::Migration
  def change
  	add_column :players, :team_id, :string
  end

end
