class Product < ApplicationRecord
  has_many :transactions
  has_many :orders, through: :transactions
  has_many :product_images

  validates :description, uniqueness: true
end
