class DeleteWhoFromValues < ActiveRecord::Migration
  def change
	remove_column :values, :who
  end
end
