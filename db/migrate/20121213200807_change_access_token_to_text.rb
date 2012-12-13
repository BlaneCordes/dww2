class ChangeAccessTokenToText < ActiveRecord::Migration
  def change
    change_column :authentications, :token, :text, :limit => nil
  end
end
