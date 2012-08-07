class Question < ActiveRecord::Base
  attr_accessible :text, :order
  belongs_to :program
end
