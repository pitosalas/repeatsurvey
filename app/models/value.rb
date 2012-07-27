class Value < ActiveRecord::Base
  attr_accessible :item_id, :round_id, :value, :who
  belongs_to :item
  belongs_to :round

end
