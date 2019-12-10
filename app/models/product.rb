class Product < ApplicationRecord
  has_many :transactions
  has_many :orders, through: :transactions
  has_many :product_images
  has_many :variants
  has_many :variant_images, through: :variants

  validates :description, uniqueness: true
end
