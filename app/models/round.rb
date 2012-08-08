class Round < ActiveRecord::Base
  attr_accessible :number, :program_id, :start, :fin
  belongs_to :program
end
