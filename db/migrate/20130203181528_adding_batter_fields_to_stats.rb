class AddingBatterFieldsToStats < ActiveRecord::Migration
  def change
  	add_column :statistics, :plate_appearances, :integer
  	add_column :statistics, :at_bats, :integer
  	add_column :statistics, :doubles, :integer
  	add_column :statistics, :triples, :integer
  	add_column :statistics, :runs_batted_in, :integer
  	add_column :statistics, :stolen_bases, :integer
  	add_column :statistics, :caught_stealing, :integer
  	add_column :statistics, :batting_average, :float
  	add_column :statistics, :on_base_percentage, :float  	
  	add_column :statistics, :slugging_percentage, :float  	
  	add_column :statistics, :on_base_plus_slugging_percentage, :float  	
  	add_column :statistics, :total_bases, :integer  		
  	add_column :statistics, :double_plays, :integer  	
  	add_column :statistics, :sacrifice_flies, :integer  	
  end
end
