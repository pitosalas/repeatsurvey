class Program < ActiveRecord::Base
  attr_accessible :name
  has_many :round
  has_many :question
  has_many :respondent
end
