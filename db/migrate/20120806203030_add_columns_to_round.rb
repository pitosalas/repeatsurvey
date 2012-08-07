class AddColumnsToRound < ActiveRecord::Migration
  def change
	add_column :rounds, :start, :integer
	add_column :rounds, :fin, :integer
  end
end
