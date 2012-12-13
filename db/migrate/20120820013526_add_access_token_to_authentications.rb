class AddAccessTokenToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :token, :string "provider", :limit => 2147483647
    add_column :authentications, :secret, :string
  end
end
