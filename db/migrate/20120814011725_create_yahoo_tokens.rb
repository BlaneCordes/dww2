class CreateYahooTokens < ActiveRecord::Migration
  def change
    create_table :yahoo_tokens do |t|

      t.timestamps
    end
  end
end
