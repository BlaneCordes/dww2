class AddingColumnsToPlayerFeeds < ActiveRecord::Migration
  def change
    add_column :player_feed, :guid, :string
    add_column :player_feed, :url, :string
    add_column :player_feed, :published_at, :datetime
  end
end
