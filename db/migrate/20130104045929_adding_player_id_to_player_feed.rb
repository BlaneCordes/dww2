class AddingPlayerIdToPlayerFeed < ActiveRecord::Migration
  def change
    add_column :player_feed, :player_id, :integer
  end
end
