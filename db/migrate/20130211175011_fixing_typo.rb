class FixingTypo < ActiveRecord::Migration
  def change
    rename_column :players, :lineup_positon, :lineup_position
  end
end
