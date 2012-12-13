class AddAccessTokenToAuthentications < ActiveRecord::Migration
  def change
    add_column :authentications, :token, :string, :limit => 10485760
    add_column :authentications, :secret, :string, :limit => 10485760
  end
end
