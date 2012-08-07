class Program < ActiveRecord::Base
  attr_accessible :name
  has_many :rounds
  has_many :questions
  has_many :respondents
end
