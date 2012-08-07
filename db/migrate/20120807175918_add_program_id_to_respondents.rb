class AddProgramIdToRespondents < ActiveRecord::Migration
  def change
	add_column :respondents, :program_id, :integer
  end
end
