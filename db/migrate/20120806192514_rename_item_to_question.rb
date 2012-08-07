class RenameItemToQuestion < ActiveRecord::Migration
	def change
	    rename_table :items, :questions
	end 
 end
