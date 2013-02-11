class AddingPositionsToPlayer < ActiveRecord::Migration
  def change
    rename_column :players, :eligible_positions, :eligible_position_one
    rename_column :players, :roster_position, :lineup_positon
    add_column :players, :eligible_position_two, :string
    add_column :players, :eligible_position_three, :string
    add_column :players, :eligible_position_four, :string
    add_column :players, :eligible_position_five, :string
    add_column :players, :eligible_position_six, :string
  end
end
