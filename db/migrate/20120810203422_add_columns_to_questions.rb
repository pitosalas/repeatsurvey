class AddColumnsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :active, :text
    add_column :questions, :data_type, :text

  end
end
