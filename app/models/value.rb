class Value < ActiveRecord::Base
  attr_accessible :question_id, :round_id, :respondent_id, :value
  belongs_to :question
  belongs_to :round
  belongs_to :respondent
end
