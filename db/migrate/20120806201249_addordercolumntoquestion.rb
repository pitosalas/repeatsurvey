class Addordercolumntoquestion < ActiveRecord::Migration
  	def change 
		add_column :questions, :order, :integer
		add_column :questions, :program_id, :integer
	end
end
