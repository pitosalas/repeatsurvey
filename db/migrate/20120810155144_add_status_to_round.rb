class AddStatusToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :status, :text
  end
end
