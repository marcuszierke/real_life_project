class Pharmacy < ApplicationRecord
  has_many :pharmacy_files
  has_many :opening_hours
  has_many :orders
end
