class Program < ActiveRecord::Base
  attr_accessible :name
  has_many :round
end