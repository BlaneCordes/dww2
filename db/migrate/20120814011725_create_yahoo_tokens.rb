class CreateYahooTokens < ActiveRecord::Migration
  def change
    create_table :yahoo_tokens do |t|
      t.references :user
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
