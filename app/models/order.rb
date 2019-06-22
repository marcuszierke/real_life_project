class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :pharmacy
  belongs_to :campaign
end
