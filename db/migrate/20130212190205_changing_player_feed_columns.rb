class ChangingPlayerFeedColumns < ActiveRecord::Migration
  def up
    change_column :player_feeds, :description, :text, :limit => 10485760
    change_column :player_feeds, :title, :text, :limit => 10485760
  end
end
