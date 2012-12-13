class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user
      t.string :provider, :limit => 2147483647
      t.string :uid, :limit => 2147483647

      t.timestamps
    end
  end
end

