class Expense < ActiveRecord::Base
  attr_accessible :date, :name, :owner_id, :creator_id, :price
end
