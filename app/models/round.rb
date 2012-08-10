class Round < ActiveRecord::Base
  attr_accessible :number, :program_id, :start, :fin
  belongs_to :program
  has_many :respondents, through: :values
  has_many :values
end
