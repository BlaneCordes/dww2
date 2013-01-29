class DropPages < ActiveRecord::Migration
  def up
		drop_table :pages
	end
end
