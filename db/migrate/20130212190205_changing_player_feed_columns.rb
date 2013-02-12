class ChangingPlayerFeedColumns < ActiveRecord::Migration
  def up
    change_column :player_feeds, :description, :text
    change_column :player_feeds, :title, :text
  end
end
