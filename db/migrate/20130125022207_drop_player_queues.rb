class DropPlayerQueues < ActiveRecord::Migration
  def up
  	drop_table :player_queues
  end
end
