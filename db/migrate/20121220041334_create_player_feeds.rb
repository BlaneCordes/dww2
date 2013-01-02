class CreatePlayerFeeds < ActiveRecord::Migration
  def change
    create_table :player_feed do |t|
    	t.string :title
    	t.string :description

      t.timestamps
    end
  end
end
