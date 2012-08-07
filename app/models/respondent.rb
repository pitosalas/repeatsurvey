class Respondent < ActiveRecord::Base
  attr_accessible :name
  belongs_to :program
end
