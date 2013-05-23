class AddGuidToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :sports_data_guid, :string
  end
end
