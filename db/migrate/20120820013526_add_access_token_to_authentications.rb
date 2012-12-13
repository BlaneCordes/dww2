class AddAccessTokenToAuthentications < ActiveRecord::Migration
  def change
    change_column :authentications, :token, :text, :limit => nil
    add_column :authentications, :secret, :string
  end
end
