class AddingColumnsToPlayerFeeds < ActiveRecord::Migration
  def change
    add_column :player_feeds, :guid, :string
    add_column :player_feeds, :url, :string
    add_column :player_feeds, :published_at, :datetime
  end
end
