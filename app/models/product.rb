class Product < ApplicationRecord
  belongs_to :campaign
  has_many :order_items
end
