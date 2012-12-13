class AddAccessTokenToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :token, :string, :limit => 2147483647
    add_column :authentications, :secret, :string, :limit => 2147483647
  end
end
