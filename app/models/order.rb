class Order < ActiveRecord::Base
  belongs_to :customer, class_name: "User"
  has_many :lines, class_name: "OrderLine"

  accepts_nested_attributes_for :lines
end
