class Order < ApplicationRecord
  has_many :order_items
  belongs_to :pharmacy
  belongs_to :campaign
end
