class Expense < ActiveRecord::Base
  attr_accessible :date, :name, :owner_id, :creator_id, :price

  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
end
