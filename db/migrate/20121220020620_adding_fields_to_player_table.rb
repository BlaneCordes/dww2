class AddingFieldsToPlayerTable < ActiveRecord::Migration
  def change
    add_column :players, :eligible_positions, :string
    add_column :players, :roster_position, :string
    add_column :players, :nfl_team, :string
    add_column :players, :player_key, :string
  end
end
