class AddMetaDataToPlayerTable < ActiveRecord::Migration
  def change
  	add_column :players, :height, :integer
  	add_column :players, :weight, :integer
  	add_column :players, :birthdate, :date
  	add_column :players, :birthcity, :string
  	add_column :players, :birthstate, :string
  	add_column :players, :birthcountry, :string
  	add_column :players, :highschool, :string
  	add_column :players, :college, :string
  	add_column :players, :pro_debut, :date
  	add_column :players, :bat_hand, :string
  	add_column :players, :throw_hand, :string
  end
end
