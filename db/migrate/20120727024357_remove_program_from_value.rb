class RemoveProgramFromValue < ActiveRecord::Migration
	def change 
		remove_column :values, :program
	end
end
