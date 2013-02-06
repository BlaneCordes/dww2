class CreatePlayerArticles < ActiveRecord::Migration
  def change
    create_table :player_articles do |t|
    	t.integer :player_id
    	t.integer :player_feed_id

      t.timestamps
    end
  end
end
