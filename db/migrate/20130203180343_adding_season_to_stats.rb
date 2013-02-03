class AddingSeasonToStats < ActiveRecord::Migration
  def change
  	add_column :statistics, :season, :integer
  end

end
