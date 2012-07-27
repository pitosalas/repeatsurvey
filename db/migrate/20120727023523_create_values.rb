class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.string :value
      t.string :who
      t.integer :program_id
      t.integer :round_id
      t.integer :item_id

      t.timestamps
    end
  end
end
