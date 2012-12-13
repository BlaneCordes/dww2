class ChangeAccessTokenToText < ActiveRecord::Migration
  def change
    change_column :authentication, :token, :text, :limit => nil
  end
end
