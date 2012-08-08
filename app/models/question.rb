class Question < ActiveRecord::Base
  attr_accessible :text, :order
  belongs_to :program

  def average round
      Value.where("round_id = ? AND question_id = ?", round.id, id).average("value")
  end

  def n_respondents round
      Value.where("round_id = ? AND question_id = ?", round.id, id).count("value")
   end
end
