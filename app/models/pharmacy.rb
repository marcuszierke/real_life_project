class Pharmacy < ApplicationRecord
  has_many :pharmacy_files, dependent: :destroy
  has_many :opening_hours, dependent: :destroy
  has_many :orders, dependent: :destroy
end
