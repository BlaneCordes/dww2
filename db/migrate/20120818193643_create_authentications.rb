class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.references :user
      t.string :provider, :limit => 10485760
      t.string :uid, :limit => 10485760

      t.timestamps
    end
  end
end

