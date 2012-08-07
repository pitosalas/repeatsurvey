class ChangeValuesTable < ActiveRecord::Migration
  def change
	remove_column :values, :item_id
	add_column :values, :question_id, :integer
	remove_column :values, :program_id
	add_column :values, :respondent_id, :integer
  end
end
