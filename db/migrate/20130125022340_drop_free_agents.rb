class DropFreeAgents < ActiveRecord::Migration
  def up
  	drop_table :free_agents
  end
end
